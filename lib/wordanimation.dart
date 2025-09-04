import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShimmerText extends StatefulWidget {
  final String text;
  final double fontSize;
  final Duration duration;

  const ShimmerText({
    super.key,
    required this.text,
    this.fontSize = 24.0,
    this.duration = const Duration(seconds: 2),
  });

  @override
  _ShimmerTextState createState() => _ShimmerTextState();
}

class _ShimmerTextState extends State<ShimmerText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            final gradient = LinearGradient(
              begin: Alignment(-1.0 - 0.3 + _controller.value * 2, -1),
              end: Alignment(1.0 + 0.3 + _controller.value * 2, 1),
              colors: [
                Colors.white.withOpacity(0.5), // dim
                Colors.white, // bright shine
                Colors.white.withOpacity(0.5), // dim
              ],
              stops: const [0.4, 0.5, 0.6],
            );
            return gradient.createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: Text(
            widget.text,
            style: GoogleFonts.rubik(
              fontSize: widget.fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
