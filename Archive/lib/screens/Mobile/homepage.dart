import 'package:flutter/material.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';

import '../../utils/my_widgets.dart/course_widgets.dart';
import '../../utils/my_widgets.dart/gallery_widgets.dart';
import '../../utils/my_widgets.dart/promotionalVideo.dart';
import '../../utils/my_widgets.dart/testimonial_widgets.dart';
// import 'package:sola_web/utils/functions.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  // MobileWidgets myMobileWidgets = MobileWidgets();

  bool trainingHovered = false;
  bool coachingHovered = false;
  bool consultationHovered = false;

  int sliderCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var screen = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // myMobileWidgets.title(width: width, tab:"),
            myMobileWidgets.title(width: width, tab: "Home"),
            Image.asset(
              "assets/images/mh1.webp",
              fit: BoxFit.cover,
              //  height: 0,
              //  width: 0,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "DR. SOLA'S SOLUTIONS",
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 3,
                    // color: const Color.fromRGBO(182, 5, 5, 1),
                    color: constants.yellow,
                    width: 100,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Your dreams are valid and Dr. Sola is sold out to helping you make them work.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize18,
                      fontFamily: constants.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 50),
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
                          horizontal: 15, vertical: 30),
                      decoration: BoxDecoration(
                        color: trainingHovered
                            ? const Color.fromRGBO(242, 244, 248, 1)
                            : Colors.white,
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      height: 450,
                      // width: 234,
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
                                fontSize: constants.fontsize20,
                                fontFamily: constants.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Dr. Sola’s training/ speaking sessions are designed to cause positive adjustments in the minds of the listeners. Working with her is what your event/organization needs.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: constants.fontsize18,
                                fontFamily: constants.w400,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
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
                  const SizedBox(height: 25),
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
                          horizontal: 15, vertical: 30),
                      decoration: BoxDecoration(
                        color: coachingHovered
                            ? const Color.fromRGBO(242, 244, 248, 1)
                            : Colors.white,
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      height: 450,
                      // width: 234,
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
                                fontSize: constants.fontsize20,
                                fontFamily: constants.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Excellent athletes have coaches that lead them into victory in training before any game. Dr. Sola is the coach you need for your definite success in life and/or business.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: constants.fontsize18,
                                fontFamily: constants.w400,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            coachingHovered
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(route.coachingPage);
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
                  const SizedBox(height: 25),
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
                          horizontal: 15, vertical: 30),
                      decoration: BoxDecoration(
                        color: consultationHovered
                            ? const Color.fromRGBO(242, 244, 248, 1)
                            : Colors.white,
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      height: 450,
                      // width: 234,
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
                                "assets/images/consultation.png",
                                height: 80,
                                width: 80,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Consultation",
                              style: TextStyle(
                                fontSize: constants.fontsize20,
                                fontFamily: constants.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Helping individuals and organization attain new levels of growth and success by strategic diagnosis of the problems and delivery of creative solutions",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: constants.fontsize18,
                                fontFamily: constants.w400,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            consultationHovered
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(route.consultingPage);
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
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              // color: const Color.fromRGBO(221, 221, 221, 1),
              color: const Color.fromRGBO(20, 5, 29, 1),
              width: width,
              padding: const EdgeInsets.fromLTRB(30, 25, 30, 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "FEATURED IN",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: constants.w700,
                      fontSize: constants.fontsize18,
                    ),
                  ),
                  const SizedBox(height: 70),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/images/channelsTV.png",
                            height: 70,
                          ),
                          Image.asset(
                            "assets/images/iTV.png",
                            height: 60,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/images/kuTV.png",
                            width: 60,
                          ),
                          Image.asset(
                            "assets/images/ebs.png",
                            height: 80,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
            //   child: Image.asset(
            //     'assets/images/vidm.webp',
            //     width: screen.width,
            //     fit: BoxFit.cover,
            //     alignment: Alignment.topCenter,
            //   ),
            // ),
            PromotionalVideo(isSmallScreen: true),

            // myMobileWidgets.popularCourses(context, width: screen.width),
            PopularCourses(isSmallScreen: true),
            Container(
              color: const Color.fromRGBO(35, 8, 52, 1),
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "MY TRUSTED RESOURCES",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Ready to take the leap and make your dreams work?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize18,
                      fontFamily: constants.w400,
                      color: constants.darkYellow,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Gain access to a wealth of transformational resources designed to empower you to shatter limiting beliefs, unlock your full potential, and attain your desired outcomes with exceptional success. Let us partner together to make your dreams work.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize18,
                      fontFamily: constants.w300,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 240,
                    child: MaterialButton(
                      onPressed: () {},
                      color: constants
                          .yellow, // const Color.fromRGBO(255, 153, 0, 1),
                      hoverColor: const Color.fromRGBO(38, 10, 56, 1),
                      height: 53,
                      child: Center(
                        child: Text(
                          "EXPLORE RESOURCES",
                          style: TextStyle(
                            fontSize: constants.fontsize18,
                            fontFamily: constants.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Image.asset(
                    'assets/images/resources.png',
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),

            // myMobileWidgets.popularCourses(context, width: width),

            // Container(
            //   color: const Color.fromRGBO(240, 240, 240, 1),
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   width: width,
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Text(
            //         "RECENT POSTS",
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontFamily: constants.w700,
            //           color: Colors.black,
            //         ),
            //       ),
            //       Container(
            //         height: 1.5,
            //         color: constants.yellow,
            //         // color: const Color.fromRGBO(182, 5, 5, 1),
            //         width: 69,
            //       ),
            //       const SizedBox(height: 12),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 30),
            //         // padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           "Timeless articles for your life, career and business",
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             fontSize: constants.fontsize16,
            //             fontFamily: constants.w300,
            //             color: Colors.black,
            //           ),
            //         ),
            //       ),
            //       const SizedBox(height: 40),
            //       SizedBox(
            //         width: width,
            //         height: 360,
            //         child: ListView.builder(
            //           itemCount: db.postList["posts"].length,
            //           shrinkWrap: true,
            //           scrollDirection: Axis.horizontal,
            //           itemBuilder: (context, index) {
            //             return Padding(
            //               padding: const EdgeInsets.only(left: 30),
            //               child: myMobileWidgets.buildPost(
            //                   image: db.postList["posts"][index]["image"],
            //                   title: db.postList["posts"][index]["title"],
            //                   comments: db.postList["posts"][index]["comments"],
            //                   time: db.postList["posts"][index]["time"]),
            //             );
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            myMobileWidgets.buildRecentPost(screen.width),

            myMobileWidgets.buildOurClients(screen),
            // myMobileWidgets.testimonials(
            //     width: width, res: db.reviewList['reviews']),
            // myMobileWidgets.gallery(width: width),
            TestimonialsWidget(isSmallScreen: true),
            Gallery(isSmallScreen: true),
            Image.asset('assets/images/meet.png', width: width),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color.fromRGBO(79, 20, 116, 1),
                  width: 1.7,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromRGBO(255, 153, 0, 1),
                    width: 1.7,
                  ),
                ),
                padding: const EdgeInsets.all(50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Meet",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: constants.fontsize20,
                        fontFamily: constants.styleScript,
                        color:constants.lightPurple,// const Color.fromRGBO(79, 20, 116, 1),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "DR. SOLA OKUNKPOLOR",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: constants.fontsize18,
                        fontFamily: constants.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Certified Life & Business Coach",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: constants.fontsize18,
                        fontFamily: constants.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Dr. Sola Okunkpolor is a well grounded coach in the areas of life and business. She is also a successful entrepreneur, teacher, author and speaker.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: constants.fontsize18,
                        fontFamily: constants.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: 140,
                      child: MaterialButton(
                        onPressed: () {},
                        color: const Color.fromRGBO(38, 10, 56, 1),
                        hoverColor: const Color.fromRGBO(38, 10, 56, 1),
                        height: 50,
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
            myMobileWidgets.mailingList(width: width),
            const Footer()
          ],
        ),
      ),
    );
  }

  Container build_header1(var scr) {
    return Container(
      // width: scr.width,
      height: scr.height - 200,

      // padding: EdgeInsets.fromLTRB(90, 0, width / 2, 0),
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          // opacity: 0.5,
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
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
                  height: 1.5,
                  fontSize: 52,
                  fontFamily: constants.w600,
                  color: constants.yellow,
                ),
                children: [
                  TextSpan(
                    text: " TO MAKE",
                    style: TextStyle(
                      height: 1.5,
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
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 50),
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
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
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
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
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
                        height: 1.5,
                        fontSize: 66,
                        color: Colors.white,
                        fontFamily: constants.suranna,
                      ),
                      children: [
                        TextSpan(
                          text: "- Micro,",
                          style: TextStyle(
                            height: 1.5,
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
                    ),
                  ),
                  Text(
                    "Scale Enterprises",
                    style: TextStyle(
                      color: constants.yellow,
                      fontFamily: constants.suranna,
                      fontSize: 66,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Irrespective of your industry, sector, what you sell or the service\nyou provide; Dr. Sola will help you create a win-win relationship\nwith your customers/ clients.",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: constants.w400,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 50),
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
                            horizontal: 10.0, vertical: 12.0),
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
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
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
                        height: 1.5,
                        fontSize: 66,
                        fontFamily: constants.suranna,
                        color: constants.yellow,
                      ),
                      children: [
                        TextSpan(
                          text: "Big",
                          style: TextStyle(
                            height: 1.5,
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
                        height: 1.5,
                        fontSize: 66,
                        fontFamily: constants.suranna,
                        color: const Color.fromRGBO(61, 11, 92, 1),
                      ),
                      children: [
                        TextSpan(
                          text: "NGO's",
                          style: TextStyle(
                            height: 1.5,
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
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 50),
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
                            horizontal: 10.0, vertical: 12.0),
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
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
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
                            height: 1.5,
                            fontSize: 66,
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "& ",
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 66,
                              fontFamily: constants.suranna,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: "Reliable Consulting",
                                style: TextStyle(
                                  height: 1.5,
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
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 50),
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
                                horizontal: 10.0, vertical: 12.0),
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
