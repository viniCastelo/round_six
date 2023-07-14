// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:round_six/models/enums/constants.dart';
import 'package:round_six/theme/theme.dart';

class CardGameWidget extends StatelessWidget {
  const CardGameWidget({
    Key? key,
    required this.modo,
  }) : super(key: key);

  final Modo modo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: modo == Modo.normal ? Colors.white : RoundSixTheme.mainColor,
          width: 3.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          modo == Modo.normal
              ? 'images/card_normal.png'
              : 'images/card_round.png',
        ),
      ),
    );
  }
}
