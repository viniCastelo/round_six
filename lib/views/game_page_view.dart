// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:round_six/models/enums/constants.dart';
import 'package:round_six/theme/theme.dart';
import 'package:round_six/widgets/card_game_widget.dart';
import 'package:round_six/widgets/moviment_indicator_widget.dart';
import 'package:round_six/widgets/text_button_widget.dart';

class GamePageView extends StatelessWidget {
  const GamePageView({
    Key? key,
    required this.modo,
    required this.level,
  }) : super(key: key);

  final Modo modo;
  final int level;

  int getAxisCount() {
    if (level < 10) {
      return 2;
    } else if (level == 10 || level == 12 || level == 18) {
      return 3;
    }
    return 4;
  }

  int getRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(15);
    if (randomNumber == 0) {
      return 1;
    }
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(context),
      body: Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: getAxisCount(),
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          padding: EdgeInsets.all(24.0),
          children: List.generate(
            level,
            (index) => CardGameWidget(
              modo: modo,
              opcao: getRandomNumber(),
            ),
          ),
        ),
      ),
    );
  }

  _appBarWidget(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MovimentIndicatorWidget(
                icon: modo == Modo.normal
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
      ),
    );
  }
}
