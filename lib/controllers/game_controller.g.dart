// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameController on GameControllerBase, Store {
  Computed<bool>? _$fullMoveComputed;

  @override
  bool get fullMove =>
      (_$fullMoveComputed ??= Computed<bool>(() => super.fullMove,
              name: 'GameControllerBase.fullMove'))
          .value;

  late final _$gameCardsAtom =
      Atom(name: 'GameControllerBase.gameCards', context: context);

  @override
  List<GameOption> get gameCards {
    _$gameCardsAtom.reportRead();
    return super.gameCards;
  }

  @override
  set gameCards(List<GameOption> value) {
    _$gameCardsAtom.reportWrite(value, super.gameCards, () {
      super.gameCards = value;
    });
  }

  late final _$scoreAtom =
      Atom(name: 'GameControllerBase.score', context: context);

  @override
  int get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  late final _$winAtom = Atom(name: 'GameControllerBase.win', context: context);

  @override
  bool get win {
    _$winAtom.reportRead();
    return super.win;
  }

  @override
  set win(bool value) {
    _$winAtom.reportWrite(value, super.win, () {
      super.win = value;
    });
  }

  late final _$lossAtom =
      Atom(name: 'GameControllerBase.loss', context: context);

  @override
  bool get loss {
    _$lossAtom.reportRead();
    return super.loss;
  }

  @override
  set loss(bool value) {
    _$lossAtom.reportWrite(value, super.loss, () {
      super.loss = value;
    });
  }

  @override
  String toString() {
    return '''
gameCards: ${gameCards},
score: ${score},
win: ${win},
loss: ${loss},
fullMove: ${fullMove}
    ''';
  }
}
