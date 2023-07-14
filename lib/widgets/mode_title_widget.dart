// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:round_six/theme/theme.dart';

class ModeTitleWidget extends StatefulWidget {
  const ModeTitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<ModeTitleWidget> createState() => _ModeTitleWidgetState();
}

class _ModeTitleWidgetState extends State<ModeTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 48.0),
      child: Text(
        'Modo ${widget.text}',
        style: TextStyle(
          color: RoundSixTheme.mainColor,
          fontSize: 30.0,
        ),
      ),
    );
  }
}
