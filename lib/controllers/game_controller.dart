// ignore_for_file: depend_on_referenced_packages, prefer_final_fields, unused_field

import 'package:mobx/mobx.dart';
import 'package:round_six/models/enums/constants.dart';
import 'package:round_six/models/game_option_model.dart';
import 'package:round_six/models/game_play_model.dart';
import 'package:round_six/models/game_settings_model.dart';

part 'game_controller.g.dart';

class GameController = GameControllerBase with _$GameController;

abstract class GameControllerBase with Store {
  @observable
  List<GameOption> gameCards = [];

  @observable
  int score = 0;

  @observable
  bool win = false;

  @observable
  bool loss = false;

  late GamePlay _gamePlay;
  List<GameOption> _choice = [];
  List<Function> _choiceCallback = [];
  int _hits = 0;
  int _pairNumbers = 0;

  @computed
  bool get fullMove => (_choice.length == 2);

  _resetScore() {
    _gamePlay.mode == Mode.normal ? score = 0 : score = _gamePlay.level;
  }

  _generateCards() {
    List<int> cardOptions = GameSettingsModel.cardOptions.sublist(0)..shuffle();
    cardOptions = cardOptions.sublist(0, _pairNumbers);
    gameCards = [...cardOptions, ...cardOptions]
        .map(
          (option) => GameOption(
            option: option,
            matched: false,
            selected: false,
          ),
        )
        .toList();
    gameCards.shuffle();
  }

  startGame({required GamePlay gamePlay}) {
    _gamePlay = gamePlay;
    _hits = 0;
    _pairNumbers = (_gamePlay.level / 2).round();
    win = false;
    loss = false;
    _resetScore();
    _generateCards();
  }

  _resetMove() {
    _choice = [];
    _choiceCallback = [];
  }

  _updateScore() {
    _gamePlay.mode == Mode.normal ? score++ : score--;
  }

  _checkResultModeNormal(bool allMatched) async {
    await Future.delayed(
        const Duration(milliseconds: 1500), () => win == allMatched);
  }

  _chancesOver() {
    return score < _pairNumbers - _hits;
  }

  _checkResultModeRound6(bool allMatched) async {
    if (_chancesOver()) {
      await Future.delayed(
          const Duration(milliseconds: 400), () => loss = true);
    }
    if (allMatched && score >= 0) {
      await Future.delayed(
          const Duration(milliseconds: 1250), () => win == allMatched);
    }
  }

  _checkGameResult() async {
    bool allMatched = _hits == _pairNumbers;
    if (_gamePlay.mode == Mode.normal) {
      await _checkResultModeNormal(allMatched);
    } else {
      await _checkResultModeRound6(allMatched);
    }
  }

  comparChoises() async {
    if (fullMove) {
      if (_choice[0].option == _choice[1].option) {
        _hits++;
        _choice[0].matched = true;
        _choice[1].matched = true;
      } else {
        await Future.delayed(
          const Duration(milliseconds: 1500),
          () {
            for (var i in [0, 1]) {
              _choice[i].selected = false;
              _choiceCallback[i]();
            }
          },
        );
      }
      _resetMove();
      _updateScore();
      _checkGameResult();
    }
  }

  toChose(GameOption option, Function resetCard) async {
    option.selected = true;
    _choice.add(option);
    _choiceCallback.add(resetCard);
    await comparChoises();
  }

  restartGame() {
    startGame(gamePlay: _gamePlay);
  }

  nextLevel() {
    int levelIndex = 0;

    if (_gamePlay.level != GameSettingsModel.levels.last) {
      levelIndex = GameSettingsModel.levels.indexOf(_gamePlay.level) + 1;
    }

    _gamePlay.level = GameSettingsModel.levels[levelIndex];
    startGame(gamePlay: _gamePlay);
  }
}
