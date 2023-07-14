// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class MovimentIndicatorWidget extends StatefulWidget {
  const MovimentIndicatorWidget({
    Key? key,
    required this.icon,
    required this.count,
  }) : super(key: key);

  final Icon icon;
  final int count;

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
        Text(' ${widget.count.toString()}'),
      ],
    );
  }
}
