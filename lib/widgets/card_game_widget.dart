// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, unnecessary_null_comparison
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round_six/controllers/game_controller.dart';
import 'package:round_six/models/enums/constants.dart';
import 'package:round_six/models/game_option_model.dart';
import 'package:round_six/theme/theme.dart';

class CardGameWidget extends StatefulWidget {
  const CardGameWidget({
    Key? key,
    required this.mode,
    required this.gameOption,
  }) : super(key: key);

  final Mode mode;
  final GameOption gameOption;

  @override
  State<CardGameWidget> createState() => _CardGameWidgetState();
}

class _CardGameWidgetState extends State<CardGameWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  AssetImage getImage(double angle) {
    if (angle > 0.5 * pi) {
      return AssetImage('images/${widget.gameOption.option.toString()}.png');
    } else {
      return widget.mode == Mode.normal
          ? const AssetImage('images/card_normal.png')
          : const AssetImage('images/card_round.png');
    }
  }

  flipCard() {
    final game = context.read<GameController>();
    if (!animation.isAnimating &&
        !widget.gameOption.matched &&
        !widget.gameOption.selected &&
        !game.fullMove) {
      animation.forward();
      game.toChose(widget.gameOption, resetCard);
    }
  }

  resetCard() {
    if (mounted) {
      animation.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final angle = animation.value * pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(angle);
        return GestureDetector(
          onTap: () => flipCard(),
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: widget.mode == Mode.normal
                      ? Colors.white
                      : RoundSixTheme.mainColor,
                  width: 2.0,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: getImage(angle),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
