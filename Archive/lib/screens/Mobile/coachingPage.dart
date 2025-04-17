import 'package:flutter/material.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/utils/functions.dart';

import '../../utils/my_widgets.dart/course_widgets.dart';
import '../../utils/my_widgets.dart/gallery_widgets.dart';
import '../../utils/my_widgets.dart/testimonial_widgets.dart';

class MobileCoachingPage extends StatefulWidget {
  const MobileCoachingPage({super.key});

  @override
  State<MobileCoachingPage> createState() => _MobileCoachingPageState();
}

class _MobileCoachingPageState extends State<MobileCoachingPage> {
  MobileWidgets myWidgets = MobileWidgets();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            myWidgets.title(width: width, tab: "coaching"),
            Container(
              width: width,
              height: 320,
              padding: EdgeInsets.fromLTRB(90, 0, width / 2, 0),
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/coachingHeader3.webp"),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "EMPOWER YOURSELF WITH COACHING",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: constants.fontsize18,
                fontFamily: constants.w700,
                color: Colors.black,
              ),
            ),
            Container(
              height: 3,
              color: constants.yellow,
              // color: Color.fromRGBO(182, 5, 5, 1),
              width: 69,
            ),
            const SizedBox(height: 12),
            Text(
              "Looking to achieve your personal or professional goals with greater ease and confidence? Look no further than Dr. Sola’s expert coaching services! Dr. Sola is dedicated to helping you unlock your full potential and reach new heights. \n\nWhether you're looking to boost your career, improve your relationships, or enhance your overall well-being, her customized coaching programs will provide you with the tools and guidance you need to succeed. Don't settle for mediocrity - choose Dr. Sola’s coaching services and start living your best life today!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: constants.fontsize14,
                fontFamily: constants.w300,
                color: Colors.black,
              ),
            ),
            Container(
              color: const Color.fromRGBO(242, 242, 242, 1),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 30),
                  Image.asset("assets/images/coaching1.png"),
                  const SizedBox(
                    height: 25,
                  ),
                  Image.asset("assets/images/coaching2.png"),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Coaching with Dr. Sola Okunkpolor ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize18,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "World famous entrepreneurs and business leaders and individuals, all have coaches that hold their hands and guide their success and fame. Dr. Sola Okunkpolor is that life coach  you need, to work you through life, business and career to achieve good  success.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Image.asset("assets/images/coaching4.webp"),
                  const SizedBox(
                    height: 25,
                  ),
                  Image.asset("assets/images/coaching5.webp"),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Mentoring with Dr. Sola Okunkpolor",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize18,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Sola brings a smart and practical approach to her mentoring style as she literally becomes a novel partner, her mentees till they attain their desired goals. See Sola through people's eyes, Ready to take a leap and make your dreams work. Mentoring is about leading by knowledge and experience. You can only lead through paths you have taken. Sola Okunkpolor is the mentor you need on your journey to life and business success You need a mentor that knows the way, shows the way and goes the way.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset("assets/images/coachingMobile1.webp"),
            const SizedBox(height: 12),
            // Text(
            //   "COACHING OPTIONS",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: constants.fontsize18,
            //     fontFamily: constants.w700,
            //     color: Colors.black,
            //   ),
            // ),
            // Container(
            //   height: 3,
            //   color: constants.yellow,
            //   // color: const Color.fromRGBO(182, 5, 5, 1),
            //   width: 69,
            // ),
            // const SizedBox(height: 12),
            // Container(
            //   color: const Color.fromRGBO(244, 244, 244, 1),
            //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Individual Bespoke Coaching",
            //         style: TextStyle(
            //           fontSize: constants.fontsize16,
            //           fontFamily: constants.w700,
            //           color: constants.yellow,
            //         ),
            //       ),
            //       const SizedBox(height: 12),
            //       Text(
            //         "One-on-One Drills",
            //         style: TextStyle(
            //           fontSize: constants.fontsize16,
            //           fontFamily: constants.w700,
            //           color: Colors.black,
            //         ),
            //       ),
            //       const SizedBox(height: 12),
            //       Text(
            //         "An intensive coaching session where Sola’s prime focus is you. In this session, the goal that warranted the session is first defined then the best methodology that suits your person, schedule and goal type. This coaching is tailored-made just for you.",
            //         // textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: constants.fontsize16,
            //           fontFamily: constants.w300,
            //           color: Colors.black,
            //         ),
            //       ),
            //       const SizedBox(height: 80),
            //       Text(
            //         "Group Coaching",
            //         style: TextStyle(
            //           fontSize: constants.fontsize16,
            //           fontFamily: constants.w700,
            //           color: constants.yellow,
            //         ),
            //       ),
            //       const SizedBox(height: 12),
            //       Text(
            //         "Group Drills",
            //         style: TextStyle(
            //           fontSize: constants.fontsize16,
            //           fontFamily: constants.w700,
            //           color: Colors.black,
            //         ),
            //       ),
            //       const SizedBox(height: 12),
            //       Text(
            //         "This session is designed for people who might need the presence of others to push themselves. Equally effective as the idea to actively take you through activities that take steps closer to your goal. A generic approach but the results are still specific to you.",
            //         // textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: constants.fontsize16,
            //           fontFamily: constants.w300,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

//this one
            // Container(
            //   width: width,
            //   height: 480,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage("assets/images/meet.png"),
            //     ),
            //   ),
            //   padding: EdgeInsets.fromLTRB(10, 130, width / 2, 130),
            //   child: Container(
            //     // margin: const EdgeInsets.all(15),
            //     padding: const EdgeInsets.all(1),
            //     height: 170,
            //     width: 180,
            //     decoration: BoxDecoration(
            //       color: constants.purple,
            //       border: Border.all(
            //         color: constants.yellow,
            //         width: 5,
            //       ),
            //     ),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         border: Border.all(
            //           color: constants.yellow,
            //           width: 5,
            //         ),
            //       ),
            //       padding: const EdgeInsets.all(1),
            //       child: Container(
            //         // decoration: BoxDecoration(
            //         color: constants.yellow,
            //         //   border: Border.all(
            //         //     color: constants.yellow,
            //         //     width: 20,
            //         //   ),
            //         // ),
            //         padding:
            //             const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            //         alignment: Alignment.center,
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             Text(
            //               "SCHEDULE YOUR COACHING SESSION NOW",
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 height: 1.5,
            //                 fontSize: constants.fontsize16,
            //                 fontFamily: constants.w700,
            //                 color: Colors.black,
            //               ),
            //             ),
            //             const SizedBox(height: 20),
            //             SizedBox(
            //               width: 160,
            //               child: MaterialButton(
            //                 onPressed: () {},
            //                 color: constants.purple,
            //                 hoverColor: const Color.fromRGBO(38, 10, 56, 1),
            //                 height: 53,
            //                 child: Center(
            //                   child: Text(
            //                     "SCHEDULE NOW",
            //                     style: TextStyle(
            //                       fontSize: constants.fontsize12,
            //                       fontFamily: constants.w500,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            myWidgets.form('COACHING'),
            PopularCourses(isSmallScreen:true),
            // myWidgets.popularCourses(context, width: width),
            // myWidgets.testimonials(width: width, res: db.reviewList["reviews"]),
            // myWidgets.gallery(width: width),
                         TestimonialsWidget(isSmallScreen:true),

            Gallery(isSmallScreen: true,),
            myWidgets.mailingList(width: width),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
