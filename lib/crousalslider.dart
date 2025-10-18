import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CertificationSlider extends StatelessWidget {
  const CertificationSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'assets/images/project1.png',
      'assets/images/project2.png',
      'assets/images/project3.png',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 460,
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction: 0.6,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: imageList.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
