// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:round_six/theme/theme.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30.0),
          child: Image.asset(
            'images/robo.png',
            width: 204.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: RichText(
            text: TextSpan(
              text: 'Round 6 ',
              style:
                  DefaultTextStyle.of(context).style.copyWith(fontSize: 30.0),
              children: [
                TextSpan(
                  text: 'Memory',
                  style: TextStyle(color: RoundSixTheme.color),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
