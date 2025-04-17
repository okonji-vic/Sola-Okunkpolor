import 'package:flutter/material.dart';
// import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import '../../api_service/testimonial_api.dart';
import '../../main.dart';
import '../global.dart';

class TestimonialsWidget extends StatefulWidget {
  bool isSmallScreen;
  // Function() reload;
  TestimonialsWidget({super.key, this.isSmallScreen = false});

  @override
  State<TestimonialsWidget> createState() => _TestimonialsWidgetState();
}

class _TestimonialsWidgetState extends State<TestimonialsWidget> {
  List testimonialList = [];
  @override
  void initState() {
    loadTestimonials();
    super.initState();
  }

  loadTestimonials() async {
    try {
      var res = await viewTestimonials();
      debugPrint(res.toString());
      if (res['msg'] == 'success') {
        testimonialList = res['testimonials'].take(3).toList();
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return testimonialList.isEmpty
        ? const SizedBox()
        : Container(
            color: Colors.white,
            width: width,
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(children: [
              Text(
                "TESTIMONIALS",
                style: TextStyle(
                  fontSize: widget.isSmallScreen ? 20 : 32,
                  fontFamily: constants.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 5,
                color: const Color.fromRGBO(238, 144, 3, 1),
                width: 150,
              ),
              const SizedBox(height: 22),
              SizedBox(
                // width: 400,
                child: Text(
                  "We are in the business of making dreams work",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.isSmallScreen
                        ? constants.fontsize18
                        : constants.fontsize20,
                    fontFamily: constants.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              widget.isSmallScreen
                  ? SizedBox(
                      width: width,
                      height: 600,
                      child: CarouselSlider.builder(
                        itemCount: 3, // db.gallery["gallery"].length,
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
                          return testimonialCard(width, testimonialList[index]);
                        },
                      ),
                    )
                  : SizedBox(
                      height: 650,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                              testimonialList.length,
                              (index) => testimonialCard(
                                  width, testimonialList[index]))),
                    ),
            ]),
          );
  }

  Widget testimonialCard(var width, var testimonialData) {
    return Column(children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/testimonial_bubble.png",
            fit: BoxFit.cover,
            // height: 0,
            width: widget.isSmallScreen ? width : width / 3.6,
          ),
          SizedBox(
            width: widget.isSmallScreen ? width - 20 : (width / 4) - 20,
            child: Text(
              "${testimonialData['testimony']}",
              textAlign: TextAlign.center,
              maxLines: 12,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: constants.fontsize18,
                fontFamily: constants.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      ClipRRect(
        borderRadius: BorderRadius.circular(360),
        child: helperWidgets.build_cached_image(
          '${testimonialData['img_url']}',
          height: 110,
          width: 110,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        "${testimonialData['fullname']}",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: constants.fontsize18,
          fontFamily: constants.w700,
          color: Colors.black,
        ),
      ),
      Text(
        "${testimonialData['organisation']}",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: constants.fontsize18,
          fontFamily: constants.w400,
          color: Colors.black,
        ),
      ),
    ]);
  }
}
