import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/wordanimation.dart';
import 'dart:async';
import 'cursoranimation.dart';
class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> with TickerProviderStateMixin {
  String _selected = "About";
  bool Thememode = true;

  late AnimationController _outerController;
  late AnimationController _innerController;
  late AnimationController _cursorController;

  @override
  void initState() {
    super.initState();

    // Outer clockwise rotation
    _outerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 35),
    )..repeat();

    // Inner anticlockwise rotation
    _innerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();

    _cursorController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }


  @override
  void dispose() {
    _outerController.dispose();
    _innerController.dispose();
    super.dispose();
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.only(
              top: 25, left: 150, right: 150, bottom: 20),
          decoration: BoxDecoration(
            gradient: Thememode
                ? const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff0D1D2D), Color(0xff103875)],
            )
                : const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.white],
            ),
          ),
          child: Column(
            children: [
              // 🔹 Top Menu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side name
                  Row(
                    children: [
                      Text(
                        "Yogesh ",
                        style: TextStyle(
                          color: Thememode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 23,
                        ),
                      ),
                      const Text(
                        "Dadhich",
                        style: TextStyle(
                          color: Color(0xff0a7fff),
                          fontWeight: FontWeight.w900,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),

                  // Right side menu
                  Row(
                    children: [
                      _buildMenuItem("About"),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      _buildMenuItem("Skills"),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      _buildMenuItem("Experience"),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      _buildMenuItem("Projects"),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      _buildMenuItem("Certification"),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      _buildMenuItem("Contact"),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),

                      // Theme switch button
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFF0740F1),
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 1,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF0740F1),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() => {Thememode = !Thememode});
                          },
                          icon: Thememode
                              ? const Icon(Icons.light_mode_outlined,
                              color: Colors.white)
                              : const Icon(Icons.dark_mode_outlined,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // 🔹 Profile with Rings
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer Ring
                      AnimatedBuilder(
                        animation: _outerController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: -_outerController.value * 2 * pi,
                            child: CustomPaint(
                              size: const Size(250, 250),
                              painter:
                              FuturisticRingPainter(ringType: RingType.outer),
                            ),
                          );
                        },
                      ),

                      // Inner Ring
                      AnimatedBuilder(
                        animation: _innerController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _innerController.value * 2 * pi,
                            child: CustomPaint(
                              size: const Size(205, 205),
                              painter:
                              FuturisticRingPainter(ringType: RingType.inner),
                            ),
                          );
                        },
                      ),

                      // Profile Image
                      const CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage("assets/images/profile.jpg"),
                      ),
                    ],
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width * 0.28),

                  Container(
                    width: MediaQuery.of(context).size.width * 0.31,
                    child: Column(
                      children: [
                        SizedBox(
                            height:
                            MediaQuery.of(context).size.width * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "+3",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontFamily: "Montserrat"),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  "Years",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 15,
                                      color: Colors.white54),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Experience",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 15,
                                      color: Colors.white54),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "+2",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontFamily: "Montserrat"),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  "Projects",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 15,
                                      color: Colors.white54),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Completed",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 15,
                                      color: Colors.white54),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "+30",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontFamily: "Montserrat"),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  "Happy",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 15,
                                      color: Colors.white54),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Clients",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 15,
                                      color: Colors.white54),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First line: Name with moving underscore
                  Row(
                    children: [
                      // SizedBox(
                      //   width: 300.0,
                      //   child: AnimatedTextKit(
                      //     animatedTexts: [
                      //       TyperAnimatedText(
                      //         "Hi I'm Yogesh Dadhich",
                      //         textStyle: const TextStyle(
                      //           color: Colors.white,
                      //           fontFamily: "Montserrat",
                      //           fontWeight: FontWeight.w900,
                      //           fontSize: 24,
                      //         ),
                      //         speed: const Duration(milliseconds: 100),
                      //       ),
                      //     ],
                      //     totalRepeatCount: 1,
                      //     pause: const Duration(milliseconds: 500),
                      //   ),
                      // ),

                      // // ✅ Blinking Cursor yaha lagao
                      // const BlinkingCursor(
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 24,
                      //     fontWeight: FontWeight.w900,
                      //   ),
                      // ),

                       SizedBox(height: 60),
                      WordCursorText(
                        text: "Hi, I'm Yogesh Dadhich",
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 29,
                            letterSpacing: 1,
                          ),
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),

                    ],
                  ),


                  // WordCursorText(
                  //   text: "Flutter Developer UI/UX Designer",
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  //   speed: Duration(milliseconds: 100),
                  // ),


                  SizedBox(height:5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                  Baseline(baseline: 22.9, baselineType:TextBaseline.alphabetic,
                    child:   Icon(Icons.work,size:16,color:Colors.white),
                  ),
                    SizedBox(width:7),
                    Text(
                      "Software Engineer",
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 21.2,

                          ),
                      )
                    )
                  ]),
                  SizedBox(height: 17,),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Baseline(baseline: 22.9, baselineType:TextBaseline.alphabetic,
                          child:   Icon(Icons.location_on,size:16,color:Colors.white),
                        ),
                        SizedBox(width:7),
                        Text(
                            "Laxmangarh, Sikar, Rajasthan",
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 21.2,

                              ),
                            )
                        )
                      ]),
                  SizedBox(height: 17,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerText(
                        text: "Mobile Apps Developer",
                        fontSize: 24.2,
                        duration: const Duration(seconds: 3), // slower and smooth shine
                      ),
                    ],
                  ),




                  // Second line: Role with moving underscore
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: 300.0,
                  //       child: AnimatedTextKit(
                  //         animatedTexts: [
                  //           TyperAnimatedText(
                  //             "Flutter Developer",
                  //             textStyle: const TextStyle(
                  //               color: Colors.white70,
                  //               fontFamily: "Montserrat",
                  //               fontWeight: FontWeight.w500,
                  //               fontSize: 20,
                  //             ),
                  //             speed: const Duration(milliseconds: 100),
                  //             cursor: "_", // ✅ underscore as moving cursor
                  //           ),
                  //         ],
                  //         totalRepeatCount: 1,
                  //         pause: const Duration(milliseconds: 500),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),









            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title) {
    bool isSelected = _selected == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = title;
        });
      },
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: Thememode
              ? (isSelected ? Colors.white : Colors.white70)
              : (isSelected ? Colors.blueAccent : Colors.black87),
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
          fontSize: isSelected ? 17 : 16,
          decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
          decorationColor: Thememode ? Colors.white : Colors.blueAccent,
          decorationThickness: 2,
        ),
      ),
    );
  }
}

