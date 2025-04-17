import 'package:flutter/material.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/utils/functions.dart';

import '../../utils/my_widgets.dart/course_widgets.dart';
import '../../utils/my_widgets.dart/gallery_widgets.dart';
import '../../utils/my_widgets.dart/testimonial_widgets.dart';

class DesktopCoachingPage extends StatefulWidget {
  const DesktopCoachingPage({super.key});

  @override
  State<DesktopCoachingPage> createState() => _DesktopCoachingPageState();
}

class _DesktopCoachingPageState extends State<DesktopCoachingPage> {
  DesktopWidgets myWidgets = DesktopWidgets();
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            myWidgets.title(width: screen.width, tab: "coaching"),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(route.bookConsultation);
              },
              child: Container(
                width: screen.width,
                height: 800,
                padding: EdgeInsets.fromLTRB(90, 0, screen.width / 2, 0),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/coachingHeader3.webp"),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "EMPOWER YOURSELF WITH COACHING",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 5,
                    // color: const Color.fromRGBO(182, 5, 5, 1),
                    color: const Color.fromRGBO(238, 144, 3, 1),
                    width: 400,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Looking to achieve your personal or professional goals with greater ease and confidence? Look no further than Dr. Sola’s expert coaching services! Dr. Sola is dedicated to helping you unlock your full potential and reach new heights. Whether you're looking to boost your career, improve your relationships, or enhance your overall well-being, her customized coaching programs will provide you with the tools and guidance you need to succeed. Don't settle for mediocrity - choose Dr.Sola’s coaching services and start living your best life today!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.transparent,
              color: const Color.fromRGBO(244, 244, 244, 1),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 90),

              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          // color: Colors.white,
                          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Coaching with Dr. Sola Okunkpolor",
                                style: TextStyle(
                                  fontSize: constants.fontsize32,
                                  fontFamily: constants.w700,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "World famous entrepreneurs and business leaders and individuals, all have coaches that hold their hands and guide their success and fame. Dr. Sola Okunkpolor is that life coach  you need, to work you through life, business and career to achieve good  success.",
                                style: TextStyle(
                                  fontSize: constants.fontsize24,
                                  fontFamily: constants.w300,
                                  color: Colors.black,
                                ),
                              ),
                              // Container(
                              //   color: const Color.fromRGBO(244, 244, 244, 1),
                              //   margin: const EdgeInsets.symmetric(horizontal: 20),
                              //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              //   child: RichText(
                              //     text: TextSpan(
                              //       text: '“',
                              //       style: TextStyle(
                              //         // height: 1.5,
                              //         fontSize: 100,
                              //         fontFamily: constants.w300,
                              //         color: constants.yellow,
                              //       ),
                              //       children: [
                              //         TextSpan(
                              //           text:
                              //               'My Life, Business and Education coaching will help you launch, grow and profit from your passions and career. I have developed a result-focused coaching method that will get your Dreams and vision to work.',
                              //           style: TextStyle(
                              //             height: 1.5,
                              //             fontSize: constants.fontsize24,
                              //             fontFamily: constants.w400,
                              //             fontStyle: FontStyle.italic,
                              //             color: Colors.black,
                              //           ),
                              //         ),
                              //         TextSpan(
                              //           text: '\n”',
                              //           style: TextStyle(
                              //             // height: 1.5,
                              //             fontSize: 100,
                              //             fontFamily: constants.w300,
                              //             color: constants.yellow,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              // const SizedBox(height: 30),
                              // Align(
                              //   alignment: Alignment.center,
                              //   child: SizedBox(
                              //     width: 200,
                              //     child: MaterialButton(
                              //       onPressed: () {
                              //         Navigator.of(context)
                              //             .pushNamed(route.bookConsultation);
                              //       },
                              //       color: const Color.fromRGBO(38, 10, 56, 1),
                              //       hoverColor: constants.yellow,
                              //       height: 53,
                              //       child: Center(
                              //         child: Text(
                              //           "BOOK DR. SOLA",
                              //           style: TextStyle(
                              //             fontSize: constants.fontsize16,
                              //             fontFamily: constants.w500,
                              //             color: Colors.white,
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Image.asset("assets/images/coaching1.png",
                            height: 400, fit: BoxFit.cover),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Image.asset("assets/images/coaching2.png",
                            height: 400, fit: BoxFit.cover),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Image.asset("assets/images/coaching4.webp",
                            height: 400, fit: BoxFit.cover),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Image.asset("assets/images/coaching5.webp",
                            height: 400, fit: BoxFit.cover),
                      ),
                      Expanded(
                        child: Container(
                          // color: Colors.white,
                          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mentoring with Dr. Sola Okunkpolor",
                                style: TextStyle(
                                  fontSize: constants.fontsize32,
                                  fontFamily: constants.w700,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Sola brings a smart and practical approach to her mentoring style as she literally becomes a novel partner, her mentees till they attain their desired goals. See Sola through people's eyes, Ready to take a leap and make your dreams work. Mentoring is about leading by knowledge and experience. You can only lead through paths you have taken. Sola Okunkpolor is the mentor you need on your journey to life and business success You need a mentor that knows the way, shows the way and goes the way.",
                                style: TextStyle(
                                  fontSize: constants.fontsize24,
                                  fontFamily: constants.w300,
                                  color: Colors.black,
                                ),
                              ),
                              // const SizedBox(height: 30),
                              // SizedBox(
                              //   width: 250,
                              //   child: MaterialButton(
                              //     onPressed: () {
                              //       Navigator.of(context)
                              //           .pushNamed(route.bookConsultation);
                              //     },
                              //     color: const Color.fromRGBO(38, 10, 56, 1),
                              //     hoverColor: constants.yellow,
                              //     height: 53,
                              //     child: Center(
                              //       child: Text(
                              //         "SCHEDULE A SESSION",
                              //         style: TextStyle(
                              //           fontSize: constants.fontsize16,
                              //           fontFamily: constants.w500,
                              //           color: Colors.white,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Container(
            //   color: Colors.transparent,
            //   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            //   child:

            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Image.asset(
                "assets/images/coaching3.webp",
                width: double.maxFinite,
              ),
            ),

            Container(
              color: Colors.white,
              //  color: const Color.fromRGBO(244, 244, 244, 1),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "COACHING OPTIONS",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 5,
                    // color: const Color.fromRGBO(182, 5, 5, 1),
                    color: const Color.fromRGBO(238, 144, 3, 1),
                    width: 300,
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/coaching_option1.png",
                        height: 600,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        "assets/images/coaching_option2.png",
                        height: 600,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Container(
            //   color: Colors.white,
            //   height: 600,
            //   // padding: const EdgeInsets.symmetric(horizontal: 90),
            //   margin: const EdgeInsets.symmetric(vertical: 50),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Expanded(
            //         flex: 2,
            //         child: Container(
            //           // margin: const EdgeInsets.all(15),
            //           padding: const EdgeInsets.all(3),
            //           height: 600,
            //           decoration: BoxDecoration(
            //             color: constants.purple,
            //             border: Border.all(
            //               color: constants.yellow,
            //               width: 20,
            //             ),
            //           ),
            //           child: Container(
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               border: Border.all(
            //                 color: constants.yellow,
            //                 width: 20,
            //               ),
            //             ),
            //             padding: const EdgeInsets.all(3),
            //             child: Container(
            //               // decoration: BoxDecoration(
            //               color: constants.yellow,
            //               //   border: Border.all(
            //               //     color: constants.yellow,
            //               //     width: 20,
            //               //   ),
            //               // ),
            //               padding: const EdgeInsets.all(50),
            //               alignment: Alignment.center,
            //               child: Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   Text(
            //                     "SCHEDULE YOUR COACHING SESSION NOW",
            //                     textAlign: TextAlign.center,
            //                     style: TextStyle(
            //                       height: 1.5,
            //                       fontSize: constants.fontsize32,
            //                       fontFamily: constants.w700,
            //                       color: Colors.black,
            //                     ),
            //                   ),
            //                   const SizedBox(height: 100),
            //                   SizedBox(
            //                     width: 160,
            //                     child: MaterialButton(
            //                       onPressed: () {
            //                         Navigator.of(context)
            //                             .pushNamed(route.bookConsultation);
            //                       },
            //                       color: constants.purple,
            //                       hoverColor:
            //                           const Color.fromRGBO(38, 10, 56, 1),
            //                       height: 53,
            //                       child: Center(
            //                         child: Text(
            //                           "SCHEDULE NOW",
            //                           style: TextStyle(
            //                             fontSize: constants.fontsize16,
            //                             fontFamily: constants.w500,
            //                             color: Colors.white,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         flex: 3,
            //         child: Image.asset(
            //           'assets/images/meet.png',
            //           width: width,
            //           fit: BoxFit.cover,
            //           alignment: Alignment.topCenter,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            myWidgets.form(title: "COACHING"),
             PopularCourses(),
            TestimonialsWidget(),
                        Gallery(),

            // myWidgets.gallery(context, width: screen.width),
            myWidgets.mailingList(width: screen.width),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
