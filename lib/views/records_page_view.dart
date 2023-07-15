// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:round_six/models/enums/constants.dart';
import 'package:round_six/models/game_play_model.dart';
import 'package:round_six/models/game_settings_model.dart';
import 'package:round_six/widgets/mode_title_widget.dart';
import 'package:round_six/widgets/points_list.dart';

class RecordsPageView extends StatefulWidget {
  const RecordsPageView({
    Key? key,
    required this.gamePlay,
  }) : super(key: key);

  final GamePlay gamePlay;

  @override
  State<RecordsPageView> createState() => _RecordsPageViewState();
}

class _RecordsPageViewState extends State<RecordsPageView> {
  getModo() {
    return widget.gamePlay.mode == Mode.normal ? 'Normal' : 'Round 6';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pontuações'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ModeTitleWidget(text: getModo()),
          Expanded(child: PointsListWidget(list: GameSettingsModel.levels)),
        ],
      ),
    );
  }
}
