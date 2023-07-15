// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round_six/controllers/game_controller.dart';
import 'package:round_six/models/enums/constants.dart';
import 'package:round_six/models/game_play_model.dart';
import 'package:round_six/theme/theme.dart';
import 'package:round_six/views/game_page_view.dart';

class LevelCardWidget extends StatelessWidget {
  LevelCardWidget({
    required this.gamePlay,
    super.key,
  });

  GamePlay gamePlay;

  startGame(BuildContext context) {
    context.read<GameController>().startGame(gamePlay: gamePlay);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GamePageView(gamePlay: gamePlay),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => startGame(context),
      child: Container(
        decoration: BoxDecoration(
          color: RoundSixTheme.background,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: gamePlay.mode == Mode.normal
                ? Colors.white
                : RoundSixTheme.mainColor,
            width: 4.0,
          ),
        ),
        child: Center(
          child: Text(
            gamePlay.level.toString(),
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
