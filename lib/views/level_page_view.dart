// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:round_six/models/game_play_model.dart';
import 'package:round_six/models/game_settings_model.dart';
import 'package:round_six/theme/theme.dart';
import 'package:round_six/views/records_page_view.dart';
import 'package:round_six/widgets/level_card_widget.dart';

class LevelPageView extends StatelessWidget {
  const LevelPageView({
    required this.gamePlay,
    super.key,
  });

  final GamePlay gamePlay;

  @override
  Widget build(BuildContext context) {
    showRecords(GamePlay gamePlay) async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecordsPageView(gamePlay: gamePlay),
        ),
      );
    }

    final levels = GameSettingsModel.levels
        .map(
          (n) => LevelCardWidget(
            gamePlay: GamePlay(mode: gamePlay.mode, level: n),
          ),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Nível do Jogo'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              tooltip: 'Pontuações',
              color: RoundSixTheme.mainColor,
              onPressed: () => showRecords(gamePlay),
              icon: Icon(Icons.workspace_premium_outlined),
              splashRadius: 20.0,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 48.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(24.0),
          children: levels,
        ),
      ),
    );
  }
}
