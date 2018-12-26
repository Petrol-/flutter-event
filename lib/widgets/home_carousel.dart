import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatefulWidget {
  @override
  _HomeCarouselState createState() {
    return new _HomeCarouselState();
  }
}

class _HomeCarouselState extends State<HomeCarousel> {
  final List<String> _imgList = [
    "lib/assets/student.jpg",
    "lib/assets/write.jpg"
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        viewportFraction: 1.0,
        autoPlay: true,
        interval: const Duration(seconds: 8),
        autoPlayDuration: const Duration(milliseconds: 800),
        distortion: false,
        updateCallback: (index) {
          setState(() {
            _current = index;
          });
        },
        items: _imgList
            .map((item) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(item), fit: BoxFit.fitWidth)),
                  ),
                ))
            .toList(),
      ),
      Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _imgList.map<Widget>((item) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _imgList.indexOf(item) == _current
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4)),
              );
            }).toList(),
          ))
    ]);
  }
}
