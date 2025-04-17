import 'package:flutter/material.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/utils/functions.dart';

import '../../utils/my_widgets.dart/course_widgets.dart';
import '../../utils/my_widgets.dart/gallery_widgets.dart';
import '../../utils/my_widgets.dart/testimonial_widgets.dart';

class MobileConsultingPage extends StatefulWidget {
  const MobileConsultingPage({super.key});

  @override
  State<MobileConsultingPage> createState() => _MobileConsultingPageState();
}

class _MobileConsultingPageState extends State<MobileConsultingPage> {
  MobileWidgets myWidgets = MobileWidgets();
  int _radioValue = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // void _handleRadioValueChanged(int? value) {
    //   if (value != null) setState(() => _radioValue = value);
    // }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            myWidgets.title(width: width, tab: 'consulting'),
            Container(
              width: width,
              height: 320,
              padding: EdgeInsets.fromLTRB(90, 0, width / 2, 0),
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/consultingHeader2.png"),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "CONSULTING THAT MAKES DREAMS WORK",
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
                    "Welcome to a world of limitless possibilities with Dr. Sola’s transformative consultation services. Whether you're seeking to break through mental blocks, reach new levels of success, or discover your true purpose, Dr. Sola provides the expert guidance and support you need to unlock your full potential. \n\nHer unique blend of coaching and consulting expertise provides a holistic approach to personal and professional development, empowering you to transform your life from the inside out. With a focus on building deep connections and fostering a growth mindset, her consultation services provide a safe and supportive space to explore your innermost desires and develop a roadmap for success. \n\nExperience the power of transformational coaching and consulting - book Dr. Sola today to start your journey towards living the life of your dreams.",
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
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/gal3.png"),
                  const SizedBox(height: 20),
                  Container(
                    color: const Color.fromRGBO(245, 239, 249, 1),
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                          "Expert in organizational strategy, performance improvement, and growth",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: constants.fontsize14,
                            fontFamily: constants.w400,
                            color: constants.lightPurple,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Meet Sola, an expert in decluttering the systems and structures of organizations to uncover the very essence responsible for strategic growth, performance improvement, and profit increase. Through her extensive experience, Sola has developed a unique approach to organizational problem-solving, which involves a strategic diagnosis to determine the exact problem and its extent within the organization. Once the problem has been identified, Sola works closely with her clients to develop a customized solution mechanism that addresses the challenge head-on and moves the organization closer to its goals. Whether you're facing issues with workflow, communication, or performance, Sola's expertise and guidance can help you streamline your processes and achieve greater success. With Sola's support, you can expect to see tangible results and improvements in your organization's overall performance. Say goodbye to inefficiencies and roadblocks, and hello to strategic growth and increased profitability. Book a consultation with Sola today and take the first step towards organizational success!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: constants.fontsize14,
                            fontFamily: constants.w300,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 140,
                          child: MaterialButton(
                            onPressed: () {},
                            color: const Color.fromRGBO(38, 10, 56, 1),
                            hoverColor: constants.yellow,
                            height: 53,
                            child: Center(
                              child: Text(
                                "BOOK DR. SOLA",
                                style: TextStyle(
                                  fontSize: constants.fontsize16,
                                  fontFamily: constants.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Text(
            //   "CONSULTING OPTIONS",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: constants.fontsize18,
            //     fontFamily: constants.w700,
            //     color: Colors.black,
            //   ),
            // ),
            // Container(
            //   height: 3,
            //   color: const Color.fromRGBO(182, 5, 5, 1),
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
            //         "Executive Consulting",
            //         style: TextStyle(
            //           fontSize: constants.fontsize16,
            //           fontFamily: constants.w700,
            //           color: constants.yellow,
            //         ),
            //       ),
            //       const SizedBox(height: 12),
            //       Text(
            //         "FEE: \$100 / ₦36,000",
            //         style: TextStyle(
            //           fontSize: constants.fontsize16,
            //           fontFamily: constants.w700,
            //           color: Colors.black,
            //         ),
            //       ),
            //       const SizedBox(height: 12),
            //       Text(
            //         "This option involves strategic engagement with the Head or Heads of an organization and together a path to the dream of the organization can be forged. The methodology administered here is tailored to the organization.",
            //         // textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: constants.fontsize16,
            //           fontFamily: constants.w300,
            //           color: Colors.black,
            //         ),
            //       ),
            //       const SizedBox(height: 80),
            //       Text(
            //         "Team Consulting",
            //         style: TextStyle(
            //           fontSize: constants.fontsize16,
            //           fontFamily: constants.w700,
            //           color: constants.yellow,
            //         ),
            //       ),
            //       const SizedBox(height: 12),
            //       Text(
            //         "STARTING FROM: \$300 / ₦108,000",
            //         style: TextStyle(
            //           fontSize: constants.fontsize16,
            //           fontFamily: constants.w700,
            //           color: Colors.black,
            //         ),
            //       ),
            //       const SizedBox(height: 12),
            //       Text(
            //         "This option encompasses the entire team as the major objectives in this kind of engagement borders around performance improvement, sale strategy, strategic growth methods etc. The underlining idea in this option is trigger both individual and collective effectiveness at the same time.",
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
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            //   color: Colors.white,
            //   child: Column(
            //     children: [
            //       Text(
            //         "BOOK A CONSULTATION SESSION",
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontFamily: constants.w700,
            //           color: Colors.black,
            //         ),
            //       ),
            //       const SizedBox(height: 10),
            //       Container(
            //         height: 3,
            //         color: const Color.fromRGBO(182, 5, 5, 1),
            //         width: 126,
            //       ),
            //       const SizedBox(height: 12),
            //       Text(
            //         "This consultation session is designed to help you and Sola determine the suitability of a consulting relationship, and to assess the compatibility of your organizational goals with Sola's expertise and services. Following a thorough review, Sola will initiate a call to schedule an appointment with you.",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: constants.fontsize16,
            //           fontFamily: constants.w400,
            //           color: Colors.black,
            //         ),
            //       ),
            //       const SizedBox(height: 30),
            //       Card(
            //         elevation: 10,
            //         surfaceTintColor: Colors.white,
            //         child: Padding(
            //           padding: const EdgeInsets.fromLTRB(15, 15, 15, 40),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               // Container(
            //               //   // height: ,
            //               //   width: 100,
            //               //   decoration: BoxDecoration(
            //               //       image: DecorationImage(
            //               //           image: AssetImage(
            //               //               "assets/images/about2m.png"),
            //               //           fit: BoxFit.cover)),
            //               // ),
            //               Image.asset(
            //                 "assets/images/form2.png",
            //                 width: double.maxFinite,
            //               ),
            //               const SizedBox(height: 60),
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   const SizedBox(height: 2),
            //                   Text(
            //                     "Name of Organisation",
            //                     style: TextStyle(
            //                       height: 1.5,
            //                       fontSize: constants.fontsize16,
            //                       fontFamily: constants.w400,
            //                       color: const Color.fromRGBO(34, 34, 34, 0.7),
            //                     ),
            //                   ),
            //                   const SizedBox(height: 5),
            //                   TextField(
            //                     textAlignVertical: TextAlignVertical.center,
            //                     style: TextStyle(
            //                       color: Colors.black,
            //                       fontSize: 15,
            //                       fontFamily: constants.w300,
            //                     ),
            //                     // controller: searchWord,
            //                     onSubmitted: (value) {},
            //                     decoration: InputDecoration(
            //                       filled: true,
            //                       fillColor:
            //                           const Color.fromRGBO(244, 244, 244, 1),
            //                       hintText:
            //                           "Enter your organization's name/contact",
            //                       hintStyle: TextStyle(
            //                         color:
            //                             const Color.fromRGBO(34, 34, 34, 0.5),
            //                         fontSize: 15,
            //                         fontFamily: constants.w300,
            //                       ),
            //                       border: InputBorder.none,
            //                       constraints: const BoxConstraints(
            //                           maxWidth: 400, maxHeight: 40),
            //                     ),
            //                   ),
            //                   const SizedBox(height: 25),
            //                   Text(
            //                     "Email",
            //                     style: TextStyle(
            //                       height: 1.5,
            //                       fontSize: constants.fontsize16,
            //                       fontFamily: constants.w400,
            //                       color: const Color.fromRGBO(34, 34, 34, 0.7),
            //                     ),
            //                   ),
            //                   const SizedBox(height: 5),
            //                   TextField(
            //                     textAlignVertical: TextAlignVertical.center,
            //                     style: TextStyle(
            //                       color: Colors.black,
            //                       fontSize: 15,
            //                       fontFamily: constants.w300,
            //                     ),
            //                     // controller: searchWord,
            //                     onSubmitted: (value) {},
            //                     decoration: InputDecoration(
            //                       filled: true,
            //                       fillColor:
            //                           const Color.fromRGBO(244, 244, 244, 1),
            //                       hintText: "Enter your email address",
            //                       hintStyle: TextStyle(
            //                         color:
            //                             const Color.fromRGBO(34, 34, 34, 0.5),
            //                         fontSize: 15,
            //                         fontFamily: constants.w300,
            //                       ),
            //                       border: InputBorder.none,
            //                       constraints: const BoxConstraints(
            //                           maxWidth: 400, maxHeight: 40),
            //                     ),
            //                   ),
            //                   const SizedBox(height: 25),
            //                   Text(
            //                     "Phone Number",
            //                     style: TextStyle(
            //                       height: 1.5,
            //                       fontSize: constants.fontsize16,
            //                       fontFamily: constants.w400,
            //                       color: const Color.fromRGBO(34, 34, 34, 0.7),
            //                     ),
            //                   ),
            //                   const SizedBox(height: 5),
            //                   TextField(
            //                     textAlignVertical: TextAlignVertical.center,
            //                     style: TextStyle(
            //                       color: Colors.black,
            //                       fontSize: 15,
            //                       fontFamily: constants.w300,
            //                     ),
            //                     // controller: searchWord,
            //                     onSubmitted: (value) {},
            //                     decoration: InputDecoration(
            //                       filled: true,
            //                       fillColor:
            //                           const Color.fromRGBO(244, 244, 244, 1),
            //                       hintText: "Type your Number here",
            //                       hintStyle: TextStyle(
            //                         color:
            //                             const Color.fromRGBO(34, 34, 34, 0.5),
            //                         fontSize: 15,
            //                         fontFamily: constants.w300,
            //                       ),
            //                       border: InputBorder.none,
            //                       constraints: const BoxConstraints(
            //                           maxWidth: 400, maxHeight: 40),
            //                     ),
            //                   ),
            //                   const SizedBox(height: 25),
            //                   Text(
            //                     "Select Consultation Type",
            //                     style: TextStyle(
            //                       height: 1.5,
            //                       fontSize: constants.fontsize16,
            //                       fontFamily: constants.w400,
            //                       color: const Color.fromRGBO(34, 34, 34, 0.7),
            //                     ),
            //                   ),
            //                   Row(
            //                     mainAxisSize: MainAxisSize.min,
            //                     children: <Widget>[
            //                       Row(
            //                         mainAxisSize: MainAxisSize.min,
            //                         children: [
            //                           Radio(
            //                             value: 0,
            //                             groupValue: _radioValue,
            //                             onChanged: _handleRadioValueChanged,
            //                             activeColor: constants.yellow,
            //                           ),
            //                           const SizedBox(width: 10),
            //                           GestureDetector(
            //                             onTap: () {
            //                               setState(() {
            //                                 _radioValue = 0;
            //                               });
            //                             },
            //                             child: Text(
            //                               "Executive",
            //                               style: TextStyle(
            //                                 height: 1.5,
            //                                 fontSize: constants.fontsize14,
            //                                 fontFamily: constants.w300,
            //                                 color: const Color.fromRGBO(
            //                                     34, 34, 34, 0.7),
            //                               ),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                       const SizedBox(width: 20),
            //                       Row(
            //                         mainAxisSize: MainAxisSize.min,
            //                         children: [
            //                           Radio(
            //                             value: 1,
            //                             groupValue: _radioValue,
            //                             onChanged: _handleRadioValueChanged,
            //                             // onChanged: (val){
            //                             //   setS
            //                             // },
            //                             activeColor: constants.yellow,
            //                           ),
            //                           const SizedBox(width: 10),
            //                           GestureDetector(
            //                             onTap: () {
            //                               setState(() {
            //                                 _radioValue = 1;
            //                               });
            //                             },
            //                             child: Text(
            //                               "Team",
            //                               style: TextStyle(
            //                                 height: 1.5,
            //                                 fontSize: constants.fontsize14,
            //                                 fontFamily: constants.w300,
            //                                 color: const Color.fromRGBO(
            //                                     34, 34, 34, 0.7),
            //                               ),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ],
            //                   ),
            //                   const SizedBox(height: 25),
            //                   Text(
            //                     "What are the current challenges that you need help with?",
            //                     style: TextStyle(
            //                       height: 1.5,
            //                       fontSize: constants.fontsize16,
            //                       fontFamily: constants.w400,
            //                       color: const Color.fromRGBO(34, 34, 34, 0.7),
            //                     ),
            //                   ),
            //                   const SizedBox(height: 5),
            //                   TextField(
            //                     textAlignVertical: TextAlignVertical.center,
            //                     style: TextStyle(
            //                       color: Colors.black,
            //                       fontSize: 15,
            //                       fontFamily: constants.w300,
            //                     ),
            //                     // controller: searchWord,
            //                     onSubmitted: (value) {},
            //                     decoration: InputDecoration(
            //                       filled: true,
            //                       fillColor:
            //                           const Color.fromRGBO(244, 244, 244, 1),
            //                       hintText: "Type here",
            //                       hintStyle: TextStyle(
            //                         color:
            //                             const Color.fromRGBO(34, 34, 34, 0.5),
            //                         fontSize: 15,
            //                         fontFamily: constants.w300,
            //                       ),
            //                       border: InputBorder.none,
            //                       constraints: const BoxConstraints(
            //                           maxWidth: 400, maxHeight: 40),
            //                     ),
            //                   ),
            //                   const SizedBox(height: 25),
            //                   Text(
            //                     "What are the results you are looking to achieve from your session with Dr. Sola?",
            //                     style: TextStyle(
            //                       height: 1.5,
            //                       fontSize: constants.fontsize16,
            //                       fontFamily: constants.w400,
            //                       color: const Color.fromRGBO(34, 34, 34, 0.7),
            //                     ),
            //                   ),
            //                   const SizedBox(height: 5),
            //                   TextField(
            //                     textAlignVertical: TextAlignVertical.center,
            //                     style: TextStyle(
            //                       color: Colors.black,
            //                       fontSize: 15,
            //                       fontFamily: constants.w300,
            //                     ),
            //                     // controller: searchWord,
            //                     onSubmitted: (value) {},
            //                     decoration: InputDecoration(
            //                       filled: true,
            //                       fillColor:
            //                           const Color.fromRGBO(244, 244, 244, 1),
            //                       hintText: "Type here",
            //                       hintStyle: TextStyle(
            //                         color:
            //                             const Color.fromRGBO(34, 34, 34, 0.5),
            //                         fontSize: 15,
            //                         fontFamily: constants.w300,
            //                       ),
            //                       border: InputBorder.none,
            //                       constraints: const BoxConstraints(
            //                           maxWidth: 400, maxHeight: 40),
            //                     ),
            //                   ),
            //                   const SizedBox(height: 25),
            //                   Text(
            //                     "When is the best time to reach you via call?",
            //                     style: TextStyle(
            //                       height: 1.5,
            //                       fontSize: constants.fontsize16,
            //                       fontFamily: constants.w400,
            //                       color: const Color.fromRGBO(34, 34, 34, 0.7),
            //                     ),
            //                   ),
            //                   const SizedBox(height: 5),
            //                   TextField(
            //                     textAlignVertical: TextAlignVertical.center,
            //                     style: TextStyle(
            //                       color: Colors.black,
            //                       fontSize: 15,
            //                       fontFamily: constants.w300,
            //                     ),
            //                     // controller: searchWord,
            //                     onSubmitted: (value) {},
            //                     decoration: InputDecoration(
            //                       filled: true,
            //                       fillColor:
            //                           const Color.fromRGBO(244, 244, 244, 1),
            //                       hintText: "Type here",
            //                       hintStyle: TextStyle(
            //                         color:
            //                             const Color.fromRGBO(34, 34, 34, 0.5),
            //                         fontSize: 15,
            //                         fontFamily: constants.w300,
            //                       ),
            //                       border: InputBorder.none,
            //                       constraints: const BoxConstraints(
            //                           maxWidth: 400, maxHeight: 40),
            //                     ),
            //                   ),
            //                   const SizedBox(height: 35),
            //                   Align(
            //                     alignment: Alignment.center,
            //                     child: Container(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 30, vertical: 10),
            //                       color: constants.purple,
            //                       child: Text(
            //                         "Submit Form",
            //                         style: TextStyle(
            //                           fontSize: 15,
            //                           fontFamily: constants.w400,
            //                           color: Colors.white,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Container(
              // color: Colors.white,
              color: const Color.fromRGBO(244, 244, 244, 1),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "CONSULTING OPTIONS",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 5,
                    // color: const Color.fromRGBO(182, 5, 5, 1),
                    color: const Color.fromRGBO(238, 144, 3, 1),
                    width: 150,
                  ),
                  const SizedBox(height: 60),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/consulting_option1.png",
                        // height: 700,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        "assets/images/consulting_option2.png",
                        // height: 700,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            myWidgets.form("CONSULTING"),
            PopularCourses(isSmallScreen:true),

            // myWidgets.popularCourses(context, width: width),
            // myWidgets.testimonials(width: width, res: db.reviewList["reviews"]),
            // myWidgets.gallery(width: width),
              TestimonialsWidget(),
            Gallery(isSmallScreen: true,),
            myWidgets.mailingList(width: width),
            const Footer()
          ],
        ),
      ),
    );
  }
}
