// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Portfolio extends StatefulWidget {
//   const Portfolio({Key? key}) : super(key: key);
//
//   @override
//   State<Portfolio> createState() => _PortfolioState();
// }
//
// class _PortfolioState extends State<Portfolio>
//     with SingleTickerProviderStateMixin {
//   String _selected = "About"; // default selected
//   bool Thememode = true;
//
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller =
//     AnimationController(vsync: this, duration: const Duration(seconds: 20))
//       ..repeat();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Scrollbar(
//           child: Container(
//             height: double.infinity,
//             width: double.infinity,
//             padding: const EdgeInsets.only(
//                 top: 25, left: 150, right: 150, bottom: 20),
//             decoration: BoxDecoration(
//                 gradient: Thememode
//                     ? const LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Color(0xff0D1D2D),
//                     Color(0xff103875),
//                   ],
//                 )
//                     : const LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Colors.white,
//                     Colors.white,
//                   ],
//                 )),
//             child: Column(
//               children: [
//                 // 🔹 Top Menu
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Left side name
//                     Row(
//                       children: [
//                         Text("Yogesh ",
//                             style: TextStyle(
//                                 color: Thememode ? Colors.white : Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 23)),
//                         Text("Dadhich",
//                             style: const TextStyle(
//                                 color: Colors.blueAccent,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 23)),
//                       ],
//                     ),
//
//                     // Right side menu
//                     Row(
//                       children: [
//                         _buildMenuItem("About"),
//                         const SizedBox(width: 40),
//                         _buildMenuItem("Skills"),
//                         const SizedBox(width: 40),
//                         _buildMenuItem("Experience"),
//                         const SizedBox(width: 40),
//                         _buildMenuItem("Projects"),
//                         const SizedBox(width: 40),
//                         _buildMenuItem("Certification"),
//                         const SizedBox(width: 40),
//                         _buildMenuItem("Contact"),
//                         const SizedBox(width: 40),
//                         Container(
//                           decoration: BoxDecoration(
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Color(0xFF0740F1),
//                                 offset: Offset(0, 0),
//                                 blurRadius: 10,
//                                 spreadRadius: 1,
//                               )
//                             ],
//                             borderRadius: BorderRadius.circular(20),
//                             color: const Color(0xFF0740F1),
//                           ),
//                           child: IconButton(
//                               onPressed: () {
//                                 setState(() => {Thememode = !Thememode});
//                               },
//                               icon: Thememode
//                                   ? const Icon(Icons.light_mode_outlined,
//                                   color: Colors.white)
//                                   : const Icon(Icons.dark_mode_outlined,
//                                   color: Colors.white)),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 80),
//
//                 // 🔹 Profile with Rings
//                 Expanded(
//                   child: Center(
//                     child: AnimatedBuilder(
//                       animation: _controller,
//                       builder: (context, child) {
//                         return Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             // 🔹 Rings (outer + inner dono ek sath)
//                             Transform.rotate(
//                               angle: _controller.value * 2 * pi,
//                               child: CustomPaint(
//                                 size: const Size(300, 300),
//                                 painter: FuturisticRingsPainter(),
//                               ),
//                             ),
//
//                             // 🔹 Profile Image
//                             const CircleAvatar(
//                               radius: 80,
//                               backgroundImage: AssetImage("assets/images/profile.jpg"),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMenuItem(String title) {
//     bool isSelected = _selected == title;
//
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selected = title;
//         });
//       },
//       child: Text(
//         title,
//         style: GoogleFonts.poppins(
//           color: Thememode
//               ? (isSelected ? Colors.white : Colors.white70)
//               : (isSelected ? Colors.blueAccent : Colors.black87),
//           fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
//           fontSize: isSelected ? 17 : 16,
//           decoration:
//           isSelected ? TextDecoration.underline : TextDecoration.none,
//           decorationColor: Thememode ? Colors.white : Colors.blueAccent,
//           decorationThickness: 2,
//         ),
//       ),
//     );
//   }
// }
//
// // 🔹 Custom Painter for Rings + Icons
// // 🔹 Custom Painter for Rings + Icons
// class FuturisticRingsPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//
//     // 🎨 Paints with colors like your screenshot
//     final outerPaint = Paint()
//       ..color = const Color(0xFF00CFFF) // Sky Blue outer ring
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2;
//
//     final innerPaint = Paint()
//       ..color = const Color(0xFF0066FF) // Darker Blue inner ring
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2;
//
//     // 🔹 Radii
//     const ringGap = 40.0; // Equal spacing
//     final outerRadius = size.width / 2 - 10;
//     final innerRadius = outerRadius - ringGap;
//
//     const gapAngle = 0.22; // Arc gap size
//
//     // ================= OUTER RING =================
//     final outerSymbolCount = 3;
//     final outerStep = 2 * pi / outerSymbolCount;
//
//     for (int i = 0; i < outerSymbolCount; i++) {
//       final start = i * outerStep + gapAngle / 2;
//       final sweep = outerStep - gapAngle;
//
//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: outerRadius),
//         start,
//         sweep,
//         false,
//         outerPaint,
//       );
//
//       // Symbol position
//       final pos = Offset(
//         center.dx + outerRadius * cos(i * outerStep),
//         center.dy + outerRadius * sin(i * outerStep),
//       );
//
//       // symbols like your image (circle, diamond, plus)
//       switch (i) {
//         case 0:
//           canvas.drawCircle(pos, 5, outerPaint);
//           break;
//         case 1:
//           _drawDiamond(canvas, pos, 9, outerPaint);
//           break;
//         case 2:
//           _drawPlus(canvas, pos, 9, outerPaint);
//           break;
//       }
//     }
//
//     // ================= INNER RING =================
//     final innerSymbolCount = 2;
//     final innerStep = 2 * pi / innerSymbolCount;
//
//     for (int i = 0; i < innerSymbolCount; i++) {
//       final start = i * innerStep + gapAngle / 2;
//       final sweep = innerStep - gapAngle;
//
//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: innerRadius),
//         start,
//         sweep,
//         false,
//         innerPaint,
//       );
//
//       // Symbol position
//       final pos = Offset(
//         center.dx + innerRadius * cos(i * innerStep),
//         center.dy + innerRadius * sin(i * innerStep),
//       );
//
//       // symbols (circle + diamond like screenshot)
//       switch (i) {
//         case 0:
//           canvas.drawCircle(pos, 6, innerPaint);
//           break;
//         case 1:
//           _drawDiamond(canvas, pos, 8, innerPaint);
//           break;
//       }
//     }
//   }
//
//   // 🔹 Diamond
//   void _drawDiamond(Canvas canvas, Offset c, double s, Paint paint) {
//     final path = Path()
//       ..moveTo(c.dx, c.dy - s)
//       ..lineTo(c.dx + s, c.dy)
//       ..lineTo(c.dx, c.dy + s)
//       ..lineTo(c.dx - s, c.dy)
//       ..close();
//     canvas.drawPath(path, paint);
//   }
//
//   // 🔹 Plus
//   void _drawPlus(Canvas canvas, Offset c, double s, Paint paint) {
//     final p = Paint()
//       ..color = paint.color
//       ..strokeWidth = 2
//       ..strokeCap = StrokeCap.round;
//     canvas.drawLine(Offset(c.dx, c.dy - s), Offset(c.dx, c.dy + s), p);
//     canvas.drawLine(Offset(c.dx - s, c.dy), Offset(c.dx + s, c.dy), p);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//