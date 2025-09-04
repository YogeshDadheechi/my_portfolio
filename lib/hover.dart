

import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;

  const HoverText({Key? key, required this.text, this.onTap}) : super(key: key);

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 200),
          style: TextStyle(
            color: Colors.white70,
            fontSize: 15,
            fontWeight: _isHovered ? FontWeight.bold : FontWeight.w500,
            decoration: _isHovered ? TextDecoration.underline : TextDecoration.none,

            decorationColor: Colors.white,
            decorationThickness: 3,
          ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}
