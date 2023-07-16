// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round_six/controllers/game_controller.dart';

import 'package:round_six/models/enums/constants.dart';
import 'package:round_six/theme/theme.dart';
import 'package:round_six/widgets/start_button_widget.dart';

class FeedbackGameWidget extends StatelessWidget {
  const FeedbackGameWidget({
    Key? key,
    required this.result,
  }) : super(key: key);

  final Result result;

  String getResult() =>
      result == Result.approved ? 'Você Ganhou! 🏆' : '☠️ GAME OVER ☠️';

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 60.0,
      ),
      child: Column(
        children: [
          Text(
            getResult(),
            style: TextStyle(fontSize: 30.0),
          ),
          SizedBox(height: 24.0),
          result == Result.gameOver
              ? Image.asset('images/loss.png')
              : Image.asset('images/win.png'),
          result == Result.gameOver
              ? StartButtonWidget(
                  color: RoundSixTheme.mainColor,
                  title: 'Tentar novamente',
                  onPressed: () => controller.restartGame(),
                )
              : StartButtonWidget(
                  color: Colors.white,
                  title: 'Próximo nível',
                  onPressed: () => controller.nextLevel(),
                ),
        ],
      ),
    );
  }
}
