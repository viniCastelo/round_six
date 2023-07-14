// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:round_six/models/enums/constants.dart';
import 'package:round_six/theme/theme.dart';
import 'package:round_six/views/records_page_view.dart';
import 'package:round_six/widgets/level_card_widget.dart';

class LevelPageView extends StatelessWidget {
  LevelPageView({
    required this.modo,
    super.key,
  });

  Modo modo;

  @override
  Widget build(BuildContext context) {
    showRecords(Modo modo) async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecordsPageView(modo: modo),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Nível do Jogo'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              tooltip: 'Pontuações',
              color: RoundSixTheme.mainColor,
              onPressed: () => showRecords(modo),
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
          children: [
            LevelCardWidget(modo: modo, level: 6),
            LevelCardWidget(modo: modo, level: 8),
            LevelCardWidget(modo: modo, level: 10),
            LevelCardWidget(modo: modo, level: 12),
            LevelCardWidget(modo: modo, level: 16),
            LevelCardWidget(modo: modo, level: 18),
            LevelCardWidget(modo: modo, level: 20),
            LevelCardWidget(modo: modo, level: 24),
            LevelCardWidget(modo: modo, level: 28),
          ],
        ),
      ),
    );
  }
}
