import 'package:flutter/material.dart';

class TimelineLine extends StatelessWidget {
  final int dotsCount;
  final double lineHeight;

  const TimelineLine({
    super.key,
    this.dotsCount = 4,
    this.lineHeight = 400,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3, // line thickness
      height: lineHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueAccent.withOpacity(0.5),
            Colors.blueAccent.withOpacity(0.8),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(dotsCount, (index) {
              return Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.6),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
