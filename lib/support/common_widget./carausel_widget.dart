import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:royal_class_app/app_theme.dart';
import 'package:royal_class_app/support/constants.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
    required this.pageIndex,
  });

  final ValueNotifier<int> pageIndex;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: banners.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) {
        return GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              height: 105,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: colors(context).white,
                  image: DecorationImage(
                      image: AssetImage(banners[index]), fit: BoxFit.cover)),
            ),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        aspectRatio: 2.5,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          pageIndex.value = index;
        },
      ),
    );
  }
}
