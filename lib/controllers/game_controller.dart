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
}