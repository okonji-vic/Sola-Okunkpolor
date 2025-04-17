import 'dart:async';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../api_service/gallery_api.dart';
import '../../main.dart';

class Gallery extends StatefulWidget {
  bool isSmallScreen;
  Gallery({super.key, this.isSmallScreen = false});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final _scrollController = ScrollController();
  late Timer _timer;
  List galleryList = [];
  @override
  void initState() {
    loadGallery();
    super.initState();
  }

  loadGallery() async {
    try {
      var res = await viewGallery();
      debugPrint(res.toString());
      if (res['msg'] == 'success') {
        galleryList = res['gallery']['img_urls'];
        _startAutoScrollTimer();
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _startAutoScrollTimer() {
    // Create a timer that scrolls to the end of the list every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        // If the scroll position is at the end, scroll to the beginning
        _scrollController.jumpTo(0);
      } else {
        // Otherwise, scroll to the end
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
        );
      }
    });
  }

  @override
  void dispose() {
    // Dispose the timer and scroll controller to prevent memory leaks
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return galleryList.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              const SizedBox(height: 60),
              Text(
                "GALLERY",
                style: TextStyle(
                  fontSize: widget.isSmallScreen ? 20 : 32,
                  fontFamily: constants.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 5,
                // color: const Color.fromRGBO(182, 5, 5, 1),
                color:
                    constants.yellow, // const Color.fromRGBO(238, 144, 3, 1),
                width: 90,
              ),
              const SizedBox(height: 12),
              Text(
                "A peak into highlights of the transformative process of making dreams work",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: widget.isSmallScreen
                      ? constants.fontsize18
                      : constants.fontsize20,
                  fontFamily: constants.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              widget.isSmallScreen
                  ? SizedBox(
                      width: width,
                      height: 210,
                      child: CarouselSlider.builder(
                        itemCount:
                            galleryList.length, // db.gallery["gallery"].length,
                        unlimitedMode: true,
                        // scrollPhysics: const ,
                        // slideTransform: StackTransform(),
                        slideTransform: const ParallaxTransform(),
                        // slideTransform: const ZoomOutSlideTransform(),

                        enableAutoSlider: true,
                        autoSliderDelay: const Duration(seconds: 7),
                        autoSliderTransitionTime:
                            const Duration(milliseconds: 1200),
                        slideBuilder: (int index) {
                          return FastCachedImage(
                            url: galleryList[index],
                            height: 210,
                            width: 300,
                            fit: BoxFit.contain,
                            fadeInDuration: const Duration(seconds: 1),
                            errorBuilder: (context, exception, stacktrace) {
                              return const Icon(Icons.error);
                            },
                            loadingBuilder: (context, progress) {
                              return const SizedBox();
                            },
                          );
                        },
                      ),
                    )
                  : SizedBox(
                      width: width,
                      height: 400,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _scrollController,
                          itemCount: galleryList.length,
                          itemBuilder: (context, index) {
                            return FastCachedImage(
                              url: galleryList[index],
                              height: 400,
                              width: 360,
                              fit: BoxFit.cover,
                              fadeInDuration: const Duration(seconds: 1),
                              errorBuilder: (context, exception, stacktrace) {
                                return const Icon(Icons.error);
                              },
                              loadingBuilder: (context, progress) {
                                return const SizedBox();
                              },
                            );
                          }),
                    ),
              const SizedBox(height: 100),
            ],
          );
  }
}
