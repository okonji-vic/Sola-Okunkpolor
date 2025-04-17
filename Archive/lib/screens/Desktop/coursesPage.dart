import 'package:flutter/material.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/utils/functions.dart';

import '../../api_service/course_api.dart';
import '../../utils/global.dart';
import '../../utils/my_widgets.dart/course_widgets.dart';
import '../../utils/my_widgets.dart/gallery_widgets.dart';
import '../../utils/my_widgets.dart/promotionalVideo.dart';
import '../../utils/my_widgets.dart/testimonial_widgets.dart';

class DesktopCoursesPage extends StatefulWidget {
  const DesktopCoursesPage({super.key});

  @override
  State<DesktopCoursesPage> createState() => _DesktopCoursesPageState();
}

class _DesktopCoursesPageState extends State<DesktopCoursesPage> {
  DesktopWidgets myWidgets = DesktopWidgets();
  List<dynamic> _future_list = [];
  Future<dynamic>? _futureData;

  // List categoryList = [];
  List keyWordList = [];
  List selectedCategories = [];
  List selectedKeywords = [];

  String pricing = "";

  @override
  void initState() {
    getCategories();
    getKeywords();
    loadFuture();
    super.initState();
  }

  getCategories() async {
    try {
      var res = await viewCourseCategories();
      if (res['msg'] == 'success') {
        List categoryList = res['categories']['categories'];
        for (int i = 0; i < categoryList.length; i++) {
          courseCategoryFilter.add({
            "filter": categoryList[i],
            "checked": false,
          });
        }
        setState(() {});
      }
    } catch (e) {}
  }

  getKeywords() async {
    try {
      var res = await viewCourseKeywords();
      debugPrint(res.toString());
      if (res['msg'] == 'success') {
        keyWordList = res['keywords']['keywords'];
        setState(() {});
      }
    } catch (e) {}
  }

  loadFuture() {
    if (pricing == "" &&
        selectedCategories.isEmpty &&
        selectedKeywords.isEmpty) {
      print(1);
      _futureData = viewCourses();
    } else if (pricing.isNotEmpty &&
        selectedCategories.isEmpty &&
        selectedKeywords.isEmpty) {
      print(2);
      _futureData = viewFilterCourses(
          pricing,
          courseCategoryFilter.map((e) {
            return e['filter'];
          }).toList(),
          keyWordList);
    } else {
      _futureData =
          viewFilterCourses(pricing, selectedCategories, selectedKeywords);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            myWidgets.title(width: width, tab: "courses"),
            Container(
              width: width,
              height: 800,
              padding: EdgeInsets.fromLTRB(90, 0, width / 2, 0),
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/coursesHeader.png"),
                ),
              ),
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 600,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "I BELIEVE IN MAKING ",
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 48,
                          fontFamily: constants.w700,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: "YOUR BUSINESS WORK ",
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 48,
                                fontFamily: constants.w700,
                                color: constants.yellow),
                          ),
                          TextSpan(
                            text: "FOR YOU, NOT THE OTHER WAY AROUND ",
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 48,
                              fontFamily: constants.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sideBarFilter(
                    width,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        keyWordWidget(),
                        const SizedBox(
                          height: 50,
                        ),
                        //  BuildCourses(),
                        FutureBuilder<dynamic>(
                          future: _futureData,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: primaryColor,
                                ),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              print(
                                  '>>>>>>>>>>>>>>>>>>>>>>> CHECKING... ${snapshot.data} ');
                              if (snapshot.hasError) {
                                // NO INTERNET CONNECTION
                                return const Center(
                                  child: Text(
                                      "No internet connection. Please try again"),
                                );
                              } else if (snapshot.hasData) {
                                //main widget here

                                // dynamic adminsList = snapshot.data;
                                if (snapshot.data["status"] == "ok") {
                                  // news = courses["articles"];
                                  // print('>>>>>>>>>>>>>>>>>>>>>>> ${snapshot.data}');

                                  if (snapshot.data["courses"] != null) {
                                    _future_list = snapshot.data["courses"];
                                  } else {
                                    _future_list = [];
                                  }

                                  if (_future_list.isEmpty) {
                                    return const Center(
                                      child: Text(
                                        'No course found',
                                        style: TextStyle(
                                          // fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    );
                                  } else {
                                    // admins_count = snapshot.data['total_count'];
                                    return Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      runSpacing: 15,
                                      spacing: 15,
                                      children: List.generate(
                                          _future_list.length, (index) {
                                        return BuildCourse(
                                          courseData: _future_list[index],
                                        );
                                      }),
                                    );
                                  }
                                } else {
                                  // //print('>>>>>>>>>>>>>>>>>>>>>>> AN ERROR OCCURED ');

                                  return const Center(
                                    child: Text("An unknown error occured"),
                                  );
                                }
                              } else {
                                return const Center(
                                  child: Text("A server error occured"),
                                );
                              }
                            } else {
                              return const Center(
                                child: Text("A server error occured"),
                              );
                            }
                          },
                        ),
                   
                   
                      ],
                    ),
                  ),
                ],
              ),
            ),
