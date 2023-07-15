// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:round_six/models/enums/constants.dart';
import 'package:round_six/theme/theme.dart';
import 'package:round_six/widgets/moviment_indicator_widget.dart';
import 'package:round_six/widgets/text_button_widget.dart';

class GameScoreWidget extends StatelessWidget {
  const GameScoreWidget({
    Key? key,
    required this.mode,
  }) : super(key: key);

  final Mode mode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MovimentIndicatorWidget(
              icon: mode == Mode.normal
                  ? Icon(Icons.touch_app_rounded)
                  : Icon(Icons.my_location, color: RoundSixTheme.mainColor),
              count: 18),
          Image.asset('images/robo.png', width: 80.0),
          TextButtonWidget(
            onTap: () {
              Navigator.pop(context);
            },
            text: Text(
              'Sair',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
