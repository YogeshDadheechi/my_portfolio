import 'package:flutter/material.dart';

class WordCursorText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration speed;

  const WordCursorText({required this.text, required this.style, required this.speed, Key? key}) : super(key: key);

  @override
  _WordCursorTextState createState() => _WordCursorTextState();
}

class _WordCursorTextState extends State<WordCursorText> with SingleTickerProviderStateMixin {
  late String displayedText = "";
  late List<String> words;
  int currentWordIndex = 0;

  @override
  void initState() {
    super.initState();
    words = widget.text.split(" ");
    _typeNextWord();
  }

  void _typeNextWord() async {
    if (currentWordIndex < words.length) {
      for (int i = 0; i <= words[currentWordIndex].length; i++) {
        setState(() {
          displayedText = words.sublist(0, currentWordIndex).join(" ") +
              (currentWordIndex > 0 ? " " : "") +
              words[currentWordIndex].substring(0, i) +
              "_"; // moving underscore
        });
        await Future.delayed(widget.speed);
      }
      currentWordIndex++;
      if (currentWordIndex < words.length) {
        _typeNextWord();
      } else {
        // last word typed, blink cursor 3 times using same speed
        for (int j = 0; j < 4; j++) {
          setState(() {
            displayedText = widget.text + "_";
          });
          await Future.delayed(widget.speed);
          setState(() {
            displayedText = widget.text;
          });
          await Future.delayed(widget.speed);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      displayedText,
      style: widget.style,
    );
  }
}