PromotionalVideo(),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(90, 90, 90, 40),
            //   child: Image.asset(
            //     'assets/images/vid.webp',
            //     width: width,
            //     fit: BoxFit.cover,
            //     alignment: Alignment.topCenter,
            //   ),
            // ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 90),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  color: const Color.fromRGBO(20, 5, 29, 1),
                  width: width / 6,
                  padding: const EdgeInsets.fromLTRB(40, 25, 40, 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "FEATURED IN",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: constants.w700,
                          fontSize: constants.fontsize24,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Image.asset(
                        "assets/images/channelsTV.png",
                        height: 110,
                      ),
                      const SizedBox(height: 30),
                      Image.asset(
                        "assets/images/iTV.png",
                        height: 170,
                      ),
                      const SizedBox(height: 30),
                      Image.asset(
                        "assets/images/kuTV.png",
                        height: 100,
                      ),
                      const SizedBox(height: 60),
                      Image.asset(
                        "assets/images/ebs.png",
                        height: 110,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                Expanded(
                  child: PopularCourses(),
                ),
              ]),
            ),
            myWidgets.buildRecentPost(
                width, const Color.fromRGBO(243, 243, 243, 1)),

             TestimonialsWidget(),
            Gallery(),

            // myWidgets.gallery(context, width: width),

            myWidgets.mailingList(width: width),
            const Footer()
            // Container(
            //   color: Colors.white,
            //   padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 50),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Text(
            //         "THE SOLA OKUNKPOKLOR COURSE SUITE",
            //         style: TextStyle(
            //           fontSize: 32,
            //           fontFamily: constants.w700,
            //           color: Colors.black,
            //         ),
            //       ),
            //       Container(
            //         height: 5,
            //         color: Color.fromRGBO(182, 5, 5, 1),
            //         width: 400,
            //       ),
            //       const SizedBox(height: 12),
            //       Text(
            //         "Dr. Sola's programs are highly customized and tailored to the needs of each individual or organization. For example, his Intelligent Leader Program is a six-month leadership development program that includes coaching, workshops, and peer-to-peer learning. The program is designed to help individuals become more effective and self-aware leaders, and is suitable for individuals in leadership positions who are looking to enhance their leadership skills and drive organizational growth.",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: constants.fontsize20,
            //           fontFamily: constants.w300,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   color: Colors.transparent,
            //   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Expanded(
            //         flex: 2,
            //         child: Image.asset("assets/images/gal3.png"),
            //       ),
            //       Expanded(
            //         flex: 3,
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: Color.fromRGBO(255, 255, 255, 1),
            //             border: Border.all(
            //               width: 0.5,
            //               color: Color.fromRGBO(0, 0, 0, 0.2),
            //             ),
            //           ),
            //           padding: const EdgeInsets.fromLTRB(50, 60, 80, 70),
            //           child: Column(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Image.asset(
            //                 "assets/images/courseIcon1.png",
            //                 height: 123,
            //               ),
            //               SizedBox(height: 20),
            //               Text(
            //                 "THE INTELLIGENT LEADER PROGRAM",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: constants.fontsize32,
            //                   fontFamily: constants.w700,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //               Text(
            //                 "SIX-MONTH LEADERSHIP DEVELOPMENT PROGRAM",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: constants.fontsize20,
            //                   fontFamily: constants.w300,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //               SizedBox(height: 20),
            //               Container(
            //                 height: 2,
            //                 color: Color.fromRGBO(38, 10, 56, 1),
            //                 width: 120,
            //               ),
            //               SizedBox(height: 20),
            //               Text(
            //                 "This is a comprehensive six-month leadership development program that helps participants become more effective and self-aware leaders. The program includes coaching sessions, workshops, peer-to-peer learning, and assessments to help participants identify their strengths and weaknesses. The program is suitable for individuals in leadership positions who are looking to enhance their leadership skills and drive organizational growth.",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: constants.fontsize20,
            //                   fontFamily: constants.w300,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //               SizedBox(height: 50),
            //               SizedBox(
            //                 width: 250,
            //                 child: MaterialButton(
            //                   onPressed: () {},
            //                   color: const Color.fromRGBO(38, 10, 56, 1),
            //                   hoverColor: constants.yellow,
            //                   height: 53,
            //                   child: Center(
            //                     child: Text(
            //                       "LET'S GET STARTED >",
            //                       style: TextStyle(
            //                         fontSize: constants.fontsize20,
            //                         fontFamily: constants.w600,
            //                         color: Colors.white,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   color: Colors.transparent,
            //   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: Color.fromRGBO(255, 255, 255, 1),
            //             border: Border.all(
            //               width: 0.5,
            //               color: Color.fromRGBO(0, 0, 0, 0.2),
            //             ),
            //           ),
            //           padding: const EdgeInsets.fromLTRB(50, 60, 80, 70),
            //           child: Column(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Image.asset(
            //                 "assets/images/courseIcon2.png",
            //                 height: 123,
            //               ),
            //               SizedBox(height: 20),
            //               Text(
            //                 "PERSONAL EFFECTIVENESS MASTERCLASS",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: constants.fontsize32,
            //                   fontFamily: constants.w700,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //               Text(
            //                 "LEVEL UP YOUR COMMUNICATION SKILL",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: constants.fontsize20,
            //                   fontFamily: constants.w300,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //               SizedBox(height: 20),
            //               Container(
            //                 height: 2,
            //                 color: Color.fromRGBO(38, 10, 56, 1),
            //                 width: 120,
            //               ),
            //               SizedBox(height: 20),
            //               Text(
            //                 "This is a one-day workshop that teaches individuals how to improve their personal effectiveness, manage their time effectively, and achieve their personal and professional goals. The workshop covers topics such as goal-setting, time management, and productivity. The workshop is suitable for individuals who are looking to enhance their personal effectiveness and achieve their goals.",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: constants.fontsize20,
            //                   fontFamily: constants.w300,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //               SizedBox(height: 50),
            //               SizedBox(
            //                 width: 250,
            //                 child: MaterialButton(
            //                   onPressed: () {},
            //                   color: const Color.fromRGBO(38, 10, 56, 1),
            //                   hoverColor: constants.yellow,
            //                   height: 53,
            //                   child: Center(
            //                     child: Text(
            //                       "LET'S GET STARTED >",
            //                       style: TextStyle(
            //                         fontSize: constants.fontsize20,
            //                         fontFamily: constants.w600,
            //                         color: Colors.white,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         flex: 2,
            //         child: Image.asset("assets/images/gal11.png"),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   color: Colors.transparent,
            //   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Expanded(
            //         flex: 2,
            //         child: Image.asset("assets/images/training1.png"),
            //       ),
            //       Expanded(
            //         flex: 3,
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: Color.fromRGBO(255, 255, 255, 1),
            //             border: Border.all(
            //               width: 0.5,
            //               color: Color.fromRGBO(0, 0, 0, 0.2),
            //             ),
            //           ),
            //           padding: const EdgeInsets.fromLTRB(50, 60, 80, 70),
            //           child: Column(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Image.asset(
            //                 "assets/images/courseIcon3.png",
            //                 height: 123,
            //               ),
            //               SizedBox(height: 20),
            //               Text(
            //                 "BUSINESS TRANSFORMATION PROGRAM",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: constants.fontsize32,
            //                   fontFamily: constants.w700,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //               Text(
            //                 "DESIGNED FOR BUSNESS TRANSFORMATION",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: constants.fontsize20,
            //                   fontFamily: constants.w300,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //               SizedBox(height: 20),
            //               Container(
            //                 height: 2,
            //                 color: Color.fromRGBO(38, 10, 56, 1),
            //                 width: 120,
            //               ),
            //               SizedBox(height: 20),
            //               Text(
            //                 "This program is designed for organizations that are looking to transform their business and achieve sustainable growth. The program includes a comprehensive analysis of the organization's current state, development of a transformation strategy, and implementation support. The program is suitable for organizations that are facing significant challenges and need to transform their business to remain competitive.",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: constants.fontsize20,
            //                   fontFamily: constants.w300,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //               SizedBox(height: 50),
            //               SizedBox(
            //                 width: 250,
            //                 child: MaterialButton(
            //                   onPressed: () {},
            //                   color: const Color.fromRGBO(38, 10, 56, 1),
            //                   hoverColor: constants.yellow,
            //                   height: 53,
            //                   child: Center(
            //                     child: Text(
            //                       "LET'S GET STARTED >",
            //                       style: TextStyle(
            //                         fontSize: constants.fontsize20,
            //                         fontFamily: constants.w600,
            //                         color: Colors.white,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   color: Colors.transparent,
            //   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: Color.fromRGBO(255, 255, 255, 1),
            //             border: Border.all(
            //               width: 0.5,
            //               color: Color.fromRGBO(0, 0, 0, 0.2),
            //             ),
            //           ),
            //           padding: const EdgeInsets.fromLTRB(50, 60, 80, 70),
            //           child: Column(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Image.asset(
            //                 "assets/images/courseIcon4.png",
            //                 height: 123,
            //               ),
            //               SizedBox(height: 20),
            //               Text(
            //                 "LEADERSHIP COACHING",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: constants.fontsize32,
            //                   fontFamily: constants.w700,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //               Text(
            //                 "LEVEL UP YOUR COMMUNICATION SKILL",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: constants.fontsize20,
            //                   fontFamily: constants.w300,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //               SizedBox(height: 20),
            //               Container(
            //                 height: 2,
            //                 color: Color.fromRGBO(38, 10, 56, 1),
            //                 width: 120,
            //               ),
            //               SizedBox(height: 20),
            //               Text(
            //                 "Dr. Sola Okunkpolor offers individual coaching to executives and business leaders who are looking to enhance their leadership skills and achieve their goals. The coaching sessions are customized to the individual's needs and goals and may cover topics such as leadership development, communication, and change management.",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: constants.fontsize20,
            //                   fontFamily: constants.w300,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //               SizedBox(height: 50),
            //               SizedBox(
            //                 width: 250,
            //                 child: MaterialButton(
            //                   onPressed: () {},
            //                   color: const Color.fromRGBO(38, 10, 56, 1),
            //                   hoverColor: constants.yellow,
            //                   height: 53,
            //                   child: Center(
            //                     child: Text(
            //                       "LET'S GET STARTED >",
            //                       style: TextStyle(
            //                         fontSize: constants.fontsize20,
            //                         fontFamily: constants.w600,
            //                         color: Colors.white,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         flex: 2,
            //         child: Image.asset("assets/images/courses1.png"),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   color: Color.fromRGBO(255, 153, 0, 1),
            //   margin: const EdgeInsets.symmetric(horizontal: 190, vertical: 50),
            //   padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 30),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       Text(
            //         "A person’s state of mind is a critical factor in achieving sustainable success and creating long-term wealth.",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: 28,
            //           fontFamily: constants.openSans,
            //           fontStyle: FontStyle.italic,
            //           color: Colors.white,
            //         ),
            //       ),
            //       SizedBox(height: 10),
            //       Padding(
            //         padding: const EdgeInsets.only(right: 150),
            //         child: Text(
            //           " - Dr. Sola Okunkpolor",
            //           textAlign: TextAlign.right,
            //           style: TextStyle(
            //             fontSize: constants.fontsize24,
            //             fontFamily: constants.openSans,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget keyWordWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Wrap(
        runSpacing: 15,
        spacing: 15,
        // runAlignment: Alignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        
      ),
    );
  }

  Widget sideBarFilter(var width) {
    return SizedBox(
      width: width / 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      
      ),
    );
  }

  List<dynamic> courseCategoryFilter = [
    {
      "filter": "All Courses",
      "checked": false,
    },
    // {
    //   "filter": "Career",
    //   "checked": false,
    // },
    // {
    //   "filter": "Mentorship",
    //   "checked": false,
    // },
    // {
    //   "filter": "Education",
    //   "checked": false,
    // },
    // {
    //   "filter": "Business",
    //   "checked": false,
    // },
    // {
    //   "filter": "Start up",
    //   "checked": false,
    // },
    // {
    //   "filter": "Marriage",
    //   "checked": false,
    // },
    // {
    //   "filter": "Counselling",
    //   "checked": false,
    // },
    // {
    //   "filter": "Submission",
    //   "checked": false,
    // },
    // {
    //   "filter": "Family",
    //   "checked": false,
    // },
    // {
    //   "filter": "Children",
    //   "checked": false,
    // },
    // {
    //   "filter": "LeaderShip",
    //   "checked": false,
    // },
  ];

  Widget courseCategoryWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
    );
  }

 

  Widget PricingFilterWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     
    );
  }
}
