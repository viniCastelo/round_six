// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:round_six/controllers/game_controller.dart';

class MovimentIndicatorWidget extends StatefulWidget {
  const MovimentIndicatorWidget({
    Key? key,
    required this.icon,
    required this.provider,
  }) : super(key: key);

  final Icon icon;
  final GameController provider;

  @override
  State<MovimentIndicatorWidget> createState() =>
      _MovimentIndicatorWidgetState();
}

class _MovimentIndicatorWidgetState extends State<MovimentIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.icon,
        Observer(builder: (_) => Text(widget.provider.score.toString())),
      ],
    );
  }
}
