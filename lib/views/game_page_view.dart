// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:round_six/models/game_play_model.dart';
import 'package:round_six/models/game_settings_model.dart';
import 'package:round_six/widgets/card_game_widget.dart';
import 'package:round_six/widgets/game_score_widget.dart';

class GamePageView extends StatelessWidget {
  const GamePageView({
    Key? key,
    required this.gamePlay,
  }) : super(key: key);

  final GamePlay gamePlay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: GameScoreWidget(mode: gamePlay.mode),
      ),
      body: Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: GameSettingsModel.gameBoardAxisCount(gamePlay.level),
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          padding: EdgeInsets.all(24.0),
          children: List.generate(
            gamePlay.level,
            (index) => CardGameWidget(
              mode: gamePlay.mode,
              option: 1,
            ),
          ),
        ),
      ),
    );
  }
}