enum RingType { outer, inner }

// 🔹 Custom Painter for Rings
class FuturisticRingPainter extends CustomPainter {
  final RingType ringType;

  FuturisticRingPainter({required this.ringType});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF00E5FF), Color(0xFF1E90FF)],
      ).createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.5);

    final outlinePaint = Paint()
      ..color = paint.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    const gapAngle = 0.3;
    int symbolCount = ringType == RingType.outer ? 3 : 2;
    final step = 2 * pi / symbolCount;
    final radius = size.width / 2 - 5;

    for (int i = 0; i < symbolCount; i++) {
      final start = i * step + gapAngle / 2;
      final sweep = step - gapAngle;

      // arc
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        start,
        sweep,
        false,
        paint,
      );

      // symbols
      final pos = Offset(
        center.dx + radius * cos(i * step),
        center.dy + radius * sin(i * step),
      );

      if (ringType == RingType.outer) {
        switch (i) {
          case 0:
            canvas.drawCircle(pos, 3, outlinePaint..color = Colors.cyanAccent);
            break;
          case 1:
            _drawDiamond(canvas, pos, 4, outlinePaint..color = Colors.cyanAccent);
            break;
          case 2:
            _drawPlus(canvas, pos, 4, outlinePaint..color = Colors.cyanAccent);
            break;
        }
      } else {
        switch (i) {
          case 0:
            canvas.drawCircle(pos, 3, outlinePaint..color = Colors.cyanAccent);
            break;
          case 1:
            _drawPlus(canvas, pos, 4, outlinePaint..color = Colors.cyanAccent);
            break;
        }
      }
    }
  }

  void _drawDiamond(Canvas canvas, Offset c, double s, Paint paint) {
    final path = Path()
      ..moveTo(c.dx, c.dy - s)
      ..lineTo(c.dx + s, c.dy)
      ..lineTo(c.dx, c.dy + s)
      ..lineTo(c.dx - s, c.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  void _drawPlus(Canvas canvas, Offset c, double s, Paint paint) {
    final p = Paint()
      ..color = paint.color
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(c.dx, c.dy - s), Offset(c.dx, c.dy + s), p);
    canvas.drawLine(Offset(c.dx - s, c.dy), Offset(c.dx + s, c.dy), p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


class BlinkingCursor extends StatefulWidget {
  final TextStyle? style;
  final String symbol;

  const BlinkingCursor({
    Key? key,
    this.style,
    this.symbol = "_", // default underscore
  }) : super(key: key);

  @override
  _BlinkingCursorState createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<BlinkingCursor> {
  bool _visible = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _visible = !_visible;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      child: Text(
        widget.symbol,
        style: widget.style ??
            const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
      ),
    );
  }
}
