import 'dart:math';

import 'package:flutter/material.dart';

class AiThinkerLoader extends StatefulWidget {
  const AiThinkerLoader({super.key});

  @override
  State<AiThinkerLoader> createState() => _AiThinkerLoaderState();
}

class _AiThinkerLoaderState extends State<AiThinkerLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            final offset = sin((_controller.value * 2 * 3.14) + (i * 0.6)) * 6;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Transform.translate(
                offset: Offset(0, -offset),
                child: Dot(),
              ),
            );
          },
        );
      }),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(radius: 5, backgroundColor: Colors.deepPurple);
  }
}
