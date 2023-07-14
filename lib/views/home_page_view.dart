// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:round_six/models/enums/constants.dart';
import 'package:round_six/theme/theme.dart';
import 'package:round_six/views/level_page_view.dart';
import 'package:round_six/widgets/logo_widget.dart';
import 'package:round_six/widgets/start_button_widget.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    showLevel(Modo modo) async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LevelPageView(modo: modo),
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoWidget(),
            StartButtonWidget(
              color: Colors.white,
              title: 'Modo Normal',
              onPressed: () => showLevel(Modo.normal),
            ),
            StartButtonWidget(
              color: RoundSixTheme.mainColor,
              title: 'Modo Round 6',
              onPressed: () => showLevel(Modo.round6),
            ),
          ],
        ),
      ),
    );
  }
}
