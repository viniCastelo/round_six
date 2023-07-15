import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round_six/controllers/game_controller.dart';
import 'package:round_six/theme/theme.dart';
import 'package:round_six/views/home_page_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<GameController>(
          create: (context) => GameController(),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Round 6 Memory',
      debugShowCheckedModeBanner: false,
      theme: RoundSixTheme.theme,
      home: const HomePageView(),
    );
  }
}
