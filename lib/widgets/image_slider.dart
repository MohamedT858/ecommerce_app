import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../main.dart';

final HomeScreenState hs = new HomeScreenState();

const List<MaterialColor> randomColorList = <MaterialColor>[
  Colors.pink,
  Colors.purple,
  Colors.green,
  Colors.teal,
  Colors.deepOrange,
];
int currentitem = 1;

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    this.aspectRatio = 16 / 9,
    this.viewportFraction = .9,
    this.height,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.slideShowImgs,
    this.containerBorderRadius = const BorderRadius.all(Radius.circular(10)),
  });
  final double? height;
  final double aspectRatio;
  final double viewportFraction;
  final Duration autoPlayInterval;
  final BorderRadiusGeometry containerBorderRadius;
  final List<String>? slideShowImgs;
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        child: CarouselSlider.builder(
            options: CarouselOptions(
              height: widget.height,
              autoPlayInterval: widget.autoPlayInterval,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              enableInfiniteScroll: true,
              aspectRatio: widget.aspectRatio,
              viewportFraction: widget.viewportFraction,
              initialPage: 0,
              enlargeCenterPage: false,
              pageSnapping: true,
              autoPlay: true,
              pauseAutoPlayOnTouch: true,
              pauseAutoPlayOnManualNavigate: true,
              onPageChanged: (index, changedReason) {
                setState(() {
                  currentitem = index;
                });
              },
            ),
            itemCount: widget.slideShowImgs == null
                ? randomColorList.length
                : widget.slideShowImgs!.length,
            itemBuilder:
                (BuildContext context, int currentitem, int pageViewIndex) =>
                    GestureDetector(
                      onTap: (() {}),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: randomColorList[currentitem],
                          image: widget.slideShowImgs != null
                              ? DecorationImage(
                                  image: NetworkImage(widget
                                      .slideShowImgs![currentitem]
                                      .toString()),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          borderRadius: widget.containerBorderRadius,
                        ),
                      ),
                    )),
      ),
      DotIndecator(
          slideShowImgs: widget.slideShowImgs == null
              ? randomColorList.length
              : widget.slideShowImgs!.length),
    ]);
  }
}

class DotIndecator extends StatelessWidget {
  const DotIndecator({
    required this.slideShowImgs,
  });
  final int slideShowImgs;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: slideShowImgs > 1
          ? MediaQuery.of(context).size.width / 2 -
              ((4.0 + 4.0) * (slideShowImgs - 1) + (9.0 + 4.0))
          : MediaQuery.of(context).size.width / 2 -
              ((9.0 + 3.0) * slideShowImgs),
      child: DotsIndicator(
        dotsCount: slideShowImgs < currentitem ? 0 : slideShowImgs,
        position: currentitem > slideShowImgs ? 0 : currentitem.toDouble(),
        decorator: DotsDecorator(
          size: const Size.square(4.0),
          activeSize: const Size(9.0, 4.0),
          color: Color(0xff0E0B16),
          activeColor: Color(0xffFFD523),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
        ),
      ),
    );
  }
}
