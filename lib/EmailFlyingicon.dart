import 'dart:async';
import 'package:flutter/material.dart';

class EmailFlyIcon extends StatefulWidget {
  const EmailFlyIcon({super.key});

  @override
  State<EmailFlyIcon> createState() => _EmailFlyIconState();
}

class _EmailFlyIconState extends State<EmailFlyIcon>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _isEmail = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // auto start har 5 sec
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      _animateFly();
    });

    _animateFly(); // first time start
  }

  void _animateFly() async {
    if (!_isEmail) return;
    setState(() => _isEmail = false);

    await _controller.forward();

    await Future.delayed(const Duration(milliseconds: 800));
    _controller.reset();
    setState(() => _isEmail = true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final morphAnimation =
    CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    return SizedBox(
      height: 60,
      width: 60,
      child: AnimatedBuilder(
        animation: morphAnimation,
        builder: (context, child) {
          final progress = morphAnimation.value;

          // icon morphing ka illusion
          // 0 → email, 0.5 → transition, 1 → airplane
          IconData icon;
          if (progress < 0.5) {
            icon = Icons.email;
          } else {
            icon = Icons.send;
          }

          // thoda sa rotation aur scale for "folding" effect
          final rotation = progress * 1.2; // radians
          final scale = 1.0 - (0.3 * (progress - 0.5).abs());

          return Transform.rotate(
            angle: rotation,
            child: Transform.scale(
              scale: scale,
              child: Icon(
                icon,
                size: 32,
                color: const Color(0xff006cfa),
              ),
            ),
          );
        },
      ),
    );
  }
}
