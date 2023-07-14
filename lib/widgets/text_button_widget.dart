// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: text,
    );
  }
}
