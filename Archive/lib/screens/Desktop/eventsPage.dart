import 'package:flutter/material.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/utils/functions.dart';

import '../../utils/my_widgets.dart/gallery_widgets.dart';
import '../../utils/my_widgets.dart/promotionalVideo.dart';
import '../../utils/my_widgets.dart/testimonial_widgets.dart';

class DesktopEventsPage extends StatefulWidget {
  const DesktopEventsPage({super.key});

  @override
  State<DesktopEventsPage> createState() => _DesktopEventsPageState();
}

class _DesktopEventsPageState extends State<DesktopEventsPage> {
  DesktopWidgets myWidgets = DesktopWidgets();
  bool newsYear = false;
  bool allNews = true;
  bool news2021 = false;
  bool news2022 = false;
  bool news2023 = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            myWidgets.title(width: width, tab: "events"),
            Container(
              width: width,
              height: 800,
              padding: EdgeInsets.fromLTRB(90, 0, width / 2, 0),
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/event1.webp"),
                ),
              ),
              // alignment: Alignment.centerLeft,
              // child: SizedBox(
              //   width: 400,
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       RichText(
              //         text: TextSpan(
              //           text: "I BELIEVE IN MAKING ",
              //           style: TextStyle(
              //             height: 1.5,
              //             fontSize: 48,
              //             fontFamily: constants.w700,
              //             color: Colors.white,
              //           ),
              //           children: [
              //             TextSpan(
              //               text: "YOUR BUSINESS WORK ",
              //               style: TextStyle(
              //                 height: 1.5,
              //                 fontSize: 48,
              //                 fontFamily: constants.w700,
              //                 color: constants.yellow
              //               ),
              //             ),
              //             TextSpan(
              //               text: "FOR YOU, NOT THE OTHER WAY AROUND ",
              //               style: TextStyle(
              //                 height: 1.5,
              //                 fontSize: 48,
              //                 fontFamily: constants.w700,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ),
            // Container(
            //   color: Colors.transparent,
            //   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 2,
            //         child: Image.asset("assets/images/eventsd.png"),
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Expanded(
            //         flex: 3,
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             const SizedBox(height: 20),
            //             Text(
            //               "Featured, Event",
            //               // textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontSize: constants.fontsize20,
            //                 fontFamily: constants.w400,
            //                 color: constants.purple,
            //               ),
            //             ),
            //             Text(
            //               "School Readiness",
            //               // textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontSize: constants.fontsize32,
            //                 fontFamily: constants.w700,
            //                 color: Colors.black,
            //               ),
            //             ),
            //             Text(
            //               "When: 15th August, 2023\nWhere: Benin city, Edo State",
            //               // textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontSize: constants.fontsize16,
            //                 fontFamily: constants.w400,
            //                 color: Colors.black,
            //               ),
            //             ),
            //             const SizedBox(height: 20),
            //             Text(
            //               "School readiness refers to a child's physical, emotional, and cognitive preparedness to succeed in an academic environment. It encompasses a range of skills and abilities, including language and literacy, numeracy, social skills, and self-regulation. Some of the key components of school readiness include exposure to language and literacy, opportunities for socialization and play, and a supportive home environment. By focusing on these areas and working with children to develop the skills they need to succeed in school, parents and educators can help ensure that children are well-prepared to tackle the challenges of the academic environment. Join us as we expose the.......",
            //               // textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontSize: constants.fontsize20,
            //                 fontFamily: constants.w300,
            //                 color: Colors.black,
            //               ),
            //             ),
            //             const SizedBox(height: 50),
            //             SizedBox(
            //               width: 250,
            //               child: MaterialButton(
            //                 onPressed: () {},
            //                 color: const Color.fromRGBO(79, 20, 116, 1),
            //                 hoverColor: constants.purple,
            //                 height: 53,
            //                 child: Center(
            //                   child: Text(
            //                     "Register for Event",
            //                     style: TextStyle(
            //                       fontSize: constants.fontsize20,
            //                       fontFamily: constants.w400,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 90),
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "UPCOMING EVENTS",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 5,
                    color: constants.yellow,
                    // color: const Color.fromRGBO(182, 5, 5, 1),
                    width: 170,
                  ),
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 20,
                    runSpacing: 50,
                    children: [
                      buildEvent(
                          // image: 'assets/images/gal13.png',
                          // title: 'Preparing your Teenager for the real world',
                          // venue: 'Thames Events Centre, Airport road, Benin city',
                          // duration: 'October 26, 2023 - October 27, 2023',
                          ),
                      buildEvent(
                          // image: 'assets/images/gal1.png',
                          // title: 'Preparing your Teenager for the real world',
                          // venue: 'Thames Events Centre, Airport road, Benin city',
                          // duration: 'October 26, 2023 - October 27, 2023',
                          ),
                      buildEvent(
                          // image: 'assets/images/gal16.png',
                          // title: 'Preparing your Teenager for the real world',
                          // venue: 'Thames Events Centre, Airport road, Benin city',
                          // duration: 'October 26, 2023 - October 27, 2023',
                          ),
                      buildEvent()
                    ],
                  )
                ],
              ),
            ),

            Container(
              color: const Color.fromRGBO(20, 5, 29, 1),
              width: width,
              padding: const EdgeInsets.fromLTRB(40, 25, 40, 40),
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
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/channelsTV.png",
                        height: 114,
                      ),
                      Image.asset(
                        "assets/images/iTV.png",
                        height: 168,
                      ),
                      Image.asset(
                        "assets/images/kuTV.png",
                        height: 103,
                      ),
                      Image.asset(
                        "assets/images/ebs.png",
                        height: 113,
                      ),
                    ],
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
              width: width - 60,
              height: 1,
              color: const Color.fromRGBO(0, 0, 0, 0.5),
              margin: const EdgeInsets.symmetric(vertical: 60),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 90),
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "PAST EVENTS",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 5,
                    // color: const Color.fromRGBO(182, 5, 5, 1),
                    color: const Color.fromRGBO(238, 144, 3, 1),
                    width: 150,
                  ),
                  const SizedBox(height: 40),
                  Stack(
                    children: [
                      ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return myWidgets.buildPastEvent(width);
                        },
                      ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       setState(() {
                      //         newsYear = !newsYear;
                      //       });
                      //     },
                      //     child: newsYear
                      //         ? Container(
                      //             width: 200,
                      //             // height: 30,
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 30, vertical: 40),
                      //             color: const Color.fromRGBO(239, 239, 239, 1),
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 MouseRegion(
                      //                   cursor: SystemMouseCursors.click,
                      //                   onEnter: (event) {
                      //                     setState(() {
                      //                       allNews = true;
                      //                     });
                      //                   },
                      //                   onExit: (event) {
                      //                     setState(() {
                      //                       allNews = false;
                      //                     });
                      //                   },
                      //                   child: GestureDetector(
                      //                     onTap: () {
                      //                       setState(() {
                      //                         newsYear = false;
                      //                         allNews = true;
                      //                         news2021 = false;
                      //                         news2022 = false;
                      //                         news2023 = false;
                      //                       });
                      //                     },
                      //                     child: Text(
                      //                       "All",
                      //                       style: TextStyle(
                      //                         color: Colors.black,
                      //                         fontSize: constants.fontsize18,
                      //                         fontFamily: allNews || allNews
                      //                             ? constants.w500
                      //                             : constants.w300,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 const SizedBox(height: 20),
                      //                 Container(
                      //                   width: 200,
                      //                   color: Colors.black,
                      //                   height: 1,
                      //                 ),
                      //                 const SizedBox(height: 20),
                      //                 MouseRegion(
                      //                   cursor: SystemMouseCursors.click,
                      //                   onEnter: (event) {
                      //                     setState(() {
                      //                       news2021 = true;
                      //                     });
                      //                   },
                      //                   onExit: (event) {
                      //                     setState(() {
                      //                       news2021 = false;
                      //                     });
                      //                   },
                      //                   child: GestureDetector(
                      //                     onTap: () {
                      //                       setState(() {
                      //                         newsYear = false;
                      //                         allNews = false;
                      //                         news2021 = true;
                      //                         news2022 = false;
                      //                         news2023 = false;
                      //                       });
                      //                     },
                      //                     child: Text(
                      //                       "2021",
                      //                       style: TextStyle(
                      //                         color: Colors.black,
                      //                         fontSize: constants.fontsize18,
                      //                         fontFamily: news2021 || news2021
                      //                             ? constants.w500
                      //                             : constants.w300,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 const SizedBox(height: 20),
                      //                 Container(
                      //                   width: 200,
                      //                   color: Colors.black,
                      //                   height: 1,
                      //                 ),
                      //                 const SizedBox(height: 20),
                      //                 MouseRegion(
                      //                   cursor: SystemMouseCursors.click,
                      //                   onEnter: (event) {
                      //                     setState(() {
                      //                       news2022 = true;
                      //                     });
                      //                   },
                      //                   onExit: (event) {
                      //                     setState(() {
                      //                       news2022 = false;
                      //                     });
                      //                   },
                      //                   child: GestureDetector(
                      //                     onTap: () {
                      //                       setState(() {
                      //                         newsYear = false;
                      //                         allNews = false;
                      //                         news2021 = false;
                      //                         news2022 = true;
                      //                         news2023 = false;
                      //                       });
                      //                     },
                      //                     child: Text(
                      //                       "2022",
                      //                       style: TextStyle(
                      //                         color: Colors.black,
                      //                         fontSize: constants.fontsize18,
                      //                         fontFamily: news2022 || news2022
                      //                             ? constants.w500
                      //                             : constants.w300,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 const SizedBox(height: 20),
                      //                 Container(
                      //                   width: 200,
                      //                   color: Colors.black,
                      //                   height: 1,
                      //                 ),
                      //                 const SizedBox(height: 20),
                      //                 MouseRegion(
                      //                   cursor: SystemMouseCursors.click,
                      //                   onEnter: (event) {
                      //                     setState(() {
                      //                       news2023 = true;
                      //                     });
                      //                   },
                      //                   onExit: (event) {
                      //                     setState(() {
                      //                       news2023 = false;
                      //                     });
                      //                   },
                      //                   child: GestureDetector(
                      //                     onTap: () {
                      //                       setState(() {
                      //                         newsYear = false;
                      //                         allNews = false;
                      //                         news2021 = false;
                      //                         news2022 = false;
                      //                         news2023 = true;
                      //                       });
                      //                     },
                      //                     child: Text(
                      //                       "2023",
                      //                       style: TextStyle(
                      //                         color: Colors.black,
                      //                         fontSize: constants.fontsize18,
                      //                         fontFamily: news2023 || news2023
                      //                             ? constants.w500
                      //                             : constants.w300,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           )
                      //         : Container(
                      //             width: 200,
                      //             height: 40,
                      //             color: const Color.fromRGBO(239, 239, 239, 1),
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 20),
                      //             child: Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Expanded(
                      //                   child: Text(
                      //                     allNews
                      //                         ? "All"
                      //                         : news2021
                      //                             ? "2021"
                      //                             : news2022
                      //                                 ? "2022"
                      //                                 : "2023",
                      //                     overflow: TextOverflow.ellipsis,
                      //                     style: TextStyle(
                      //                       color: Colors.black,
                      //                       fontSize: constants.fontsize18,
                      //                       fontFamily: constants.w300,
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 const Icon(Icons.arrow_drop_down)
                      //               ],
                      //             ),
                      //           ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            myWidgets.buildRecentPost(width),
             TestimonialsWidget(),
            // myWidgets.gallery(context, width: width),
            Gallery(),

            myWidgets.mailingList(width: width),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget buildEvent() {
    return Container(
      width: 320,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/shop_item1.png",
            fit: BoxFit.cover,
            height: 300,
            // width: 320,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'October 15th',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: constants.lightPurple,
                      ),
                    ),
                    Text(
                      'N15,000',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: constants.yellow,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Bringing your dying business to life',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Venue: Telegram',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: constants.lightPurple,
                      ),
                    ),
                    Text(
                      '10:00AM',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: constants.lightPurple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Bringing Your Dying Business to Life\" is an empowering event focused on revitalizing struggling businesses. Through expert guidance and practical strategies, attendees learn how to rejuvenate their enterprises, navigate challenges, and emerge stronger in today's competitive market",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        // Navigator.of(context)
                        //     .pushNamed(route.trainingPage);
                      },
                      color: constants.purple,
                      hoverColor: constants.yellow,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 12.0),
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: constants.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "N 2,000",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: constants.fontsize26,
                        fontFamily: constants.w700,
                        color: constants.purple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
