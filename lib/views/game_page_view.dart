// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:round_six/controllers/game_controller.dart';
import 'package:round_six/models/enums/constants.dart';
import 'package:round_six/models/game_option_model.dart';
import 'package:round_six/models/game_play_model.dart';
import 'package:round_six/models/game_settings_model.dart';
import 'package:round_six/widgets/card_game_widget.dart';
import 'package:round_six/widgets/feedback_game_widget.dart';
import 'package:round_six/widgets/game_score_widget.dart';

class GamePageView extends StatelessWidget {
  const GamePageView({
    Key? key,
    required this.gamePlay,
  }) : super(key: key);

  final GamePlay gamePlay;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: GameScoreWidget(mode: gamePlay.mode),
      ),
      body: Observer(
        builder: (context) {
          if (controller.win) {
            return FeedbackGameWidget(result: Result.approved);
          } else if (controller.loss) {
            return FeedbackGameWidget(result: Result.gameOver);
          } else {
            return Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount:
                    GameSettingsModel.gameBoardAxisCount(gamePlay.level),
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                padding: EdgeInsets.all(24.0),
                children: controller.gameCards
                    .map(
                      (GameOption go) => CardGameWidget(
                        mode: gamePlay.mode,
                        gameOption: go,
                      ),
                    )
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
