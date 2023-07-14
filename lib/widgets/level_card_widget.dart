// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:round_six/models/enums/constants.dart';
import 'package:round_six/theme/theme.dart';

class LevelCardWidget extends StatelessWidget {
  LevelCardWidget({
    required this.modo,
    required this.level,
    this.onTap,
    super.key,
  });

  int level;
  Modo modo;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: RoundSixTheme.background,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: modo == Modo.normal ? Colors.white : RoundSixTheme.mainColor,
            width: 4.0,
          ),
        ),
        child: Center(
          child: Text(
            level.toString(),
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
