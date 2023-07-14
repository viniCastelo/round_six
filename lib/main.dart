import 'package:flutter/material.dart';
import 'package:round_six/theme/theme.dart';
import 'package:round_six/views/home_page_view.dart';

void main() {
  runApp(const App());
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
