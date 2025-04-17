import 'package:flutter/material.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/utils/functions.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import '../../utils/my_widgets.dart/course_widgets.dart';
import '../../utils/my_widgets.dart/gallery_widgets.dart';
import '../../utils/my_widgets.dart/promotionalVideo.dart';
import '../../utils/my_widgets.dart/testimonial_widgets.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  DesktopWidgets myWidgets = DesktopWidgets();
  bool trainingHovered = false;
  bool coachingHovered = false;
  bool consultationHovered = false;

  int sliderCurrentIndex = 0;

  Widget buildDots(int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Container(
          height: 8,
          width: index == currentIndex ? 22 : 8,
          margin: EdgeInsets.only(left: index != 0 ? 15 : 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: index == currentIndex ? constants.yellow : Colors.grey[300],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            myWidgets.title(width: screen.width, tab: "home"),
            // build_header3(screen),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: screen.height - 80,
                  width: screen.width,
                  child: CarouselSlider(
                    onSlideChanged: (slideIndex) {
                      setState(() {
                        sliderCurrentIndex = slideIndex % 4;
                        print(sliderCurrentIndex);
                      });
                    },
                    // slideTransform: ParallaxTransform(),
                    // slideTransform: const ZoomOutSlideTransform(),
                    // slideTransform: StackTransform(),
                    autoSliderTransitionCurve: Curves.fastOutSlowIn,
                    autoSliderTransitionTime: const Duration(seconds: 3),
                    autoSliderDelay: const Duration(seconds: 6),
                    enableAutoSlider: true,
                    unlimitedMode: true,
                    // scrollPhysics: const NeverScrollableScrollPhysics(),
                    children: [
                      build_header1(screen),
                      build_header2(screen),
                      build_header3(screen),
                      build_header4(screen),
                    ],
                  ),
                ),
                // const SizedBox(height: 10),
                // const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: buildDots(sliderCurrentIndex),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 90),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "DR. SOLA'S SOLUTIONS",
                    style: TextStyle(
                      fontSize: constants.fontsize32,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 5,
                    // color: const Color.fromRGBO(182, 5, 5, 1),
                    color: constants
                        .yellow, //  const Color.fromRGBO(255, 153, 0, 1),

                    width: 150,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Your dreams are valid and Dr. Sola is sold out to helping you make them work.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 50,
                    runSpacing: 30,
                    children: [
                      MouseRegion(
                        onEnter: (event) {
                          setState(() {
                            trainingHovered = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            trainingHovered = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          decoration: BoxDecoration(
                            color: trainingHovered
                                ? const Color.fromRGBO(242, 244, 248, 1)
                                : Colors.white,
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          height: 515,
                          width: 300,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundColor: trainingHovered
                                      ? constants.yellow
                                      : constants.lightPurple,
                                  child: Image.asset(
                                    "assets/images/training.png",
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Training/ Speaking",
                                  style: TextStyle(
                                    fontSize: constants.fontsize24,
                                    fontFamily: constants.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  "Dr. Sola’s training/ speaking sessions are designed to cause positive adjustments in the minds of the listeners. Working with her is what your event/organization needs.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: constants.fontsize20,
                                    fontFamily: constants.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                trainingHovered
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed(route.trainingPage);
                                        },
                                        child: Text(
                                          "Get Started >>",
                                          style: TextStyle(
                                            fontSize: constants.fontsize18,
                                            fontFamily: constants.w600,
                                            color: constants.yellow,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),


                      MouseRegion(
                        onEnter: (event) {
                          setState(() {
                            coachingHovered = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            coachingHovered = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          decoration: BoxDecoration(
                            color: coachingHovered
                                ? const Color.fromRGBO(242, 244, 248, 1)
                                : Colors.white,
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          height: 515,
                          width: 300,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundColor: coachingHovered
                                      ? constants.yellow
                                      : constants.lightPurple,
                                  child: Image.asset(
                                    "assets/images/coaching.png",
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Coaching/ Mentoring",
                                  style: TextStyle(
                                    fontSize: constants.fontsize24,
                                    fontFamily: constants.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  "Excellent athletes have coaches that lead them into victory in training before any game. Dr. Sola is the coach you need for your definite success in life and/or business.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: constants.fontsize20,
                                    fontFamily: constants.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                coachingHovered
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed(route.trainingPage);
                                        },
                                        child: Text(
                                          "Get Started >>",
                                          style: TextStyle(
                                            fontSize: constants.fontsize18,
                                            fontFamily: constants.w600,
                                            color: constants.yellow,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),

                      MouseRegion(
                        onEnter: (event) {
                          setState(() {
                            consultationHovered = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            consultationHovered = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          decoration: BoxDecoration(
                            color: consultationHovered
                                ? const Color.fromRGBO(242, 244, 248, 1)
                                : Colors.white,
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          height: 515,
                          width: 300,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundColor: consultationHovered
                                      ? constants.yellow
                                      : constants.lightPurple,
                                  child: Image.asset(
                                    "assets/images/coaching.png",
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Consultation",
                                  style: TextStyle(
                                    fontSize: constants.fontsize24,
                                    fontFamily: constants.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  "Helping individuals and organization attain new levels of growth and success by strategic diagnosis of the problems and delivery of creative solutions",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: constants.fontsize20,
                                    fontFamily: constants.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                consultationHovered
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed(route.trainingPage);
                                        },
                                        child: Text(
                                          "Get Started >>",
                                          style: TextStyle(
                                            fontSize: constants.fontsize18,
                                            fontFamily: constants.w600,
                                            color: constants.yellow,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 30),
                      //   color: const Color.fromRGBO(242, 244, 248, 1),
                      //   height: 515,
                      //   width: 300,
                      //   alignment: Alignment.center,
                      //   child: Column(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       Image.asset(
                      //         "assets/images/consultation.png",
                      //         height: 142,
                      //         width: 142,
                      //       ),
                      //       const SizedBox(height: 20),
                      //       Text(
                      //         "Consultation",
                      //         style: TextStyle(
                      //           fontSize: constants.fontsize24,
                      //           fontFamily: constants.w600,
                      //           color: Colors.black,
                      //         ),
                      //       ),
                      //       const SizedBox(height: 15),
                      //       Text(
                      //         "Helping individuals and organization attain new levels of growth and success by strategic diagnosis of the problems and delivery of creative solutions",
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //           fontSize: constants.fontsize20,
                      //           fontFamily: constants.w400,
                      //           color: Colors.black,
                      //         ),
                      //       ),
                      //       const Spacer(),
                      //       MouseRegion(
                      //         cursor: SystemMouseCursors.click,
                      //         child: GestureDetector(
                      //           onTap: () {
                      //             Navigator.of(context)
                      //                 .pushNamed(route.consultingPage);
                      //           },
                      //           child: Text(
                      //             "Get Started >>",
                      //             style: TextStyle(
                      //               fontSize: constants.fontsize18,
                      //               fontFamily: constants.w600,
                      //               color: constants.yellow,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: const Color.fromRGBO(20, 5, 29, 1),
              width: screen.width,
              margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 90),
              padding: const EdgeInsets.fromLTRB(90, 25, 90, 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "FEATURED IN",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: constants.w700,
                      fontSize: constants.fontsize32,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/channelsTV.png",
                        height: 110,
                      ),
                      Image.asset(
                        "assets/images/kuTV.png",
                        height: 100,
                      ),
                      Image.asset(
                        "assets/images/iTV.png",
                        height: 150,
                      ),
                      Image.asset(
                        "assets/images/ebs.png",
                        height: 110,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            PromotionalVideo(),

            // Padding(
            //   padding: const EdgeInsets.fromLTRB(90, 90, 90, 40),
            //   child:
            //    Image.asset(
            //     'assets/images/vid.webp',
            //     width: screen.width,
            //     fit: BoxFit.cover,
            //     alignment: Alignment.topCenter,
            //   ),
            // ),

            PopularCourses(),

            Container(
              color: const Color.fromRGBO(35, 8, 52, 1),
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 90),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "MY TRUSTED RESOURCES",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: constants.fontsize32,
                            fontFamily: constants.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Ready to take the leap and make your dreams work?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: constants.fontsize22,
                            fontFamily: constants.w400,
                            // color: Colors.white,
                            color: const Color.fromRGBO(255, 153, 0, 1),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Gain access to a wealth of transformational resources designed to empower you to shatter limiting beliefs, unlock your full potential, and attain your desired outcomes with exceptional success. Let us partner together to make your dreams work.",
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: constants.fontsize22,
                            fontFamily: constants.w300,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          width: 210,
                          child: MaterialButton(
                            onPressed: () {
                              // Navigator.of(context).pushNamed(route.aboutPage);
                            },
                            color: const Color.fromRGBO(255, 153, 0, 1),
                            hoverColor: const Color.fromRGBO(39, 86, 133, 1),
                            height: 53,
                            child: Center(
                              child: Text(
                                "EXPLORE RESOURCES",
                                style: TextStyle(
                                  fontSize: constants.fontsize16,
                                  fontFamily: constants.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Image.asset(
                      'assets/images/resources.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            //
            myWidgets.buildRecentPost(screen.width),
            myWidgets.buildOurClients(screen),
            TestimonialsWidget(),
            Gallery(),
            // myWidgets.gallery(context, width: screen.width),

            Container(
              color: Colors.white,
              // height: 600,
              // padding: const EdgeInsets.symmetric(horizontal: 90),
              // margin: const EdgeInsets.symmetric(vertical: 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 610,
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromRGBO(79, 20, 116, 1),
                          width: 3,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromRGBO(255, 153, 0, 1),
                            width: 3,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 50),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Meet",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 48,
                                fontFamily: constants.styleScript,
                                color: const Color.fromRGBO(79, 20, 116, 1),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "DR. SOLA OKUNKPOLOR",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: constants.fontsize32,
                                fontFamily: constants.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 60),
                            Text(
                              "Certified Life & Business Coach",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: constants.fontsize24,
                                fontFamily: constants.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              "Dr. Sola Okunkpolor is a well grounded coach in the areas of life and business. She is also a successful entrepreneur, teacher, author and speaker.",
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: constants.fontsize20,
                                fontFamily: constants.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: 140,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(route.aboutPage);
                                },
                                color: const Color.fromRGBO(38, 10, 56, 1),
                                hoverColor: const Color.fromRGBO(38, 10, 56, 1),
                                height: 53,
                                child: Center(
                                  child: Text(
                                    "LEARN MORE",
                                    style: TextStyle(
                                      fontSize: constants.fontsize16,
                                      fontFamily: constants.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      'assets/images/meet.png',
                      width: screen.width,
                      height: 610,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ],
              ),
            ),

            myWidgets.mailingList(width: screen.width),
            const Footer()
          ],
        ),
      ),
    );
  }

  Container build_header1(var scr) {
    return Container(
      width: scr.width,
      height: scr.height - 200,

      // padding: EdgeInsets.fromLTRB(90, 0, width / 2, 0),
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          // opacity: 0.5,
          // alignment: Alignment.topCenter,
          fit: BoxFit.fill,
          image: AssetImage("assets/images/h1.webp"),
        ),
      ),
      alignment: Alignment.centerRight,
      child: SizedBox(
        // color: Colors.blue,
        width: scr.width / 2 + 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "LET US PARTNER",
              style: TextStyle(
                color: Colors.white,
                fontFamily: constants.w600,
                fontSize: 52,
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: " TOGETHER",
                style: TextStyle(
                  // height: 1.5,
                  fontSize: 52,
                  fontFamily: constants.w600,
                  color: constants.yellow,
                ),
                children: [
                  TextSpan(
                    text: " TO MAKE",
                    style: TextStyle(
                      // height: 1.5,
                      fontSize: 52,
                      fontFamily: constants.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "YOUR DREAMS WORK",
              style: TextStyle(
                color: Colors.white,
                fontFamily: constants.w600,
                fontSize: 52,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "I am Dr. Sola Okunkpolor and I am all about helping you make your Dreams Work.",
              style: TextStyle(
                color: Colors.white,
                fontFamily: constants.w400,
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(route.aboutPage);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  constants.purpleColor,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 12.0),
                child: Text(
                  "LEARN MORE",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container build_header2(var scr) {
    return Container(
      width: scr.width,
      height: scr.height - 200,

      // padding: EdgeInsets.fromLTRB(90, 0, width / 2, 0),
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          // opacity: 0.5,
          // alignment: Alignment.topCenter,
          fit: BoxFit.fill,
          image: AssetImage("assets/images/h2.webp"),
        ),
      ),
      alignment: Alignment.centerRight,
      child: SizedBox(
        // color: Colors.blue,
        width: scr.width,
        child: Row(
          children: [
            const Expanded(
              child: SizedBox(height: 2, width: 2),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "MSME's",
                      style: TextStyle(
                        height: 1.1,
                        fontSize: 66,
                        color: Colors.white,
                        fontFamily: constants.suranna,
                      ),
                      children: [
                        TextSpan(
                          text: "- Micro,",
                          style: TextStyle(
                            height: 1.1,
                            fontSize: 66,
                            fontFamily: constants.suranna,
                            color: constants.yellow,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Small & Medium",
                    style: TextStyle(
                      color: constants.yellow,
                      fontFamily: constants.suranna,
                      fontSize: 66,
                      height: 1.1,
                    ),
                  ),
                  Text(
                    "Scale Enterprises",
                    style: TextStyle(
                      color: constants.yellow,
                      fontFamily: constants.suranna,
                      fontSize: 66,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Irrespective of your industry, sector, what you sell or the service\nyou provide; Dr. Sola will help you create a win-win relationship\nwith your customers/ clients.",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: constants.w400,
                      fontSize: 19,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(route.trainingPage);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 12.0),
                        child: Text(
                          "GET STARTED",
                          style: TextStyle(
                            fontSize: 18,
                            color: constants.purpleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container build_header3(var scr) {
    return Container(
      width: scr.width,
      height: scr.height - 200,

      // padding: EdgeInsets.fromLTRB(90, 0, width / 2, 0),
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          // opacity: 0.5,
          // alignment: Alignment.topCenter,
          fit: BoxFit.fill,
          image: AssetImage("assets/images/h3.webp"),
        ),
      ),
      alignment: Alignment.centerRight,
      child: SizedBox(
        // color: Colors.blue,
        width: scr.width,
        child: Row(
          children: [
            const Expanded(
              child: SizedBox(height: 2, width: 2),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Multinationals, ",
                      style: TextStyle(
                        height: 1.1,
                        fontSize: 66,
                        fontFamily: constants.suranna,
                        color: constants.yellow,
                      ),
                      children: [
                        TextSpan(
                          text: "Big",
                          style: TextStyle(
                            height: 1.1,
                            fontSize: 66,
                            fontFamily: constants.suranna,
                            color: const Color.fromRGBO(61, 11, 92, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Corporates & ",
                      style: TextStyle(
                        height: 1.1,
                        fontSize: 66,
                        fontFamily: constants.suranna,
                        color: const Color.fromRGBO(61, 11, 92, 1),
                      ),
                      children: [
                        TextSpan(
                          text: "NGO's",
                          style: TextStyle(
                            height: 1.1,
                            fontSize: 66,
                            fontFamily: constants.suranna,
                            color: constants.yellow,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Dr. Sola deploys global best practices in helping these organizations\n& institutions maximize their human and material resources as they\nattain performance and consistent profitability",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: constants.w400,
                      fontSize: 19,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(route.trainingPage);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          constants.purple,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 12.0),
                        child: Text(
                          "GET STARTED",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container build_header4(var scr) {
    return Container(
      width: scr.width,
      height: scr.height - 200,

      // padding: EdgeInsets.fromLTRB(90, 0, width / 2, 0),
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          // opacity: 0.5,
          // alignment: Alignment.topCenter,
          fit: BoxFit.fill,
          image: AssetImage("assets/images/h4.webp"),
        ),
      ),
      alignment: Alignment.centerRight,
      child: SizedBox(
        // color: Colors.blue,
        width: scr.width,
        child: Row(
          children: [
            const Expanded(
              child: SizedBox(height: 2, width: 2),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Professional",
                          style: TextStyle(
                            fontFamily: constants.suranna,
                            color: constants.yellow,
                            height: 1.4,
                            fontSize: 66,
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "& ",
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 66,
                              fontFamily: constants.suranna,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: "Reliable Consulting",
                                style: TextStyle(
                                  height: 1.4,
                                  fontSize: 66,
                                  fontFamily: constants.suranna,
                                  color: constants.yellow,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Dr. Sola is that life and business coach you\nneed to make your dreams work",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: constants.w400,
                            fontSize: 19,
                          ),
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(route.trainingPage);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              constants.purpleColor,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 12.0),
                            child: Text(
                              "GET STARTED",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                    width: 80,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
