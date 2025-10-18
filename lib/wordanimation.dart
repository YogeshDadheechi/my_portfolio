import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DimLineShimmerText extends StatefulWidget {
  final String text;
  final double fontSize;
  final Duration flashDuration;   // flash kitni der chale
  final Duration lineDuration;    // line kitni der me chale
  final Duration delay;           // har cycle ke baad wait
  final double dimOpacity;
  final double bandWidth;
  final Color textColor;

  const DimLineShimmerText({
    super.key,
    required this.text,
    this.fontSize = 24.0,
    this.flashDuration = const Duration(seconds: 7),
    this.lineDuration = const Duration(seconds: 3),
    this.delay = const Duration(seconds: 15),
    this.dimOpacity = 0.35,
    this.bandWidth = 0.12,
    this.textColor = const Color(0xff0a7fff),
  });

  @override
  State<DimLineShimmerText> createState() => _DimLineShimmerTextState();
}

class _DimLineShimmerTextState extends State<DimLineShimmerText>
    with SingleTickerProviderStateMixin {
  late AnimationController _lineController;
  Timer? _timer;
  bool _isFlashing = false; // flash ho raha hai ya nahi
  bool _isLineActive = false; // line chal rahi hai ya nahi

  @override
  void initState() {
    super.initState();
    _lineController =
        AnimationController(vsync: this, duration: widget.lineDuration);

    _startCycle();
  }

  void _startCycle() {
    // step 1 → flash start
    setState(() => _isFlashing = true);

    // flash khatam hone ke baad line start karo
    _timer = Timer(widget.flashDuration, () {
      setState(() {
        _isFlashing = false;
        _isLineActive = true;
      });

      _lineController.forward(from: 0).whenComplete(() {
        setState(() => _isLineActive = false);

        // line complete hone ke baad delay lo
        _timer = Timer(widget.delay, () {
          _startCycle(); // phir se cycle shuru
        });
      });
    });
  }

  @override
  void dispose() {
    _lineController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = GoogleFonts.rubik(
      fontSize: widget.fontSize,
      fontWeight: FontWeight.w800,
      color: widget.textColor,
    );

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        // Base text (flash effect applied here)
        AnimatedOpacity(
          opacity: _isFlashing ? 0.10 : 1.0,
          duration: const Duration(milliseconds: 50),
          child: Text(widget.text, style: baseStyle),
        ),

        // Line shimmer only jab active ho
        if (_isLineActive)
          AnimatedBuilder(
            animation: _lineController,
            builder: (_, __) {
              final t = _lineController.value * 2 - 1; // -1..1
              final bw = widget.bandWidth.clamp(0.04, 0.4);

              final gradient = LinearGradient(
                begin: Alignment(-1 + t, -1 + t),
                end: Alignment(1 + t, 1 + t),
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(widget.dimOpacity),
                  Colors.transparent,
                ],
                stops: [0.5 - bw, 0.5, 0.5 + bw],
              );

              return ShaderMask(
                shaderCallback: (bounds) => gradient.createShader(bounds),
                blendMode: BlendMode.srcIn,
                child: Text(widget.text, style: baseStyle),
              );
            },
          ),
      ],
    );
  }
}
