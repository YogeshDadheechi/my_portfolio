import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/wordanimation.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'dart:async';
import 'EmailFlyingicon.dart';
import 'crousalslider.dart';
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

  final aboutKey = GlobalKey();
  final SkillsKey = GlobalKey();
  final ExperienceKey = GlobalKey();
  final ProjectsKey = GlobalKey();
  final CertificationKey = GlobalKey();
  final ContactKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  // final List<Map<String, dynamic>> Skills = [
  //   {"name": "Flutter", "icon": FontAwesomeIcons.flutter,"Color":Color(0xff006cfa)}, // ✅ available
  //   {"name": "Dart", "icon": FontAwesomeIcons.code,"Color":Color(0xff006cfa)}, // ❌ dartLang nahi hai, alternate diya
  //   {"name": "React-Native", "icon": FontAwesomeIcons.react,"Color":Color(0xff006cfa)},
  //   {"name": "JavaScript", "icon": FontAwesomeIcons.js,"Color":Color(0xff006cfa)}, // ✅ correct name
  //   {"name": "TypeScript", "icon": FontAwesomeIcons.code,"Color":Color(0xff006cfa)}, // ❌ typescript missing, alternate
  //   {"name": "Android Studio", "icon": FontAwesomeIcons.android,"Color":Color(0xff006cfa)},
  //   {"name": "Vs Code", "icon": FontAwesomeIcons.codeBranch,"Color":Color(0xff006cfa)}, // ❌ vsco nahi hota, alternate
  //   {"name": "Oops", "icon": FontAwesomeIcons.gears,"Color":Color(0xff006cfa)}, // ❌ nfcDirectional missing, alternate
  //   {"name": "Postman", "icon": FontAwesomeIcons.envelope,"Color":Color(0xff006cfa)}, // ❌ signsPost missing, alternate
  //   {"name": "Restful Api's", "icon": FontAwesomeIcons.networkWired,"Color":Color(0xff006cfa)},
  //   {"name": "Firebase", "icon": FontAwesomeIcons.fire,"Color":Color(0xff006cfa)},
  //   {"name": "GitHub", "icon": FontAwesomeIcons.github,"Color":Color(0xff006cfa)},
  //   {"name": "Design Patterns", "icon": FontAwesomeIcons.pencilRuler,"Color":Color(0xff006cfa)},
  //   {"name": "Debugging", "icon": FontAwesomeIcons.bug,"Color":Color(0xff006cfa)},
  //   {"name": "Social SDK", "icon": FontAwesomeIcons.peopleGroup,"Color":Color(0xff006cfa)},
  //   {"name": "Play Store", "icon": FontAwesomeIcons.googlePlay,"Color":Color(0xff006cfa)},
  //   {"name": "Indus App Store", "icon": FontAwesomeIcons.store,"Color":Color(0xff006cfa)},
  //   {"name": "C++", "icon": FontAwesomeIcons.c,"Color":Color(0xff006cfa)},
  //   {"name": "Java", "icon": FontAwesomeIcons.coffee,"Color":Color(0xff006cfa)},
  // ];

  // final List<Map<String, dynamic>> Skills = [
  //   {"name": "Flutter", "icon": SimpleIcons.flutter, "color": Color(0xFF02569B)},
  //   {"name": "Dart", "icon": SimpleIcons.dart, "color": Color(0xFF0175C2)},
  //   {"name": "React Native", "icon": SimpleIcons.react, "color": Color(0xFF61DAFB)},
  //   {"name": "JavaScript", "icon": SimpleIcons.javascript, "color": Color(0xFFF7DF1E)},
  //   {"name": "TypeScript", "icon": SimpleIcons.typescript, "color": Color(0xFF3178C6)},
  //   {"name": "Android Studio", "icon": SimpleIcons.androidstudio, "color": Color(0xFF3DDC84)},
  //   {"name": "VS Code", "icon": SimpleIcons.abbrobotstudio, "color": Color(0xFF007ACC)},
  //   {"name": "OOPs", "icon": SimpleIcons.jetbrains, "color": Color(0xFF000000)},
  //   {"name": "Postman", "icon": SimpleIcons.postman, "color": Color(0xFFFF6C37)},
  //   {"name": "RESTful APIs", "icon": SimpleIcons.apollographql, "color": Color(0xFF311C87)},
  //   {"name": "Firebase", "icon": SimpleIcons.firebase, "color": Color(0xFFFFCA28)},
  //   {"name": "GitHub", "icon": SimpleIcons.github, "color": Color(0xFFFFFFFF)},
  //   {"name": "Design Patterns", "icon": SimpleIcons.abbott, "color": Color(0xFFFF0000)},
  //   {"name": "Debugging", "icon": SimpleIcons.bugcrowd, "color": Color(0xFFFF5500)},
  //   {"name": "Social SDK", "icon": SimpleIcons.facebook, "color": Color(0xFF1877F2)},
  //   {"name": "Play Store", "icon": SimpleIcons.googleplay, "color": Color(0xFF34A853)},
  //   {"name": "Indus App Store", "icon": SimpleIcons.googleplay, "color": Color(0xFF34A853)},
  //   {"name": "C++", "icon": SimpleIcons.cplusplus, "color": Color(0xFF00599C)},
  //   {"name": "Java", "icon": SimpleIcons.javascript, "color": Color(0xFF007396)},
  // ];

  final List<Map<String, dynamic>> Skills = [
    {
      "name": "Flutter",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg"
    },
    {
      "name": "Dart",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dart/dart-original.svg"
    },
    {
      "name": "React Native",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg"
    },
    {
      "name": "JavaScript",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg"
    },
    {
      "name": "TypeScript",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg"
    },
    {
      "name": "Android Studio",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/androidstudio/androidstudio-original.svg"
    },
    {
      "name": "VS Code",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg"
    },
    {
      "name": "OOPs",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg"
    },
    {
      "name": "Postman",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postman/postman-original.svg"
    },
    {
      "name": "RESTful APIs",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/graphql/graphql-plain.svg"
    },
    {
      "name": "Firebase",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg"
    },
    {
      "name": "GitHub",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg"
    },
    {
      "name": "Design Patterns",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/adobephotoshop/adobephotoshop-original.svg"
    },
    {
      "name": "Debugging",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bugsnag/bugsnag-original.svg"
    },
    {
      "name": "Social SDK",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/facebook/facebook-original.svg"
    },
    {
      "name": "Play Store",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/google/google-original.svg"
    },
    {
      "name": "Indus App Store",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/google/google-original.svg"
    },
    {
      "name": "C++",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cplusplus/cplusplus-original.svg"
    },
    {
      "name": "Java",
      "url":
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg"
    },
  ];

  Future<void> scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;

    // Scrollable.ensureVisible works well for SingleChildScrollView/Column
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: 0, // 0 = bring to top, 0.5 = center, 1 = bottom
    );
  }

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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            width: double.infinity,
            // height: double.infinity,
            padding: const EdgeInsets.only(
                top: 25, left: 150, right: 150, bottom: 20),
            decoration: BoxDecoration(
              gradient: Thememode
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
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
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        _buildMenuItem("Skills"),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        _buildMenuItem("Experience"),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        _buildMenuItem("Projects"),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        _buildMenuItem("Certification"),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        _buildMenuItem("Contact"),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),

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
                                painter: FuturisticRingPainter(
                                    ringType: RingType.outer),
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
                                painter: FuturisticRingPainter(
                                    ringType: RingType.inner),
                              ),
                            );
                          },
                        ),

                        // Profile Image
                        const CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              AssetImage("assets/images/profile.jpg"),
                        ),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.28),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.31,
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.width * 0.05),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                        //     fontWeight: FontWeight.bol//     color: Colors.white,
                        //   ),
                        //   speed: Duration(milliseconds: 100),
                        // ),

                        SizedBox(height: 5),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Baseline(
                                baseline: 22.9,
                                baselineType: TextBaseline.alphabetic,
                                child: Icon(Icons.work,
                                    size: 16, color: Colors.white),
                              ),
                              SizedBox(width: 7),
                              Text("Software Engineer",
                                  style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 21.2,
                                    ),
                                  ))
                            ]),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Baseline(
                                baseline: 22.9,
                                baselineType: TextBaseline.alphabetic,
                                child: Icon(Icons.location_on,
                                    size: 16, color: Colors.white),
                              ),
                              SizedBox(width: 7),
                              Text("Laxmangarh, Sikar, Rajasthan",
                                  style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 21.2,
                                    ),
                                  ))
                            ]),
                        SizedBox(
                          height: 17,
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DimLineShimmerText(
                              text: "Mobile Apps Developer",
                              fontSize: 24.2,
                              flashDuration: Duration(
                                  milliseconds: 250), // pura text 7s flash
                              lineDuration:
                                  Duration(seconds: 2), // line chale 3s
                              delay: Duration(
                                  seconds: 2), // line ke baad 15s pause
                              textColor: Color(0xff006cfa),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Center(
                              child: Text("Get In Touch",
                                  style: GoogleFonts.rubik(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      wordSpacing: 0.5,
                                      fontSize: 24.2)),
                            ),
                            SizedBox(
                              height: 80,
                              width: 100,
                              child: Lottie.asset(
                                "assets/lottiicons/MessageSent.json", // aapki json file ka path
                                repeat: true, // bar bar chale
                                reverse: false,
                                animate: true,
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Color(0xff3ec5fd),
                                      borderRadius: BorderRadius.circular(15),
                                      border:
                                          Border.all(color: Color(0xff006cfa))),
                                  child: Center(
                                      child: Text(
                                    "Let's talk",
                                    style: TextStyle(
                                        wordSpacing: 0.1,
                                        color: Colors.black,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w900),
                                  )),
                                ))
                          ],
                        ),

                        Row(
                          children: [
                            Text(
                              "Feel free to reach out for collaborations or just a friendly hello",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.mail_outline,
                                    color: Colors.blue,
                                    size: 25,
                                  )),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: FaIcon(
                                    FontAwesomeIcons.linkedin,
                                    color: Colors.blue,
                                    size: 25,
                                  )),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: FaIcon(
                                    FontAwesomeIcons.github,
                                    color: Colors.blue,
                                    size: 25,
                                  )),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: FaIcon(
                                    FontAwesomeIcons.whatsapp,
                                    color: Colors.blue,
                                    size: 25,
                                  )),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 35,
                              width: 110,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: BoxBorder.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "View CV",
                                    style: TextStyle(
                                        color: Colors.indigoAccent.shade100,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )),
                            ),
                          ],
                        )

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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.09,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "I'm Yogesh Dadhich, a passionate Flutter Developer with hands-on experience in building scalable, high-performance mobile applications. With a strong foundation in Dart, Java, Firebase, and RESTful APIs, I specialize in cross-platform app development using Flutter for Android, iOS, web, and desktop. I've contributed to multiple projects across e-commerce, legal services, education, and warehouse management, including published apps like TQNEEN, Easy Store, and AL-MANAR Private School App. My work consistently focuses on optimizing performance and enhancing user experience—such as achieving a 30% load time reduction and a 20% boost in user retention at Startup Defenders. I follow clean architecture principles, apply SOLID and OOP design patterns, and bring practical knowledge in CI/CD, automated testing, and agile methodologies. Beyond technical skills, I'm known for my adaptability, teamwork, and strong problem-solving capabilities.",
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: 18.5,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Column(
                  key: SkillsKey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Skills   ",
                          style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 29,
                              letterSpacing: 1,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Lottie.asset("assets/lottiicons/Justarmnoheart.json",
                            height: 30, width: 30),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //           Row(
                    //             children: [
                    //               Expanded(
                    //                 child: Container(
                    //                   margin: EdgeInsets.all(10),
                    //                   height: 30,
                    //                   width: 80,
                    //                   decoration: BoxDecoration(
                    //
                    //                     color: Colors.white,
                    //                     borderRadius: BorderRadius.circular(10)
                    //                   ),
                    //                   child: Row(
                    //
                    //                   ),
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: Container(
                    //                   margin: EdgeInsets.all(10),
                    //                   height: 30,
                    //                   width: 80,
                    //                   decoration: BoxDecoration(
                    //
                    //                       color: Colors.white,
                    //                       borderRadius: BorderRadius.circular(10)
                    //                   ),
                    //                   child: Row(
                    //
                    //                   ),
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: Container(
                    //                   margin: EdgeInsets.all(10),
                    //                   height: 30,
                    //                   width: 80,
                    //                   decoration: BoxDecoration(
                    //
                    //                       color: Colors.white,
                    //                       borderRadius: BorderRadius.circular(10)
                    //                   ),
                    //                   child: Row(
                    //
                    //                   ),
                    //                 ),
                    //               ),
                    // Expanded(
                    //   child: Container(
                    //     margin: EdgeInsets.all(10),
                    //     height: 30,
                    //     width: 80,
                    //     decoration: BoxDecoration(
                    //
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10)
                    //     ),
                    //     child: Row(
                    //
                    //     ),
                    //   ),
                    // ),
                    //               Expanded(
                    //                 child: Container(
                    //                   margin: EdgeInsets.all(10),
                    //                   height: 30,
                    //                   width: 80,
                    //                   decoration: BoxDecoration(
                    //
                    //                       color: Colors.white,
                    //                       borderRadius: BorderRadius.circular(10)
                    //                   ),
                    //                   child: Row(
                    //
                    //                   ),
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: Container(
                    //                   margin: EdgeInsets.all(10),
                    //                   height: 30,
                    //                   width: 80,
                    //                   decoration: BoxDecoration(
                    //
                    //                       color: Colors.white,
                    //                       borderRadius: BorderRadius.circular(10)
                    //                   ),
                    //                   child: Row(
                    //
                    //                   ),
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: Container(
                    //                   margin: EdgeInsets.all(10),
                    //                   height: 30,
                    //                   width: 80,
                    //                   decoration: BoxDecoration(
                    //
                    //                       color: Colors.white,
                    //                       borderRadius: BorderRadius.circular(10)
                    //                   ),
                    //                   child: Row(
                    //
                    //                   ),
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: Container(
                    //                   margin: EdgeInsets.all(10),
                    //                   height: 30,
                    //                   width: 80,
                    //                   decoration: BoxDecoration(
                    //
                    //                       color: Colors.white,
                    //                       borderRadius: BorderRadius.circular(10)
                    //                   ),
                    //                   child: Row(
                    //
                    //                   ),
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: Container(
                    //                   margin: EdgeInsets.all(10),
                    //                   height: 30,
                    //                   width: 80,
                    //                   decoration: BoxDecoration(
                    //
                    //                       color: Colors.white,
                    //                       borderRadius: BorderRadius.circular(10)
                    //                   ),
                    //                   child: Row(
                    //
                    //                   ),
                    //                 ),
                    //               ),
                    //
                    //             ],
                    //           )

                    Wrap(
                      spacing: 20,
                      runSpacing: 20,

                      //alignment: WrapAlignment.start,
                      children: Skills.map((Skills) {
                        return Container(
                            margin: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height * 0.043,
                            width: MediaQuery.of(context).size.width * 0.099,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xff0D1D2D),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.white10, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: SvgPicture.network(
                                    Skills["url"],
                                    height: 22,
                                  ),
                                ),
                                Text(
                                  Skills["name"].toString(),
                                  style: TextStyle(
                                      color: Color(0xff006cfa),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ));
                      }).toList(),
                    )
                  ],
                ),

                SizedBox(
                  height: 70,
                ),
                Column(
                  key: ExperienceKey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              "Experience   ",
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 29,
                                  letterSpacing: 1,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Lottie.asset(
                                "assets/lottiicons/Justarmnoheart.json",
                                height: 30,
                                width: 30),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TimelineTile(

                        alignment: TimelineAlign.start,
                        isFirst: true,
                        indicatorStyle: IndicatorStyle(
                          indicator: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xff006cfa), // inner filled color
                              border: Border.all(
                                color: const Color(0xff003f9a), // outer circle border color
                                width: 3, // border thickness
                              ),
                            ),
                          ),
                          indicatorXY: 0.0,
                          width: 20,
                          color: Color(0xff006cfa),

                        ),
                        beforeLineStyle: const LineStyle(
                          color: Color(0xff006cfa),
                          thickness: 1.5,
                          // 👈 yahan line ki motaai (kam/badh) kar sakte ho
                        ),
                        afterLineStyle: const LineStyle(
                          color: Color(0xff006cfa),
                          thickness:
                          1.5, // 👈 dono lines same rakho for uniform look
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.only(top: 0 ,left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            width: MediaQuery.of(context).size.width * 0.02,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff006cfa),width: 0.5),
                                color: Color(0xff191d36),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                    ),
                    TimelineTile(
                        alignment: TimelineAlign.start,
                        indicatorStyle: IndicatorStyle(
                          indicatorXY: 0.3,
                          indicator: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xff006cfa), // inner filled color
                              border: Border.all(
                                color: const Color(0xff003f9a), // outer circle border color
                                width: 3, // border thickness
                              ),
                            ),
                          ),
                          width: 20,
                          color: Color(0xff006cfa),
                        ),
                        beforeLineStyle: const LineStyle(
                          color: Color(0xff006cfa),
                          thickness:
                          1.5, // 👈 yahan line ki motaai (kam/badh) kar sakte ho
                        ),
                        afterLineStyle: const LineStyle(
                          color: Color(0xff006cfa),
                          thickness:
                          1.5, // 👈 dono lines same rakho for uniform look
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.only(top:45 ,left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            width: MediaQuery.of(context).size.width * 0.02,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff006cfa),width: 0.5),
                                color: Color(0xff191d36),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                    ),
                    TimelineTile(
                        alignment: TimelineAlign.start,

                        indicatorStyle: IndicatorStyle(
                          indicatorXY: 0.3,
                          indicator: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xff006cfa), // inner filled color
                              border: Border.all(
                                color: const Color(0xff003f9a), // outer circle border color
                                width: 3, // border thickness
                              ),
                            ),
                          ),
                          width: 20,
                          color: Color(0xff006cfa),
                        ),
                        beforeLineStyle: const LineStyle(
                          color: Color(0xff006cfa),
                          thickness:
                          1.5, // 👈 yahan line ki motaai (kam/badh) kar sakte ho
                        ),
                        afterLineStyle: const LineStyle(
                          color: Color(0xff006cfa),
                          thickness:
                          1.5, // 👈 dono lines same rakho for uniform look
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.only(top: 45 ,left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            width: MediaQuery.of(context).size.width * 0.02,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff006cfa),width: 0.5),
                                color: Color(0xff191d36),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                    ),
                    TimelineTile(
                        alignment: TimelineAlign.start,

                        indicatorStyle: IndicatorStyle(
                          indicatorXY: 0.3,
                          indicator: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xff006cfa), // inner filled color
                              border: Border.all(
                                color: const Color(0xff003f9a), // outer circle border color
                                width: 3, // border thickness
                              ),
                            ),
                          ),
                          width: 20,
                          color: Color(0xff006cfa),
                        ),
                        beforeLineStyle: const LineStyle(
                          color: Color(0xff006cfa),
                          thickness:
                          1.5, // 👈 yahan line ki motaai (kam/badh) kar sakte ho
                        ),
                        afterLineStyle: const LineStyle(
                          color: Color(0xff006cfa),
                          thickness:
                          1.5, // 👈 dono lines same rakho for uniform look
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.only(top: 45 ,left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            width: MediaQuery.of(context).size.width * 0.02,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff006cfa),width: 0.4),
                                color: Color(0xff191d36),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                    ),
                    TimelineTile(
                        alignment: TimelineAlign.start,

                        indicatorStyle: IndicatorStyle(
                          indicatorXY: 0.3,
                          indicator: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xff006cfa), // inner filled color
                              border: Border.all(
                                color: const Color(0xff003f9a), // outer circle border color
                                width: 3, // border thickness
                              ),
                            ),
                          ),
                          width: 20,
                          color: Color(0xff006cfa),
                        ),
                        beforeLineStyle: const LineStyle(
                          color: Color(0xff006cfa),
                          thickness:
                              1.5, // 👈 yahan line ki motaai (kam/badh) kar sakte ho
                        ),
                        afterLineStyle: const LineStyle(
                          color: Color(0xff006cfa),
                          thickness:
                              1.5, // 👈 dono lines same rakho for uniform look
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.only(top: 45 ,left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            width: MediaQuery.of(context).size.width * 0.02,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff006cfa),width: 0.4),
                                color: Color(0xff191d36),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                    ),
                  ],
                ),

                SizedBox(
                  height: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  key: ProjectsKey,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Projects   ",
                          style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 29,
                              letterSpacing: 1,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Image.asset(
                            "assets/images/rocket.png",
                            height: 60,
                            width: 60),

                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Here are some of my projects that i have worked on:", style: TextStyle(color: Colors.white60,fontSize: 20),textAlign:TextAlign.start ,),
                    Row(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(color: Colors.black87)
                          ),
                          child:Image.asset(
                              "assets/images/app_logo.png",
                              height: 60,
                              width: 60),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.04,
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(color: Colors.black87)
                          ),
                          child:Image.asset(
                              "assets/images/project1.png",
                              height: 60,
                              width: 60),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.04,
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(color: Colors.black87)
                          ),
                          child:Image.asset(
                              "assets/images/Project2.png",
                              height: 60,
                              width: 60),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.04,
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(color: Colors.black87)
                          ),
                          child:Image.asset(
                              "assets/images/Project3.png",
                              height: 60,
                              width: 60),
                        )
                      ],
                    )

                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  key: CertificationKey,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Certification   ",
                          style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 29,
                              letterSpacing: 1,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Lottie.asset(
                          "assets/lottiicons/Star Animation.json",
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Text("Personal certificates and achievements that validate my experties:", style: TextStyle(color: Colors.white60,fontSize: 20),textAlign:TextAlign.start ,),
                    const SizedBox(height: 50),

                    // 👇 yahan add karo slider
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.8,
                        child: const CertificationSlider()),

                    const SizedBox(height: 30),
                  ],
                ),

            SizedBox(
                  height: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  key: ContactKey,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Get In Touch   ",
                          style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 29,
                              letterSpacing: 1,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Lottie.asset(
                          "assets/lottiicons/MessageSent.json",
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Feel free to reach out for collaboration or just a friendly hello", style: TextStyle(color: Colors.white60,fontSize: 20),textAlign:TextAlign.start ,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white12)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    )
                  ],
                ),
              ],
            ),
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
        title == "Certification"
            ? scrollTo(CertificationKey)
            : title == "Contact"
                ? scrollTo(ContactKey)
                : title == "Projects"
                    ? scrollTo(ProjectsKey)
                    : title == "Experience"
                        ? scrollTo(ExperienceKey)
                        : title == "Skills"
                            ? scrollTo(SkillsKey)
                            : scrollTo(aboutKey);

        print(title);
      },
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: Thememode
              ? (isSelected ? Colors.white : Colors.white70)
              : (isSelected ? Colors.blueAccent : Colors.black87),
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
          fontSize: isSelected ? 17 : 16,
          decoration:
              isSelected ? TextDecoration.underline : TextDecoration.none,
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
            _drawDiamond(
                canvas, pos, 4, outlinePaint..color = Colors.cyanAccent);
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
