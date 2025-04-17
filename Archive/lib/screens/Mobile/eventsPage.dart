import 'package:flutter/material.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/utils/functions.dart';

import '../../utils/my_widgets.dart/gallery_widgets.dart';
import '../../utils/my_widgets.dart/promotionalVideo.dart';
import '../../utils/my_widgets.dart/testimonial_widgets.dart';

class MobileEventsPage extends StatefulWidget {
  const MobileEventsPage({super.key});

  @override
  State<MobileEventsPage> createState() => _MobileEventsPageState();
}

class _MobileEventsPageState extends State<MobileEventsPage> {
  MobileWidgets myWidgets = MobileWidgets();
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
              height: 320,
              padding: EdgeInsets.fromLTRB(30, 0, width / 2, 0),
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/event1M.webp"),
                ),
              ),
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                // width: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EVENTS',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        fontFamily: constants.w700,
                        color: constants.yellow,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Browse our upcoming events and find the one that speaks to you. We can\'t wait to help you achieve your full potential.',
                      style: TextStyle(
                        // fontWeight: FontWeight.w400,
                        fontFamily: constants.w400,
                        color: Colors.white,

                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    // RichText(
                    //   text: TextSpan(
                    //     text: "I BELIEVE IN MAKING ",
                    //     style: TextStyle(
                    //       height: 1.5,
                    //       fontSize: 48,
                    //       fontFamily: constants.w700,
                    //       color: Colors.white,
                    //     ),
                    //     children: [
                    //       TextSpan(
                    //         text: "YOUR BUSINESS WORK ",
                    //         style: TextStyle(
                    //           height: 1.5,
                    //           fontSize: 48,
                    //           fontFamily: constants.w700,
                    //           color: constants.yellow
                    //         ),
                    //       ),
                    //       TextSpan(
                    //         text: "FOR YOU, NOT THE OTHER WAY AROUND ",
                    //         style: TextStyle(
                    //           height: 1.5,
                    //           fontSize: 48,
                    //           fontFamily: constants.w700,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
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
                      fontSize: 18,
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
                  const SizedBox(height: 20),
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
            PromotionalVideo(isSmallScreen: true),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 90, 0, 40),
            //   child: Image.asset(
            //     'assets/images/vidm.webp',
            //     width: width,
            //     fit: BoxFit.cover,
            //     alignment: Alignment.topCenter,
            //   ),
            // ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "PAST EVENTS",
                    style: TextStyle(
                      fontSize: 18,
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
                  ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return myWidgets.buildPastEvent(width);
                    },
                  ),
                ],
              ),
            ),
            myWidgets.buildRecentPost(width),
            // myWidgets.testimonials(width: width, res: db.reviewList["reviews"]),
            // myWidgets.gallery(width: width),
            Gallery(isSmallScreen: true,),
                           TestimonialsWidget(isSmallScreen:true),

            myWidgets.mailingList(width: width),
            // Container(
            //   color: Colors.transparent,
            //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Image.asset("assets/images/eventsm.png"),
            //       const SizedBox(height: 20),
            //       Text(
            //         "Featured, Event",
            //         // textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: constants.fontsize14,
            //           fontFamily: constants.w300,
            //           color: constants.purple,
            //         ),
            //       ),
            //       Text(
            //         "School Readiness",
            //         // textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: constants.fontsize18,
            //           fontFamily: constants.w700,
            //           color: Colors.black,
            //         ),
            //       ),
            //       Text(
            //         "When: 15th August, 2023\nWhere: Benin city, Edo State",
            //         // textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: constants.fontsize14,
            //           fontFamily: constants.w300,
            //           color: Colors.black,
            //         ),
            //       ),
            //       const SizedBox(height: 20),
            //       Text(
            //         "School readiness refers to a child's physical, emotional, and cognitive preparedness to succeed in an academic environment. It encompasses a range of skills and abilities, including language and literacy, numeracy, social skills, and self-regulation. Some of the key components of school readiness include exposure to language and literacy, opportunities for socialization and play, and a supportive home environment. By focusing on these areas and working with children to develop the skills they need to succeed in school, parents and educators can help ensure that children are well-prepared to tackle the challenges of the academic environment. Join us as we expose the.......",
            //         // textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: constants.fontsize14,
            //           fontFamily: constants.w300,
            //           color: Colors.black,
            //         ),
            //       ),
            //       const SizedBox(height: 20),
            //       SizedBox(
            //         width: 150,
            //         child: MaterialButton(
            //           onPressed: () {},
            //           color: constants.lightPurple,
            //           hoverColor: constants.purple,
            //           height: 53,
            //           child: Center(
            //             child: Text(
            //               "Register for Event",
            //               style: TextStyle(
            //                 fontSize: constants.fontsize14,
            //                 fontFamily: constants.w400,
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   color: const Color.fromRGBO(221, 221, 221, 1),
            //   width: width,
            //   padding: const EdgeInsets.fromLTRB(30, 25, 30, 40),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Text(
            //         "FEATURED IN",
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontFamily: constants.w700,
            //           fontSize: constants.fontsize18,
            //         ),
            //       ),
            //       const SizedBox(height: 20),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           Image.asset(
            //             "assets/images/channelsTV.png",
            //             height: 40,
            //           ),
            //           Image.asset(
            //             "assets/images/iTV.png",
            //             height: 65,
            //           ),
            //           Image.asset(
            //             "assets/images/kuTV.png",
            //             width: 75,
            //           ),
            //           Image.asset(
            //             "assets/images/ebs.png",
            //             height: 45,
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   color: Colors.white,
            //   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            //   width: width,
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Text(
            //         "UPCOMING EVENTS",
            //         style: TextStyle(
            //           fontSize: constants.fontsize18,
            //           fontFamily: constants.w700,
            //           color: Colors.black,
            //         ),
            //       ),
            //       Container(
            //         height: 3,
            //         color: const Color.fromRGBO(182, 5, 5, 1),
            //         width: 100,
            //       ),
            //       const SizedBox(height: 40),
            //       SizedBox(
            //         width: width,
            //         height: 470,
            //         child: ListView.builder(
            //           itemCount: db.eventsList["events"].length,
            //           shrinkWrap: true,
            //           scrollDirection: Axis.horizontal,
            //           itemBuilder: (context, index) {
            //             return Padding(
            //               padding: const EdgeInsets.only(left: 30),
            //               child: myWidgets.buildEvent(
            //                   image: db.eventsList["events"][index]["image"],
            //                   title: db.eventsList["events"][index]["title"],
            //                   venue: db.eventsList["events"][index]["venue"],
            //                   duration: db.eventsList["events"][index]
            //                       ["duration"]),
            //             );
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   color: Colors.white,
            //   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            //   width: width,
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Text(
            //         "PAST EVENTS",
            //         style: TextStyle(
            //           fontSize: constants.fontsize18,
            //           fontFamily: constants.w700,
            //           color: Colors.black,
            //         ),
            //       ),
            //       Container(
            //         height: 3,
            //         color: const Color.fromRGBO(182, 5, 5, 1),
            //         width: 69,
            //       ),
            //       const SizedBox(height: 20),
            //       Stack(
            //         children: [
            //           Column(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               const SizedBox(height: 60),
            //               ListView.builder(
            //                 itemCount: db.pastEventsList["events"].length,
            //                 shrinkWrap: true,
            //                 // scrollDirection: Axis.horizontal,
            //                 itemBuilder: (context, index) {
            //                   return myWidgets.buildPastEvent(
            //                       width, db.pastEventsList["events"][index]);
            //                 },
            //               ),
            //             ],
            //           ),
            //           Align(
            //             alignment: Alignment.centerRight,
            //             child: GestureDetector(
            //               onTap: () {
            //                 setState(() {
            //                   newsYear = !newsYear;
            //                 });
            //               },
            //               child: newsYear
            //                   ? Container(
            //                       width: 200,
            //                       // height: 30,
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 30, vertical: 40),
            //                       color: const Color.fromRGBO(239, 239, 239, 1),
            //                       child: Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           MouseRegion(
            //                             cursor: SystemMouseCursors.click,
            //                             onEnter: (event) {
            //                               setState(() {
            //                                 allNews = true;
            //                               });
            //                             },
            //                             onExit: (event) {
            //                               setState(() {
            //                                 allNews = false;
            //                               });
            //                             },
            //                             child: GestureDetector(
            //                               onTap: () {
            //                                 setState(() {
            //                                   newsYear = false;
            //                                   allNews = true;
            //                                   news2021 = false;
            //                                   news2022 = false;
            //                                   news2023 = false;
            //                                 });
            //                               },
            //                               child: Text(
            //                                 "All",
            //                                 style: TextStyle(
            //                                   color: Colors.black,
            //                                   fontSize: constants.fontsize18,
            //                                   fontFamily: allNews || allNews
            //                                       ? constants.w500
            //                                       : constants.w300,
            //                                 ),
            //                               ),
            //                             ),
            //                           ),
            //                           const SizedBox(height: 20),
            //                           Container(
            //                             width: 200,
            //                             color: Colors.black,
            //                             height: 1,
            //                           ),
            //                           const SizedBox(height: 20),
            //                           MouseRegion(
            //                             cursor: SystemMouseCursors.click,
            //                             onEnter: (event) {
            //                               setState(() {
            //                                 news2021 = true;
            //                               });
            //                             },
            //                             onExit: (event) {
            //                               setState(() {
            //                                 news2021 = false;
            //                               });
            //                             },
            //                             child: GestureDetector(
            //                               onTap: () {
            //                                 setState(() {
            //                                   newsYear = false;
            //                                   allNews = false;
            //                                   news2021 = true;
            //                                   news2022 = false;
            //                                   news2023 = false;
            //                                 });
            //                               },
            //                               child: Text(
            //                                 "2021",
            //                                 style: TextStyle(
            //                                   color: Colors.black,
            //                                   fontSize: constants.fontsize18,
            //                                   fontFamily: news2021 || news2021
            //                                       ? constants.w500
            //                                       : constants.w300,
            //                                 ),
            //                               ),
            //                             ),
            //                           ),
            //                           const SizedBox(height: 20),
            //                           Container(
            //                             width: 200,
            //                             color: Colors.black,
            //                             height: 1,
            //                           ),
            //                           const SizedBox(height: 20),
            //                           MouseRegion(
            //                             cursor: SystemMouseCursors.click,
            //                             onEnter: (event) {
            //                               setState(() {
            //                                 news2022 = true;
            //                               });
            //                             },
            //                             onExit: (event) {
            //                               setState(() {
            //                                 news2022 = false;
            //                               });
            //                             },
            //                             child: GestureDetector(
            //                               onTap: () {
            //                                 setState(() {
            //                                   newsYear = false;
            //                                   allNews = false;
            //                                   news2021 = false;
            //                                   news2022 = true;
            //                                   news2023 = false;
            //                                 });
            //                               },
            //                               child: Text(
            //                                 "2022",
            //                                 style: TextStyle(
            //                                   color: Colors.black,
            //                                   fontSize: constants.fontsize18,
            //                                   fontFamily: news2022 || news2022
            //                                       ? constants.w500
            //                                       : constants.w300,
            //                                 ),
            //                               ),
            //                             ),
            //                           ),
            //                           const SizedBox(height: 20),
            //                           Container(
            //                             width: 200,
            //                             color: Colors.black,
            //                             height: 1,
            //                           ),
            //                           const SizedBox(height: 20),
            //                           MouseRegion(
            //                             cursor: SystemMouseCursors.click,
            //                             onEnter: (event) {
            //                               setState(() {
            //                                 news2023 = true;
            //                               });
            //                             },
            //                             onExit: (event) {
            //                               setState(() {
            //                                 news2023 = false;
            //                               });
            //                             },
            //                             child: GestureDetector(
            //                               onTap: () {
            //                                 setState(() {
            //                                   newsYear = false;
            //                                   allNews = false;
            //                                   news2021 = false;
            //                                   news2022 = false;
            //                                   news2023 = true;
            //                                 });
            //                               },
            //                               child: Text(
            //                                 "2023",
            //                                 style: TextStyle(
            //                                   color: Colors.black,
            //                                   fontSize: constants.fontsize18,
            //                                   fontFamily: news2023 || news2023
            //                                       ? constants.w500
            //                                       : constants.w300,
            //                                 ),
            //                               ),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     )
            //                   : Container(
            //                       width: 200,
            //                       height: 40,
            //                       color: const Color.fromRGBO(239, 239, 239, 1),
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 20),
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Expanded(
            //                             child: Text(
            //                               allNews
            //                                   ? "All"
            //                                   : news2021
            //                                       ? "2021"
            //                                       : news2022
            //                                           ? "2022"
            //                                           : "2023",
            //                               overflow: TextOverflow.ellipsis,
            //                               style: TextStyle(
            //                                 color: Colors.black,
            //                                 fontSize: constants.fontsize18,
            //                                 fontFamily: constants.w300,
            //                               ),
            //                             ),
            //                           ),
            //                           const Icon(Icons.arrow_drop_down)
            //                         ],
            //                       ),
            //                     ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),

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
