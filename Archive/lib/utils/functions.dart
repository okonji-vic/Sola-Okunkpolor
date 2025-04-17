// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:sola_web/Screens/Home/home_page.dart';
// import 'package:sola_web_service/pages/profiles/sellers_profile.dart';
// import 'package:sola_web/Screens/ad_page.dart';
// import 'package:url_launcher/url_launcher.dart';

// import 'package:sola_web/Screens/Home/Components/body.dart';

import 'package:sola_web/main.dart';
import 'package:flutter/material.dart';

import '../api_service/subscribe_api.dart';
import 'global.dart';
// import 'package:sola_web/utils/palette.dart';
import 'dart:html' as html;

class DesktopWidgets {
  final TextStyle myTextStyle = const TextStyle(
    fontSize: 12,
  );

  TextEditingController searchWordController = TextEditingController();
  Widget title({
    required double width,
    required String tab,
    bool isAdmin = false,
    bool show_divider = false,
  }) {
    bool homeHovered = false;
    // bool aboutHovered = false;
    bool servicesHovered = false;
    bool coursesHovered = false;
    bool eventHovered = false;
    bool shopHovered = false;
    bool blogHovered = false;
    bool galleryHovered = false;
    bool loginHovered = false;
    bool shareHovered = false;
    double space = 60;

    return StatefulBuilder(builder: ((context, setState) {
      if (width < 1070) {
        space = 20;
      } else {
        space = 30;
      }
      return Column(
        children: [
          Container(
            width: width,
            color: Colors.white,
            padding: width > 1060
                ? const EdgeInsets.fromLTRB(90, 10, 60, 10)
                : const EdgeInsets.fromLTRB(80, 10, 80, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(route.homePage);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      width > 1070
                          ? Image.asset(
                              "assets/images/icon.png",
                              fit: BoxFit.contain,
                              height: 40, //tab == "auth" ? 50 : 58,
                              // width: 60,
                            )
                          : Image.asset(
                              "assets/images/icon.png",
                              height: 48,
                              // width: 50,
                            ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          homeHovered = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          homeHovered = false;
                        });
                      },
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(route.homePage);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "HOME",
                              style: TextStyle(
                                color: tab == "home" || homeHovered
                                    ? const Color.fromRGBO(255, 153, 0, 1)
                                    : const Color.fromRGBO(0, 0, 0, 0.8),
                                fontFamily: tab == "home" || homeHovered
                                    ? constants.w600
                                    : constants.w400,
                                fontSize: constants.fontsize18,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // Container(
                            //   color: aboutHovered || tab == "home"
                            //       ? const Color.fromRGBO(23, 132, 116, 1)
                            //       : Colors.transparent,
                            //   height: 3,
                            //   width: 50,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: space),

                    // MouseRegion(
                    //   onEnter: (event) {
                    //     setState(() {
                    //       aboutHovered = true;
                    //     });
                    //   },
                    //   onExit: (event) {
                    //     setState(() {
                    //       aboutHovered = false;
                    //     });
                    //   },
                    //   cursor: SystemMouseCursors.click,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.of(context).pushNamed(route.aboutPage);
                    //     },
                    //     child: Column(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Text(
                    //           "ABOUT",
                    //           style: TextStyle(
                    //             color: tab == "about" || aboutHovered
                    //                 ? const Color.fromRGBO(255, 153, 0, 1)
                    //                 : const Color.fromRGBO(0, 0, 0, 0.8),
                    //             fontFamily: tab == "about" || aboutHovered
                    //                 ? constants.w600
                    //                 : constants.w400,
                    //             fontSize: constants.fontsize18,
                    //           ),
                    //         ),
                    //         const SizedBox(height: 6),
                    //         // Container(
                    //         //   color: aboutHovered || tab == "home"
                    //         //       ? const Color.fromRGBO(23, 132, 116, 1)
                    //         //       : Colors.transparent,
                    //         //   height: 3,
                    //         //   width: 50,
                    //         // ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(width: space),

                    MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          servicesHovered = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          servicesHovered = false;
                        });
                      },
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTapDown: (TapDownDetails details) {
                          // Navigator.of(context).pushNamed(route.);
                          showPopupMenu(details.globalPosition, context);
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "SERVICES",
                                  style: TextStyle(
                                    color: tab == "services" ||
                                            tab == "training" ||
                                            tab == "coaching" ||
                                            tab == "consultation" ||
                                            servicesHovered
                                        ? const Color.fromRGBO(255, 153, 0, 1)
                                        : const Color.fromRGBO(0, 0, 0, 0.8),
                                    fontFamily: tab == "services" ||
                                            tab == "training" ||
                                            tab == "coaching" ||
                                            tab == "consultation" ||
                                            servicesHovered
                                        ? constants.w600
                                        : constants.w400,
                                    fontSize: constants.fontsize18,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: tab == "services" || servicesHovered
                                      ? const Color.fromRGBO(255, 153, 0, 1)
                                      : const Color.fromRGBO(0, 0, 0, 0.8),
                                )
                              ],
                            ),
                            const SizedBox(height: 6),
                            // Container(
                            //   color: servicesHovered ||
                            //           tab == "solutions" ||
                            //           tab == "medplan" ||
                            //           tab == "naijapharms" ||
                            //           tab == "tellapharm" ||
                            //           tab == "octavia"
                            //       ? const Color.fromRGBO(23, 132, 116, 1)
                            //       : Colors.transparent,
                            //   height: 3,
                            //   width: 85,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: space),
                    MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          coursesHovered = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          coursesHovered = false;
                        });
                      },
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pushNamed(route.coursesPage);
                          html.window.open('https://academy.solaokunkpolor.com/welcome', 'new tab');
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "ACADEMY",
                              style: TextStyle(
                                color: tab == "academy" || coursesHovered
                                    ? const Color.fromRGBO(255, 153, 0, 1)
                                    : const Color.fromRGBO(0, 0, 0, 0.8),
                                fontFamily: tab == "academy" || coursesHovered
                                    ? constants.w600
                                    : constants.w400,
                                fontSize: constants.fontsize18,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // Container(
                            //   color: aboutHovered || tab == "home"
                            //       ? const Color.fromRGBO(23, 132, 116, 1)
                            //       : Colors.transparent,
                            //   height: 3,
                            //   width: 50,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: space),
                    MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          eventHovered = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          eventHovered = false;
                        });
                      },
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(route.eventsPage);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "EVENT",
                              style: TextStyle(
                                color: tab == "event" || eventHovered
                                    ? const Color.fromRGBO(255, 153, 0, 1)
                                    : const Color.fromRGBO(0, 0, 0, 0.8),
                                fontFamily: tab == "event" || eventHovered
                                    ? constants.w600
                                    : constants.w400,
                                fontSize: constants.fontsize18,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // Container(
                            //   color: aboutHovered || tab == "home"
                            //       ? const Color.fromRGBO(23, 132, 116, 1)
                            //       : Colors.transparent,
                            //   height: 3,
                            //   width: 50,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: space),
                    MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          shopHovered = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          shopHovered = false;
                        });
                      },
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(route.shopPage);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "SHOP",
                              style: TextStyle(
                                color: tab == "shop" || shopHovered
                                    ? const Color.fromRGBO(255, 153, 0, 1)
                                    : const Color.fromRGBO(0, 0, 0, 0.8),
                                fontFamily: tab == "shop" || shopHovered
                                    ? constants.w600
                                    : constants.w400,
                                fontSize: constants.fontsize18,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // Container(
                            //   color: aboutHovered || tab == "home"
                            //       ? const Color.fromRGBO(23, 132, 116, 1)
                            //       : Colors.transparent,
                            //   height: 3,
                            //   width: 50,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: space),
                    MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          blogHovered = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          blogHovered = false;
                        });
                      },
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(route.blogPage);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "BLOG",
                              style: TextStyle(
                                color: tab == "blog" || blogHovered
                                    ? const Color.fromRGBO(255, 153, 0, 1)
                                    : const Color.fromRGBO(0, 0, 0, 0.8),
                                fontFamily: tab == "blog" || blogHovered
                                    ? constants.w600
                                    : constants.w400,
                                fontSize: constants.fontsize18,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // Container(
                            //   color: aboutHovered || tab == "home"
                            //       ? const Color.fromRGBO(23, 132, 116, 1)
                            //       : Colors.transparent,
                            //   height: 3,
                            //   width: 50,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: space),
                    MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          galleryHovered = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          galleryHovered = false;
                        });
                      },
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(route.galleryPage);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "GALLERY",
                              style: TextStyle(
                                color: tab == "gallery" || galleryHovered
                                    ? const Color.fromRGBO(255, 153, 0, 1)
                                    : const Color.fromRGBO(0, 0, 0, 0.8),
                                fontFamily: tab == "gallery" || galleryHovered
                                    ? constants.w600
                                    : constants.w400,
                                fontSize: constants.fontsize18,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // Container(
                            //   color: aboutHovered || tab == "home"
                            //       ? const Color.fromRGBO(23, 132, 116, 1)
                            //       : Colors.transparent,
                            //   height: 3,
                            //   width: 50,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(width: space),
//                     Padding(
//   padding:const EdgeInsets.symmetric(horizontal: 8.0),
//   // padding: const EdgeInsets.only(bottom: 8.0),
//   child: GestureDetector(
//     onTap: () {
//       showSocialMediaPopup(context);
//     },
//     child: Row(
//       mainAxisSize: MainAxisSize.min, // Adjusts to the minimum width needed
//       children: [
//         // Icon(
//         //   Icons.share,
//         //   size: 25,
//         //   color: Colors.black87,
//         // ),
//         const SizedBox(width: 6), // Space between icon and text
//         const Text(
//           "CONNECT",
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.black87,
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
SizedBox(width: space),
MouseRegion(
  onEnter: (event) {
    setState(() {
      shareHovered = true;
    });
  },
  onExit: (event) {
    setState(() {
      shareHovered = false;
    });
  },
  cursor: SystemMouseCursors.click,
  child: GestureDetector(
    onTap: () {
      showSocialMediaPopup(context);
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),  // Adjust bottom padding here
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.share,
            size: 20,
            color: shareHovered
                ? const Color.fromRGBO(255, 153, 0, 1)  // Hover color
                : Colors.black87,  // Default color
          ),
          const SizedBox(width: 6),  // Space between icon and text
          Text(
            "CONNECT",
            style: TextStyle(
              color: shareHovered
                  ? const Color.fromRGBO(255, 153, 0, 1)
                  : const Color.fromRGBO(0, 0, 0, 0.8),
              fontFamily: shareHovered ? constants.w600 : constants.w400,
              fontSize: constants.fontsize18,
            ),
          ),
        ],
      ),
    ),
  ),
),

SizedBox(width: space),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: 20,
                        width: 1.2,
                        color: Colors.black87,
                        margin: const EdgeInsets.only(bottom: 6)),
                    SizedBox(width: space),

                    MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          loginHovered = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          loginHovered = false;
                        });
                      },
                      cursor: SystemMouseCursors.click,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "./assets/images/profile.png",
                            height: 25,
                            width: 25,
                          ),
                          
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (getX.read(v.LOGGED_IN) == null) {
                                  Navigator.of(context)
                                      .pushNamed(route.loginPage);
                                } else {
                                  Navigator.of(context)
                                      .pushNamed(route.userAccountControl);
                                }
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    getX.read(v.LOGGED_IN) == null
                                        ? "LOGIN  | SIGN UP"
                                        : "${getX.read(v.FULLNAME).split(' ')[0]}",
                                    style: TextStyle(
                                      color: tab == "auth" || loginHovered
                                          ? const Color.fromRGBO(255, 153, 0, 1)
                                          : const Color.fromRGBO(0, 0, 0, 0.8),
                                      fontFamily: tab == "auth" || loginHovered
                                          ? constants.w600
                                          : constants.w400,
                                      fontSize: constants.fontsize18,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Image.asset(
                        "./assets/images/cart.png",
                        height: 25,
                        width: 25,
                      ),
                    ),
                    // Stack(
                    //   children: [
                    //     Positioned(
                    //       top: 5,
                    //       // bottom: 10,
                    //       right: 5,
                    //       child: CircleAvatar(
                    //           backgroundColor: Colors.orange,
                    //           radius: 14,
                    //           child: Text(
                    //             "2",
                    //             style: TextStyle(
                    //               color: Colors.white,
                    //             ),
                    //           )),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.only(bottom: 8.0),
                    //       child: Image.asset(
                    //         "./assets/images/cart.png",
                    //         height: 25,
                    //         width: 25,
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    // MouseRegion(
                    //   onEnter: (event) {
                    //     setState(() {
                    //       loginHovered = true;
                    //     });
                    //   },
                    //   onExit: (event) {
                    //     setState(() {
                    //       loginHovered = false;
                    //     });
                    //   },
                    //   cursor: SystemMouseCursors.click,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.of(context).pushNamed(route.loginPage);
                    //     },
                    //     child: Column(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Text(
                    //           "LOGIN",
                    //           style: TextStyle(
                    //             color: tab == "auth" || loginHovered
                    //                 ? const Color.fromRGBO(255, 153, 0, 1)
                    //                 : const Color.fromRGBO(0, 0, 0, 0.8),
                    //             fontFamily: tab == "auth" || loginHovered
                    //                 ? constants.w600
                    //                 : constants.w400,
                    //             fontSize: constants.fontsize18,
                    //           ),
                    //         ),
                    //         const SizedBox(height: 6),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    
                  ],
                ),
              ],
            ),
          ),
          show_divider
              ? Container(
                  height: 1,
                  width: width,
                  color: Colors.black12,
                )
              : const SizedBox()
        ],
      );
    }));
  }

void showSocialMediaPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.purple,
        title: const Text("Let's Connect",
        style: TextStyle(
                            // fontSize: constants.fontsize16,
                            // fontFamily: constants.w600,
                            color: Colors.white,
                          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            ListTile(
              leading: Image.asset('assets/images/facebook.png', width: 22),
              title: const Text('Facebook', style: TextStyle(
                            color: Colors.white,
                          ),),
              onTap: () {
                html.window.open(facebookHandle, 'new tab');
              
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/linkedin.png', width: 22),
              title: const Text('LinkedIn', style: TextStyle(
                            color: Colors.white,
                          ),),
              onTap: () {
                html.window.open(linkedinHandle, 'new tab');
            
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/tiktok.png', width: 22),
              title: const Text('TikTok', style: TextStyle(
                            color: Colors.white,
                          ),),
              onTap: () {
                html.window.open(tiktokHandle, 'new tab');
            
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/instagram.png', width: 22),
              title: const Text('Instagram', style: TextStyle(
                            color: Colors.white,
                          ),),
              onTap: () {
                html.window.open(instagramHandle, 'new tab');
                
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(
                            color: Colors.white,
                          ),),
          ),
        ],
      );
    },
  );
}
  

  void showPopupMenu(Offset offset, BuildContext ctx) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: ctx,
      position: RelativeRect.fromLTRB(
          left - 100, top + 20, left + 200, double.maxFinite),
      color: const Color.fromRGBO(250, 234, 196, 1),
      constraints: const BoxConstraints(maxWidth: 400),
      items: [
        PopupMenuItem(
          value: 1,
          padding: const EdgeInsets.all(0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Training/Speaking",
                style: TextStyle(
                  fontSize: constants.fontsize16,
                  fontFamily: constants.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.black,
                width: double.maxFinite,
                height: 1,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          padding: const EdgeInsets.all(0),
          // padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              Text(
                "Coaching/Mentoring",
                style: TextStyle(
                  fontSize: constants.fontsize16,
                  fontFamily: constants.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.black,
                width: double.maxFinite,
                height: 1,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          padding: const EdgeInsets.all(0),
          // padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              Text(
                "Consultation",
                style: TextStyle(
                  fontSize: constants.fontsize16,
                  fontFamily: constants.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                color: Colors.transparent,
                width: double.maxFinite,
                // height: 1,
              )
            ],
          ),
        ),
        // PopupMenuItem(
        //   value: 4,
        //   padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20),
        //   child: Text(
        //     "Octavia",
        //     style: TextStyle(
        //       fontSize: constants.fontsize18,
        //       fontFamily: constants.w300,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
      ],
      elevation: 8.0,
    ).then((value) {
      // if (value != null) print(value);
      if (value == 1) {
        print("tapped 1");
        Navigator.of(ctx).pushNamed(route.trainingPage);
      } else if (value == 2) {
        print("tapped 2");
        Navigator.of(ctx).pushNamed(route.coachingPage);
      } else if (value == 3) {
        print("tapped 3");
        Navigator.of(ctx).pushNamed(route.consultingPage);
      } else if (value == 4) {
        // Navigator.of(ctx).pushNamed(route.octaviaPage);
      } else {
        // print("nothing tapped");
      }
    });
  }

  // Widget testimonials({required double width, required dynamic res}) {
  //   CarouselSliderController reviewController = CarouselSliderController();
  //   int currentPosition = 0;
  //   return StatefulBuilder(
  //       // stream: null,
  //       builder: (context, setCustomState) {
  //     return Container(
  //       color: Colors.white,
  //       width: width,
  //       padding: const EdgeInsets.symmetric(vertical: 80),
  //       child: Column(
  //         children: [
  //           Text(
  //             "TESTIMONIALS",
  //             style: TextStyle(
  //               fontSize: 32,
  //               fontFamily: constants.w700,
  //               color: Colors.black,
  //             ),
  //           ),
  //           Container(
  //             height: 5,
  //             color: const Color.fromRGBO(182, 5, 5, 1),
  //             width: 150,
  //           ),
  //           const SizedBox(height: 12),
  //           SizedBox(
  //             width: 400,
  //             child: Text(
  //               "We are in the business of making dreams work",
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                 fontSize: constants.fontsize18,
  //                 fontFamily: constants.w300,
  //                 color: Colors.black,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 32),
  //           SizedBox(
  //             width: 850,
  //             height: 400,
  //             child: Row(
  //               children: [
  //                 IconButton(
  //                   onPressed: () {
  //                     reviewController.previousPage();
  //                   },
  //                   icon: const Icon(Icons.keyboard_arrow_left, size: 30),
  //                 ),
  //                 Expanded(
  //                   child: CarouselSlider.builder(
  //                     // itemCount: review == "naijapharm" ? db.naijapharmsReviewList["reviews"].length : review == "medplan" ? db.medplanReviewList["reviews"].length : db.reviewList["reviews"].length,
  //                     itemCount: res.length,
  //                     // itemCount: 6,
  //                     unlimitedMode: true,
  //                     controller: reviewController,
  //                     scrollPhysics: const NeverScrollableScrollPhysics(),
  //                     // slideTransform: StackTransform(),
  //                     slideTransform: const ParallaxTransform(),
  //                     // slideTransform: const ZoomOutSlideTransform(),

  //                     enableAutoSlider: true,
  //                     autoSliderDelay: const Duration(seconds: 7),
  //                     autoSliderTransitionTime:
  //                         const Duration(milliseconds: 2000),
  //                     slideBuilder: (int index) {
  //                       // currentPosition = index;
  //                       return Center(
  //                         child: Row(
  //                           mainAxisSize: MainAxisSize.min,
  //                           children: [
  //                             // index == 0
  //                             //     ? const SizedBox()
  //                             //     : IconButton(
  //                             //         onPressed: () {
  //                             //           reviewController.previousPage();
  //                             //         },
  //                             //         icon: const Icon(Icons.keyboard_arrow_left,
  //                             //             size: 30),
  //                             //       ),
  //                             const SizedBox(width: 30),
  //                             Card(
  //                               elevation: 10,
  //                               surfaceTintColor: Colors.white,
  //                               color: Colors.white,
  //                               child: Padding(
  //                                 padding:
  //                                     const EdgeInsets.fromLTRB(16, 14, 30, 20),
  //                                 child: SizedBox(
  //                                   width: 600,
  //                                   child: Row(
  //                                     crossAxisAlignment:
  //                                         CrossAxisAlignment.start,
  //                                     children: [
  //                                       Expanded(
  //                                         child: Image.asset(
  //                                           res[index]['image'],
  //                                           fit: BoxFit.cover,
  //                                           height: double.maxFinite,
  //                                         ),
  //                                       ),
  //                                       const SizedBox(width: 30),
  //                                       Expanded(
  //                                         child: Column(
  //                                           crossAxisAlignment:
  //                                               CrossAxisAlignment.start,
  //                                           mainAxisAlignment:
  //                                               MainAxisAlignment.start,
  //                                           mainAxisSize: MainAxisSize.min,
  //                                           children: [
  //                                             const SizedBox(height: 20),
  //                                             Text(
  //                                               res[index]['body'],
  //                                               maxLines: 10,
  //                                               overflow: TextOverflow.ellipsis,
  //                                               style: TextStyle(
  //                                                 height: 1.5,
  //                                                 fontSize:
  //                                                     constants.fontsize16,
  //                                                 fontFamily:
  //                                                     constants.w400,
  //                                                 color: const Color.fromRGBO(
  //                                                     34, 34, 34, 0.7),
  //                                               ),
  //                                             ),
  //                                             const SizedBox(height: 20),
  //                                             Text(
  //                                               res[index]['name'],
  //                                               style: TextStyle(
  //                                                 fontSize:
  //                                                     constants.fontsize16,
  //                                                 fontFamily:
  //                                                     constants.w600,
  //                                                 color: const Color.fromRGBO(
  //                                                     34, 34, 34, 1),
  //                                               ),
  //                                             ),
  //                                             const SizedBox(height: 20),
  //                                             Text(
  //                                               res[index]['title'],
  //                                               style: TextStyle(
  //                                                 fontSize:
  //                                                     constants.fontsize16,
  //                                                 fontFamily:
  //                                                     constants.w400,
  //                                                 color: const Color.fromRGBO(
  //                                                     34, 34, 34, 1),
  //                                               ),
  //                                             ),
  //                                           ],
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                             const SizedBox(width: 30),
  //                             // index == res.length - 1
  //                             //     ? const SizedBox()
  //                             //     : IconButton(
  //                             //         onPressed: () {
  //                             //           reviewController.nextPage();
  //                             //         },
  //                             //         icon: const Icon(Icons.keyboard_arrow_right,
  //                             //             size: 30),
  //                             //       ),
  //                           ],
  //                         ),
  //                       );
  //                     },
  //                   ),
  //                 ),
  //                 IconButton(
  //                   onPressed: () {
  //                     reviewController.nextPage();
  //                   },
  //                   icon: const Icon(Icons.keyboard_arrow_right, size: 30),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   });
  // }

  // Widget gallery(BuildContext context, {required double width}) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [

  //       SizedBox(
  //         height: 400,
  //         width: width,
  //         child: CarouselSlider(
  //           // slideTransform: ParallaxTransform(),
  //           // slideTransform: ZoomOutSlideTransform(),
  //           slideTransform: StackTransform(),
  //           autoSliderTransitionTime: const Duration(microseconds: 1),
  //           enableAutoSlider: true,
  //           unlimitedMode: true,
  //           scrollPhysics: const NeverScrollableScrollPhysics(),
  //           children: [
  //             SizedBox(
  //               width: width,
  //               height: 400,
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal1.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                   const SizedBox(width: 10),
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal2.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                   const SizedBox(width: 10),
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal3.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                   const SizedBox(width: 10),
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal4.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               width: width,
  //               height: 400,
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal5.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                   const SizedBox(width: 10),
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal6.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                   const SizedBox(width: 10),
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal7.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                   const SizedBox(width: 10),
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal8.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               width: width,
  //               height: 400,
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal9.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                   const SizedBox(width: 10),
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal10.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                   const SizedBox(width: 10),
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal11.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                   const SizedBox(width: 10),
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal12.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               width: width,
  //               height: 400,
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal13.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                   const SizedBox(width: 10),
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal14.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                   const SizedBox(width: 10),
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal15.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                   const SizedBox(width: 10),
  //                   Expanded(
  //                       child: Image.asset(
  //                     "assets/images/gal16.png",
  //                     fit: BoxFit.cover,
  //                     width: double.maxFinite,
  //                   )),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget mailingList({required double width}) {
    bool isLoading = false;
    TextEditingController emailController = TextEditingController();

    return StatefulBuilder(builder: (context, setCustomState) {
      return Container(
        color: const Color.fromRGBO(255, 153, 0, 1),
        width: width,
        padding: const EdgeInsets.fromLTRB(90, 40, 90, 70),
        child: Column(
          children: [
            Text(
              "MAKING DREAMS WORK",
              style: TextStyle(
                height: 1.5,
                fontSize: constants.fontsize32,
                fontFamily: constants.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Ready to take the leap and make your dreams work? Join my emailing list for a mindset recalibration and switch",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontSize: constants.fontsize18,
                fontFamily: constants.w300,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: emailController,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: constants.w300,
                  ),
                  // controller: searchWord,
                  onSubmitted: (value) {},
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter your email address",
                    hintStyle: TextStyle(
                      color: const Color.fromRGBO(34, 34, 34, 0.8),
                      fontSize: 20,
                      fontFamily: constants.w300,
                    ),
                    border: InputBorder.none,
                    constraints:
                        const BoxConstraints(maxWidth: 400, maxHeight: 40),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 140,
                  child: MaterialButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                            if (emailController.text.isEmpty) {
                              helperWidgets.showToast('Enter email');
                              return;
                            }

                            try {
                              setCustomState(() {
                                isLoading = true;
                              });
                              var res = await subscribeNewsletter(
                                  emailController.text);
                              debugPrint(res.toString());
                              if (res['msg'] == 'success') {
                                helperWidgets
                                    .showToast("Subscription successful");
                                emailController.clear();
                                setCustomState(() {});
                              } else {
                                helperWidgets.showToast(
                                    "Something went wrong, please try again");
                              }
                            } catch (e) {
                              myHttpErrorHandler(e);
                            } finally {
                              setCustomState(() {
                                isLoading = false;
                              });
                            }
                          },
                    color: const Color.fromRGBO(38, 10, 56, 1),
                    hoverColor: const Color.fromRGBO(79, 20, 116, 1),
                    height: 53,
                    child: Center(
                      child: isLoading
                          ? const SizedBox(
                              child: CircularProgressIndicator(
                                  backgroundColor: Colors.black))
                          : Text(
                              "Subscribe",
                              style: TextStyle(
                                fontSize: constants.fontsize18,
                                fontFamily: constants.w400,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  buildCourse(Function navigateTo, dynamic courseData) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      width: 320,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          helperWidgets.build_cached_image(courseData['img_url'],
              height: null, width: null),
          // Image.asset('assets/images/course1.webp'),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${courseData['abbreviation']}',
                      style: TextStyle(
                        fontSize: constants.fontsize20,
                        fontFamily: constants.w700,
                        color: const Color.fromRGBO(255, 153, 0, 1),
                      ),
                    ),
                    Text(
                      capitalizeFirstLetter(courseData['course_type']),
                      style: TextStyle(
                        fontSize: constants.fontsize16,
                        fontFamily: constants.w700,
                        color: constants.lightPurple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  '${courseData['title']}',
                  style: TextStyle(
                    fontSize: constants.fontsize24,
                    fontFamily: constants.w700,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: MaterialButton(
                    onPressed: () {
                      navigateTo();
                      // Navigator.of(context).pushNamed(route.coursesPage);
                    },
                    color: const Color.fromRGBO(255, 153, 0, 1),
                    hoverColor: const Color.fromRGBO(38, 10, 56, 1),
                    height: 53,
                    child: Center(
                      child: Text(
                        "BEGIN COURSE",
                        style: TextStyle(
                          fontSize: constants.fontsize18,
                          fontFamily: constants.w700,
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
    );
  }

  buildSingleCourse(BuildContext context, Function(dynamic) navigateTo) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      width: 320,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/course1.webp'),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'BSSA',
                      style: TextStyle(
                        fontSize: constants.fontsize20,
                        fontFamily: constants.w700,
                        color: const Color.fromRGBO(255, 153, 0, 1),
                      ),
                    ),
                    Text(
                      'Paid',
                      style: TextStyle(
                        fontSize: constants.fontsize16,
                        fontFamily: constants.w700,
                        color: constants.lightPurple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  'Business Startup & Setup  Academy',
                  style: TextStyle(
                    fontSize: constants.fontsize24,
                    fontFamily: constants.w700,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: MaterialButton(
                    onPressed: () {
                      print("here");
                      navigateTo({
                        'page': 'view_course',
                      });
                    },
                    color: const Color.fromRGBO(255, 153, 0, 1),
                    hoverColor: const Color.fromRGBO(38, 10, 56, 1),
                    height: 53,
                    child: Center(
                      child: Text(
                        "BEGIN COURSE",
                        style: TextStyle(
                          fontSize: constants.fontsize18,
                          fontFamily: constants.w700,
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
    );
  }

  Widget buildRecentPost(double width, [Color color = Colors.white]) {
    return Container(
      // color: const Color.fromRGBO(240, 240, 240, 1),
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "RECENT POSTS",
            style: TextStyle(
              fontSize: 32,
              fontFamily: constants.w700,
              color: Colors.black,
            ),
          ),
          Container(
            height: 5,
            // color: const Color.fromRGBO(182, 5, 5, 1),
            color: constants.yellow, // const Color.fromRGBO(255, 153, 0, 1),

            width: 150,
          ),
          const SizedBox(height: 12),
          Text(
            "Timeless articles for your life, career and business",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: constants.fontsize20,
              fontFamily: constants.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 40),
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              spacing: 15,
              runSpacing: 30,
              children: [
                myWidgets.buildPost(
                  image: 'assets/images/blog1.webp',
                  title: 'CULTIVATING AN EXCEPTIONAL LEADER',
                  body:
                      'The Leadership of any organization is crucial to the sucess  and very important to the growth of the organization',
                  comments: '14',
                  time: '2',
                ),
                myWidgets.buildPost(
                  image: 'assets/images/blog2.png',
                  title: 'CULTIVATING AN EXCEPTIONAL LEADER',
                  body:
                      'The Leadership of any organization is crucial to the sucess  and very important to the growth of the organization',
                  comments: '14',
                  time: '2',
                ),
                myWidgets.buildPost(
                  image: 'assets/images/blog3.webp',
                  title: 'CULTIVATING AN EXCEPTIONAL LEADER',
                  comments: '14',
                  body:
                      'The Leadership of any organization is crucial to the sucess and very important to the growth of the organization',
                  time: '2',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildPost({
    required String image,
    required String title,
    required String body,
    required String comments,
    required String time,
  }) {
    return Container(
      width: 400,
      height: 240,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 180,
              height: 240,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: constants.fontsize18,
                        fontFamily: constants.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      TextSpan(
                        style: TextStyle(
                          fontSize: constants.fontsize16,
                          fontFamily: constants.w400,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: body.length <= 50
                                ? body
                                : '${body.substring(0, 50)}...',
                          ),
                          if (body.length > 50)
                            TextSpan(
                              text: 'read more',
                              style: TextStyle(
                                  color: constants.lightPurple,
                                  fontStyle: FontStyle.italic),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "$comments Comments, $time days ago",
                      style: TextStyle(
                        fontSize: constants.fontsize16,
                        fontFamily: constants.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  // Widget buildPost({
  //   required String image,
  //   required String title,
  //   required String comments,
  //   required String time,
  // }) {
  //   return SizedBox(
  //     width: 500,
  //     child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Image.asset(image),
  //           const SizedBox(height: 10),
  //           Text(
  //             "Career and Business",
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //               fontSize: constants.fontsize18,
  //               fontFamily: constants.w400,
  //               fontStyle: FontStyle.italic,
  //               color: Colors.black,
  //             ),
  //           ),
  //           const SizedBox(height: 5),
  //           Container(
  //             color: Colors.black,
  //             height: 1,
  //             width: 60,
  //             margin: const EdgeInsets.only(left: 5),
  //           ),
  //           const SizedBox(height: 10),
  //           Text(
  //             title,
  //             style: TextStyle(
  //               fontSize: constants.fontsize18,
  //               fontFamily: constants.w700,
  //               color: Colors.black,
  //             ),
  //           ),
  //           const SizedBox(height: 10),
  //           Text(
  //             "$comments Comments, $time days ago",
  //             style: TextStyle(
  //               fontSize: constants.fontsize16,
  //               fontFamily: constants.w300,
  //               color: Colors.black,
  //             ),
  //           ),
  //         ]),
  //   );
  // }

  Container buildOurClients(Size screen) {
    return Container(
      color: const Color.fromRGBO(221, 221, 221, 1),
      width: screen.width,
      padding: const EdgeInsets.fromLTRB(90, 50, 90, 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Our Clients",
            style: TextStyle(
              color: Colors.black,
              fontFamily: constants.w700,
              fontSize: constants.fontsize28,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/org_firstbank.png",
                height: 110,
              ),
              Image.asset(
                "assets/images/org_itv.png",
                height: 90,
              ),
              Image.asset(
                "assets/images/org_ecobank.png",
                height: 120,
              ),
              Image.asset(
                "assets/images/org_gt.png",
                height: 100,
              ),
              Image.asset(
                "assets/images/org_ebs.png",
                height: 100,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/org_ala.png",
                height: 90,
              ),
              Image.asset(
                "assets/images/org_globus.png",
                height: 60,
              ),
              Image.asset(
                "assets/images/social_channels.png",
                height: 90,
              ),
              Image.asset(
                "assets/images/org_ku.png",
                height: 100,
              ),
              Image.asset(
                "assets/images/org_seplat.png",
                height: 120,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildEvent(
      {required String image,
      required String title,
      required String venue,
      required String duration}) {
    return Card(
      elevation: 5,
      child: Container(
        width: 500,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(image),
          const SizedBox(height: 10),
          Text(
            duration,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: constants.fontsize16,
              fontFamily: constants.w400,
              // fontStyle: FontStyle.italic,
              color: const Color.fromRGBO(34, 34, 34, 1),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: constants.fontsize24,
              fontFamily: constants.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Venue: ',
              style: TextStyle(
                height: 1.5,
                fontSize: constants.fontsize20,
                fontFamily: constants.w600,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: venue,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: constants.fontsize20,
                    fontFamily: constants.w300,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 180,
            child: MaterialButton(
              onPressed: () {},
              color: constants.lightPurple,
              hoverColor: constants.purple,
              height: 53,
              child: Center(
                child: Text(
                  "Register for Event",
                  style: TextStyle(
                    fontSize: constants.fontsize18,
                    fontFamily: constants.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildPastEvent(double width) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      // height: 400,
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 380,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child:
                      Image.asset("assets/images/gal1.png", fit: BoxFit.cover),
                ),
                const SizedBox(width: 30),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "January 15th",
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: constants.fontsize20,
                          fontFamily: constants.w400,
                          color: const Color.fromRGBO(238, 144, 3, 1),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "School Readiness",
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: constants.fontsize24,
                          fontFamily: constants.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Venue: Whatsapp",
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: constants.fontsize18,
                          fontFamily: constants.w400,
                          color: constants.purple,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Text(
                      //   "When: 15th August, 2023\nWhere: Benin city, Edo State",
                      //   // textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     fontSize: constants.fontsize16,
                      //     fontFamily: constants.w400,
                      //     color: Colors.black,
                      //   ),
                      // ),
                      // const SizedBox(height: 20),
                      Text(
                        "Some of the key components of school readiness include exposure to language and literacy, opportunities for socialization and play, and a supportive home environment. By focusing on these areas and working with children to develop the skills they need to succeed in school, parents and educators can help ensure that children.....",
                        // textAlign: TextAlign.center,
                        // softWrap: false,
                        maxLines: 7,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: constants.fontsize20,
                          fontFamily: constants.w300,
                          color: Colors.black,
                        ),
                      ),
                      // const SizedBox(height: 15),
                      const Spacer(),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Navigator.of(context)
                              //     .pushNamed(route.trainingPage);
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 12.0),
                              child: Text(
                                "GET PDF SUMMARY",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontFamily: constants.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
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
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: width,
            height: 1,
            color: const Color.fromRGBO(0, 0, 0, 0.3),
          )
        ],
      ),
    );
  }

  Widget buildShop({required dynamic resp}) {
    return Container(
      // width: 300,
      // height: 650,
      color: Colors.white,
      // padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(resp["image"],
              fit: BoxFit.cover,
              height: 350,
              width:
                  // 320,
                  // ),
                  double.maxFinite),
          const SizedBox(height: 10),
          Text(
            resp["category"],
            style: TextStyle(
              fontSize: constants.fontsize16,
              fontFamily: constants.w400,
              fontStyle: FontStyle.italic,
              color: const Color.fromRGBO(34, 34, 34, 1),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 1,
            color: Colors.black,
            width: 56,
          ),
          const SizedBox(height: 10),
          Text(
            resp["title"],
            // textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: constants.fontsize22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            resp["body"],
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: constants.fontsize20,
              // fontFamily: constants.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: resp["price"],
                style: TextStyle(
                  height: 1.5,
                  fontSize: constants.fontsize20,
                  fontFamily: constants.w400,
                  color: const Color.fromRGBO(240, 42, 42, 1),
                  decoration: TextDecoration.lineThrough,
                ),
                children: [
                  TextSpan(
                    text: "   ${resp["discount_price"]}",
                    style: TextStyle(
                      height: 1.5,
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w400,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 130,
            child: MaterialButton(
              onPressed: () {},
              color: constants.yellow,
              hoverColor: Colors.amber,
              height: 50,
              child: Center(
                child: Text(
                  "BUY NOW",
                  style: TextStyle(
                    fontSize: constants.fontsize16,
                    fontFamily: constants.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget form({required String title}) {
    // int radioValue = 0;
    String selectedSessionType = 'Speaking';
    return StatefulBuilder(builder: (context, setState) {
      // void _handleRadioValueChanged(int? value) {
      //   if (value != null) setState(() => radioValue = value);
      // }

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 30),
        color: Colors.white,
        child: Column(
          children: [
            Text(
              "$title REQUEST FORM",
              style: TextStyle(
                fontSize: 32,
                fontFamily: constants.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 5,
              // color: const Color.fromRGBO(182, 5, 5, 1)
              color: const Color.fromRGBO(238, 144, 3, 1),
              width: 240,
            ),
            const SizedBox(height: 12),
            Text(
              "Please fill out the Booking Request Form below to schedule your session. Upon submission, my team will promptly review your request and respond to you with the cost of the proposed session, along with our Terms and Conditions of engagement.\n\nPlease note that if you have any urgent inquiries, you can utilize our chat module to speak with one of our Customer Care Representatives who will be happy to assist you.", //Thank you for Dr. Sola’s coaching services. We look forward to welcoming you onboard!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: constants.fontsize20,
                fontFamily: constants.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 10,
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 26, 25),
                child: SizedBox(
                  width: 850,
                  height: 800,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Expanded(
                      //   child: Image.asset("assets/images/about2.png"),
                      // ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Container(
                              height: 700,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/form3.webp"),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              // width: 150,
                              child: MaterialButton(
                                onPressed: () {},
                                color: constants.purple,
                                hoverColor: constants.yellow,
                                height: 53,
                                child: Center(
                                  child: Text(
                                    "SUBMIT SESSION REQUEST FORM",
                                    style: TextStyle(
                                      fontSize: constants.fontsize18,
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
                      const SizedBox(width: 25),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 2),
                            Text(
                              "Full Name",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: constants.fontsize16,
                                fontFamily: constants.w400,
                                // color: const Color.fromRGBO(34, 34, 34, 0.7),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: constants.fontsize16,
                                fontFamily: constants.w300,
                              ),
                              // controller: searchWord,
                              onSubmitted: (value) {},
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(244, 244, 244, 1),
                                hintText: "Enter your full name",
                                hintStyle: TextStyle(
                                  color: const Color.fromRGBO(34, 34, 34, 0.5),
                                  fontSize: constants.fontsize16,
                                  fontFamily: constants.w300,
                                ),
                                border: InputBorder.none,
                                constraints: const BoxConstraints(
                                    maxWidth: 400, maxHeight: 40),
                              ),
                            ),
                            const SizedBox(height: 26),
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: constants.fontsize16,
                                fontFamily: constants.w400,
                                // color: const Color.fromRGBO(34, 34, 34, 0.7),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: constants.fontsize16,
                                fontFamily: constants.w300,
                              ),
                              // controller: searchWord,
                              onSubmitted: (value) {},
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(244, 244, 244, 1),
                                hintText: "Enter your phone number",
                                hintStyle: TextStyle(
                                  color: const Color.fromRGBO(34, 34, 34, 0.5),
                                  fontSize: constants.fontsize16,
                                  fontFamily: constants.w300,
                                ),
                                border: InputBorder.none,
                                constraints: const BoxConstraints(
                                    maxWidth: 400, maxHeight: 40),
                              ),
                            ),
                            const SizedBox(height: 26),
                            Text(
                              "Email",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: constants.fontsize16,
                                fontFamily: constants.w400,
                                // color: const Color.fromRGBO(34, 34, 34, 0.7),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: constants.fontsize16,
                                fontFamily: constants.w300,
                              ),
                              // controller: searchWord,
                              onSubmitted: (value) {},
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(244, 244, 244, 1),
                                hintText: "Enter your email address",
                                hintStyle: TextStyle(
                                  color: const Color.fromRGBO(34, 34, 34, 0.5),
                                  fontSize: constants.fontsize16,
                                  fontFamily: constants.w300,
                                ),
                                border: InputBorder.none,
                                constraints: const BoxConstraints(
                                    maxWidth: 400, maxHeight: 50),
                              ),
                            ),
                            const SizedBox(height: 26),
                            Text(
                              "What session type are you interested in?",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: constants.fontsize16,
                                fontFamily: constants.w400,
                                // color: const Color.fromRGBO(34, 34, 34, 0.7),
                              ),
                            ),
                            DropdownButtonFormField(
                              isExpanded: true,
                              items: ['Speaking', 'Training']
                                  .map((String interest) {
                                return DropdownMenuItem(
                                  value: interest,
                                  child: Text(
                                    interest,
                                    style: const TextStyle(
                                        // fontFamily: constants.w300,
                                        // fontSize: 20,
                                        ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() => selectedSessionType = newValue!);
                              },
                              value: selectedSessionType,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(244, 244, 244, 1),
                                hintText:
                                    "What session type are you interested in?",
                                hintStyle: TextStyle(
                                  color: const Color.fromRGBO(34, 34, 34, 0.5),
                                  fontSize: 15,
                                  fontFamily: constants.w300,
                                ),
                                border: InputBorder.none,
                                constraints: const BoxConstraints(
                                    maxWidth: 400, maxHeight: 50),
                              ),
                            ),
                            // Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: <Widget>[
                            //     Row(
                            //       mainAxisSize: MainAxisSize.min,
                            //       children: [
                            //         Radio(
                            //           value: 0,
                            //           groupValue: radioValue,
                            //           onChanged: _handleRadioValueChanged,
                            //           activeColor: constants.yellow,
                            //         ),
                            //         const SizedBox(width: 10),
                            //         MouseRegion(
                            //           cursor: SystemMouseCursors.click,
                            //           child: GestureDetector(
                            //             onTap: () {
                            //               setState(() {
                            //                 radioValue = 0;
                            //               });
                            //             },
                            //             child: Text(
                            //               "Speaking",
                            //               style: TextStyle(
                            //                 height: 1.5,
                            //                 fontSize: constants.fontsize14,
                            //                 fontFamily: constants.w300,
                            //                 color: const Color.fromRGBO(
                            //                     34, 34, 34, 0.7),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     const SizedBox(width: 20),
                            //     Row(
                            //       mainAxisSize: MainAxisSize.min,
                            //       children: [
                            //         Radio(
                            //           value: 1,
                            //           groupValue: radioValue,
                            //           onChanged: _handleRadioValueChanged,
                            //           // onChanged: (val){
                            //           //   setS
                            //           // },
                            //           activeColor: constants.yellow,
                            //         ),
                            //         const SizedBox(width: 10),
                            //         MouseRegion(
                            //           cursor: SystemMouseCursors.click,
                            //           child: GestureDetector(
                            //             onTap: () {
                            //               setState(() {
                            //                 radioValue = 1;
                            //               });
                            //             },
                            //             child: Text(
                            //               "Training",
                            //               style: TextStyle(
                            //                 height: 1.5,
                            //                 fontSize: constants.fontsize14,
                            //                 fontFamily: constants.w300,
                            //                 color: const Color.fromRGBO(
                            //                     34, 34, 34, 0.7),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ],
                            // ),

                            const SizedBox(height: 25),
                            Text(
                              "What topic are you interested in?",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: constants.fontsize16,
                                fontFamily: constants.w400,
                                // color: const Color.fromRGBO(34, 34, 34, 0.7),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: constants.w300,
                              ),
                              // controller: searchWord,
                              onSubmitted: (value) {},
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(244, 244, 244, 1),
                                hintText: "Enter your topic of interest here",
                                hintStyle: TextStyle(
                                  color: const Color.fromRGBO(34, 34, 34, 0.5),
                                  fontSize: 15,
                                  fontFamily: constants.w300,
                                ),
                                border: InputBorder.none,
                                constraints: const BoxConstraints(
                                    maxWidth: 400, maxHeight: 40),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Text(
                              "What are your expectations at the end of the Session?",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: constants.fontsize16,
                                fontFamily: constants.w400,
                                // color: const Color.fromRGBO(34, 34, 34, 0.7),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: constants.w300,
                              ),
                              // controller: searchWord,
                              onSubmitted: (value) {},
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(244, 244, 244, 1),
                                hintText: "Enter your message here",
                                hintStyle: TextStyle(
                                  color: const Color.fromRGBO(34, 34, 34, 0.5),
                                  fontSize: 15,
                                  fontFamily: constants.w300,
                                ),
                                border: InputBorder.none,
                                constraints: const BoxConstraints(
                                    maxWidth: 400, maxHeight: 40),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Text(
                              "When is the best time to reach you via call?",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: constants.fontsize16,
                                fontFamily: constants.w400,
                                // color: const Color.fromRGBO(34, 34, 34, 0.7),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: constants.w300,
                              ),
                              // controller: searchWord,
                              onSubmitted: (value) {},
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(244, 244, 244, 1),
                                hintText: "Type your message here",
                                hintStyle: TextStyle(
                                  color: const Color.fromRGBO(34, 34, 34, 0.5),
                                  fontSize: 15,
                                  fontFamily: constants.w300,
                                ),
                                border: InputBorder.none,
                                constraints: const BoxConstraints(
                                    maxWidth: 400, maxHeight: 40),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Text(
                              "Duration of Training / Speaking Session",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: constants.fontsize16,
                                fontFamily: constants.w400,
                                // color: const Color.fromRGBO(34, 34, 34, 0.7),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: constants.w300,
                              ),
                              // controller: searchWord,
                              onSubmitted: (value) {},
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(244, 244, 244, 1),
                                hintText:
                                    "Eg: 30 minutes, 1 hour, 2 weeks, 3 months ",
                                hintStyle: TextStyle(
                                  color: const Color.fromRGBO(34, 34, 34, 0.5),
                                  fontSize: 15,
                                  fontFamily: constants.w300,
                                ),
                                border: InputBorder.none,
                                constraints: const BoxConstraints(
                                    maxWidth: 400, maxHeight: 40),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildRatingWidgets(int ratingNo,
      {double size = 15.0, Color color = Colors.amber}) {
    // List.generate(3, (index){
    //   return Icon(Icons.star, color: color, size: size);
    // });

    if (ratingNo == 0) {
      return Row(
        children: [
          buildMyStar(false, color, size),
          buildMyStar(false, color, size),
          buildMyStar(false, color, size),
          buildMyStar(false, color, size),
          buildMyStar(false, color, size),
        ],
      );
    } else if (ratingNo == 1) {
      return Row(
        children: [
          buildMyStar(true, color, size),
          buildMyStar(false, color, size),
          buildMyStar(false, color, size),
          buildMyStar(false, color, size),
          buildMyStar(false, color, size),
        ],
      );
    } else if (ratingNo == 2) {
      return Row(
        children: [
          buildMyStar(true, color, size),
          buildMyStar(true, color, size),
          buildMyStar(false, color, size),
          buildMyStar(false, color, size),
          buildMyStar(false, color, size),
        ],
      );
    } else if (ratingNo == 3) {
      return Row(
        children: [
          buildMyStar(true, color, size),
          buildMyStar(true, color, size),
          buildMyStar(true, color, size),
          buildMyStar(false, color, size),
          buildMyStar(false, color, size),
        ],
      );
    } else if (ratingNo == 4) {
      return Row(
        children: [
          buildMyStar(true, color, size),
          buildMyStar(true, color, size),
          buildMyStar(true, color, size),
          buildMyStar(true, color, size),
          buildMyStar(false, color, size),
        ],
      );
    } else if (ratingNo == 5) {
      return Row(
        children: [
          buildMyStar(true, color, size),
          buildMyStar(true, color, size),
          buildMyStar(true, color, size),
          buildMyStar(true, color, size),
          buildMyStar(true, color, size),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget buildMyStar(bool status, Color color, double size) {
    return Stack(alignment: Alignment.center, children: [
      // Icon(Icons.star_border_outlined, size: 15, color: Colors.black),
      Padding(
        padding: const EdgeInsets.all(1.0),
        child: Icon(status == true ? Icons.star : Icons.star_border_outlined,
            size: size, color: status == true ? color : Colors.black54),
      ),
    ]);
  }
}

class MobileWidgets {
  void showSocialMediaPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.purple,
        title: const Text("Let's Connect",
        style: TextStyle(
                            // fontSize: constants.fontsize16,
                            // fontFamily: constants.w600,
                            color: Colors.white,
                          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            ListTile(
              leading: Image.asset('assets/images/facebook.png', width: 22),
              title: const Text('Facebook', style: TextStyle(
                            color: Colors.white,
                          ),),
              onTap: () {
                html.window.open(facebookHandle, 'new tab');
              
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/linkedin.png', width: 22),
              title: const Text('LinkedIn', style: TextStyle(
                            color: Colors.white,
                          ),),
              onTap: () {
                html.window.open(linkedinHandle, 'new tab');
            
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/tiktok.png', width: 22),
              title: const Text('TikTok', style: TextStyle(
                            color: Colors.white,
                          ),),
              onTap: () {
                html.window.open(tiktokHandle, 'new tab');
            
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/instagram.png', width: 22),
              title: const Text('Instagram', style: TextStyle(
                            color: Colors.white,
                          ),),
              onTap: () {
                html.window.open(instagramHandle, 'new tab');
                
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(
                            color: Colors.white,
                          ),),
          ),
        ],
      );
    },
  );
}
  Widget title({
    required double width,
    required String tab,
    bool show_divider = false,
  }) {
    bool menuTapped = false;
    // bool searchTapped = false;
    // bool searching = false;
    bool servicesTapped = false;
    return StatefulBuilder(
      builder: ((context, setState) {
        return Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: width,
                  height: 40,
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(30, 6, 30, 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(route.homePage);
                        },
                        child: Image.asset(
                          "assets/images/icon.png",
                          height: 50,
                          // width: 33,
                        ),
                      ),
                      // Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     searchTapped
                      //         ? Stack(
                      //             children: [
                      //               searching
                      //                   ? Container(
                      //                       color:
                      //                           const Color.fromRGBO(41, 44, 47, 1),
                      //                       height: 200,
                      //                       width: 160,
                      //                       padding: const EdgeInsets.fromLTRB(
                      //                           15, 30, 15, 0),
                      //                     )
                      //                   : const SizedBox(),
                      //               Container(
                      //                 height: 30,
                      //                 color: const Color.fromRGBO(239, 239, 239, 1),
                      //                 padding:
                      //                     const EdgeInsets.symmetric(horizontal: 5),
                      //                 child: Row(
                      //                   children: [
                      //                     TextField(
                      //                       textAlignVertical:
                      //                           TextAlignVertical.bottom,
                      //                       // controller: searchWord,
                      //                       style: TextStyle(
                      //                         color: Colors.black,
                      //                         fontSize: 11,
                      //                         fontFamily: constants.w400,
                      //                       ),
                      //                       onSubmitted: (value) {},
                      //                       decoration: InputDecoration(
                      //                         filled: true,
                      //                         fillColor: const Color.fromRGBO(
                      //                             239, 239, 239, 1),
                      //                         hintText: "Search",
                      //                         hintStyle: TextStyle(
                      //                           color: const Color.fromRGBO(
                      //                               34, 34, 34, 0.8),
                      //                           fontSize: 10,
                      //                           fontFamily: constants.w300,
                      //                         ),
                      //                         border: InputBorder.none,
                      //                         constraints: const BoxConstraints(
                      //                             maxWidth: 100),
                      //                       ),
                      //                     ),
                      //                     GestureDetector(
                      //                       onTap: () {},
                      //                       child: Image.asset(
                      //                           "assets/images/search.png",
                      //                           height: 20,
                      //                           width: 20),
                      //                     ),
                      //                     const SizedBox(width: 5),
                      //                     GestureDetector(
                      //                       onTap: () {
                      //                         setState(() {
                      //                           searchTapped = false;
                      //                           searching = false;
                      //                         });
                      //                       },
                      //                       child: const Icon(
                      //                         Icons.cancel_outlined,
                      //                         color: Colors.black,
                      //                         size: 18,
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //             ],
                      //           )
                      //         : GestureDetector(
                      //             onTap: () {
                      //               setState(() {
                      //                 searchTapped = true;
                      //               });
                      //             },
                      //             child: Image.asset("assets/images/search.png",
                      //                 height: 20, width: 20),
                      //           ),
                      //   ],
                      // ),

                      GestureDetector(
                        onTap: () {
                          // _scaffoldKey.currentState!
                          //     .openEndDrawer();
                          setState(() {
                            menuTapped = !menuTapped;
                            // searching = false;
                          });
                        },
                        child: Icon(
                          !menuTapped ? Icons.menu : Icons.close,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                !menuTapped
                    ?
                    // ? Container(
                    //     width: width,
                    //     height: 40,
                    //     color: const Color.fromRGBO(245, 245, 242, 1),
                    //     padding: const EdgeInsets.fromLTRB(30, 6, 30, 6),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //       children: [
                    //         GestureDetector(
                    //           onTap: () {
                    //             // _scaffoldKey.currentState!
                    //             //     .openEndDrawer();
                    //             setState(() {
                    //               menuTapped = true;
                    //               searching = false;
                    //             });
                    //           },
                    //           child: const Icon(
                    //             Icons.menu,
                    //             color: Colors.black,
                    //           ),
                    //         ),
                    //       ],
                    //     ))
                    const SizedBox()
                    : Container(
                        width: width,
                        color: Colors.white,
                        padding: const EdgeInsets.fromLTRB(0, 6, 0, 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width,
                              color: Colors.white,
                              // padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Align(
                                  //   alignment: Alignment.centerRight,
                                  //   child: GestureDetector(
                                  //     onTap: () {
                                  //       // _scaffoldKey.currentState!
                                  //       //     .openEndDrawer();
                                  //       setState(() {
                                  //         menuTapped = false;
                                  //         // searching = false;
                                  //       });
                                  //     },
                                  //     child: const Icon(
                                  //       Icons.close,
                                  //       color: Colors.white,
                                  //     ),
                                  //   ),
                                  // ),
                                  Container(
                                    width: width,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  const SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(route.homePage);
                                    },
                                    child: Text(
                                      "Home",
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize: 14,
                                        fontFamily: tab == "home"
                                            ? constants.w600
                                            : constants.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    width: width,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  const SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        servicesTapped = !servicesTapped;
                                      });
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Services",
                                          style: TextStyle(
                                            height: 1.5,
                                            fontSize: 14,
                                            fontFamily: tab == "services" ||
                                                    tab == "training" ||
                                                    tab == "coaching" ||
                                                    tab == "consultation"
                                                ? constants.w600
                                                : constants.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        // const SizedBox(width: 6),
                                        const Icon(
                                          // Icons.keyboard_arrow_down,
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                          size: 30,
                                          // color: tab == "services" ||
                                          //         tab == "training" ||
                                          //         tab == "coaching" ||
                                          //         tab == "consultation"
                                          //     ? Colors.black
                                          //     : const Color.fromRGBO(
                                          //         255, 255, 255, 0.6),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    width: width,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                ],
                              ),
                            ),
                            servicesTapped
                                ? Container(
                                    width: width,
                                    color:
                                        const Color.fromRGBO(250, 234, 196, 1),
                                    // color: Colors.white,
                                    // padding:
                                    //     const EdgeInsets.symmetric(horizontal: 30),
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 15),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushNamed(route.trainingPage);
                                          },
                                          child: Text(
                                            "Training/Speaking",
                                            style: TextStyle(
                                              height: 1.5,
                                              fontSize: 14,
                                              fontFamily: tab == "training"
                                                  ? constants.w600
                                                  : constants.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        Container(
                                          width: width,
                                          color: Colors.black,
                                          height: 1,
                                        ),
                                        const SizedBox(height: 15),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushNamed(route.coachingPage);
                                          },
                                          child: Text(
                                            "Coaching/Mentoring",
                                            style: TextStyle(
                                              height: 1.5,
                                              fontSize: 14,
                                              fontFamily: tab == "coaching"
                                                  ? constants.w600
                                                  : constants.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        Container(
                                          width: width,
                                          color: Colors.black,
                                          height: 1,
                                        ),
                                        const SizedBox(height: 15),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                route.consultingPage);
                                          },
                                          child: Text(
                                            "Consultation",
                                            style: TextStyle(
                                              height: 1.5,
                                              fontSize: 14,
                                              fontFamily: tab == "consultation"
                                                  ? constants.w600
                                                  : constants.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        Container(
                                          width: width,
                                          color: Colors.black,
                                          height: 1,
                                        ),
                                        // const SizedBox(height: 15),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            Container(
                              width: width,
                              color: Colors.white,
                              // padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 15),
                                  GestureDetector(
                                    // onTap: () {
                                    //   Navigator.of(context)
                                    //       .pushNamed(route.coursesPage);
                                    // },
                                    onTap: () {
                          html.window.open('https://academy.solaokunkpolor.com/welcome', 'new tab');
                        },
                                    child: Text(
                                      "Academy",
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize: 14,
                                        fontFamily: tab == "academy"
                                            ? constants.w600
                                            : constants.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    width: width,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  const SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(route.eventsPage);
                                    },
                                    child: Text(
                                      "Event",
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize: 14,
                                        fontFamily: tab == "events"
                                            ? constants.w600
                                            : constants.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    width: width,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  const SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(route.shopPage);
                                    },
                                    child: Text(
                                      "Shop",
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize: 14,
                                        fontFamily: tab == "shop"
                                            ? constants.w600
                                            : constants.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    width: width,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  const SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(route.blogPage);
                                    },
                                    child: Text(
                                      "Blog",
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize: 14,
                                        fontFamily: tab == "blog"
                                            ? constants.w600
                                            : constants.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    width: width,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  const SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(route.galleryPage);
                                    },
                                    child: Text(
                                      "Gallery",
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize: 14,
                                        fontFamily: tab == "gallery"
                                            ? constants.w600
                                            : constants.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    width: width,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  const SizedBox(height: 15),
GestureDetector(
  onTap: () {
    // Ensure this function is defined or replace with a suitable alternative
    showSocialMediaPopup(context); 
  },
  child: Text(
    "Connect with us",
    style: TextStyle(
      height: 1.5,
      fontSize: 14,
      fontFamily: constants.w400, // No hover effect, using regular weight
      color: Colors.black,
    ),
  ),
),
const SizedBox(height: 15),
Container(
  width: width,
  color: Colors.black,
  height: 1,
),

                                  const SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () {
                                      if (getX.read(v.LOGGED_IN) == null) {
                                        Navigator.of(context)
                                            .pushNamed(route.loginPage);
                                      } else {
                                        Navigator.of(context).pushNamed(
                                            route.userAccountControl);
                                      }
                                    },
                                    child: Text(
                                      getX.read(v.LOGGED_IN) == null
                                          ? "Login | Sign up"
                                          : "${getX.read(v.FULLNAME).split(' ')[0]}",
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize: 14,
                                        fontFamily: tab == "auth"
                                            ? constants.w600
                                            : constants.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    width: width,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
            show_divider
                ? Container(
                    height: 1,
                    width: width,
                    color: Colors.black12,
                  )
                : const SizedBox()
          ],
        );
      }),
    );
  }

  // Widget popularCourses(context, {required double width}) {
  //   return Container(
  //     color: Colors.white,
  //     padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 90),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Text(
  //           "POPULAR COURSES",
  //           style: TextStyle(
  //             fontSize: constants.fontsize18,
  //             fontFamily: constants.w700,
  //             color: Colors.black,
  //           ),
  //         ),
  //         Container(
  //           height: 5,
  //           // color: const Color.fromRGBO(182, 5, 5, 1),
  //           color: const Color.fromRGBO(255, 153, 0, 1),

  //           width: 150,
  //         ),
  //         const SizedBox(height: 12),
  //         Text(
  //           "Timeless resources for your life, career and business",
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             fontSize: constants.fontsize18,
  //             fontFamily: constants.w300,
  //             color: Colors.black,
  //           ),
  //         ),
  //         const SizedBox(height: 40),
  //         buildCourses(context),
  //       ],
  //     ),
  //   );
  // }

  // buildCourses(BuildContext context) {
  //   return Wrap(
  //     spacing: 15,
  //     runSpacing: 15,
  //     children: [
  //       Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(color: Colors.grey[300]!),
  //         ),
  //         width: 320,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Image.asset('assets/images/course1.webp'),
  //             const SizedBox(height: 5),
  //             Padding(
  //               padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(
  //                         'BSSA',
  //                         style: TextStyle(
  //                           fontSize: constants.fontsize20,
  //                           fontFamily: constants.w700,
  //                           color: const Color.fromRGBO(255, 153, 0, 1),
  //                         ),
  //                       ),
  //                       Text(
  //                         'Paid',
  //                         style: TextStyle(
  //                           fontSize: constants.fontsize16,
  //                           fontFamily: constants.w700,
  //                           color: constants.lightPurple,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 5),
  //                   Text(
  //                     'Business Startup & Setup  Academy',
  //                     style: TextStyle(
  //                       fontSize: constants.fontsize24,
  //                       fontFamily: constants.w700,
  //                       height: 1.1,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 20),
  //                   SizedBox(
  //                     width: 200,
  //                     child: MaterialButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pushNamed(route.coursesPage);
  //                       },
  //                       color: const Color.fromRGBO(255, 153, 0, 1),
  //                       hoverColor: const Color.fromRGBO(38, 10, 56, 1),
  //                       height: 53,
  //                       child: Center(
  //                         child: Text(
  //                           "BEGIN COURSE",
  //                           style: TextStyle(
  //                             fontSize: constants.fontsize18,
  //                             fontFamily: constants.w700,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),

  //       Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(color: Colors.grey),
  //         ),
  //         width: 320,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Image.asset('assets/images/course2.webp'),
  //             const SizedBox(height: 5),
  //             Padding(
  //               padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(
  //                         'B4B',
  //                         style: TextStyle(
  //                           fontSize: constants.fontsize20,
  //                           fontFamily: constants.w700,
  //                           color: const Color.fromRGBO(255, 153, 0, 1),
  //                         ),
  //                       ),
  //                       Text(
  //                         'Paid',
  //                         style: TextStyle(
  //                           fontSize: constants.fontsize16,
  //                           fontFamily: constants.w700,
  //                           color: constants.lightPurple,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 5),
  //                   Text(
  //                     'The Business that works for the business owner',
  //                     style: TextStyle(
  //                       fontSize: constants.fontsize24,
  //                       fontFamily: constants.w700,
  //                       height: 1.1,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 20),
  //                   SizedBox(
  //                     width: 200,
  //                     child: MaterialButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pushNamed(route.coursesPage);
  //                       },
  //                       color: const Color.fromRGBO(255, 153, 0, 1),
  //                       hoverColor: const Color.fromRGBO(38, 10, 56, 1),
  //                       height: 53,
  //                       child: Center(
  //                         child: Text(
  //                           "BEGIN COURSE",
  //                           style: TextStyle(
  //                             fontSize: constants.fontsize18,
  //                             fontFamily: constants.w700,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),

  //       Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(color: Colors.grey),
  //         ),
  //         width: 320,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Image.asset('assets/images/course3.webp'),
  //             const SizedBox(height: 5),
  //             Padding(
  //               padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(
  //                         'P4P',
  //                         style: TextStyle(
  //                           fontSize: constants.fontsize20,
  //                           fontFamily: constants.w700,
  //                           color: const Color.fromRGBO(255, 153, 0, 1),
  //                         ),
  //                       ),
  //                       Text(
  //                         'Paid',
  //                         style: TextStyle(
  //                           fontSize: constants.fontsize16,
  //                           fontFamily: constants.w700,
  //                           color: constants.lightPurple,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 5),
  //                   Text(
  //                     'Profiting from your profession',
  //                     style: TextStyle(
  //                       fontSize: constants.fontsize24,
  //                       fontFamily: constants.w700,
  //                       height: 1.1,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 20),
  //                   SizedBox(
  //                     width: 200,
  //                     child: MaterialButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pushNamed(route.coursesPage);
  //                       },
  //                       color: const Color.fromRGBO(255, 153, 0, 1),
  //                       hoverColor: const Color.fromRGBO(38, 10, 56, 1),
  //                       height: 53,
  //                       child: Center(
  //                         child: Text(
  //                           "BEGIN COURSE",
  //                           style: TextStyle(
  //                             fontSize: constants.fontsize18,
  //                             fontFamily: constants.w700,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),

  //       Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(color: Colors.grey),
  //         ),
  //         width: 320,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Image.asset('assets/images/course4.webp'),
  //             const SizedBox(height: 5),
  //             Padding(
  //               padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(
  //                         'MHP',
  //                         style: TextStyle(
  //                           fontSize: constants.fontsize20,
  //                           fontFamily: constants.w700,
  //                           color: const Color.fromRGBO(255, 153, 0, 1),
  //                         ),
  //                       ),
  //                       Text(
  //                         'Paid',
  //                         style: TextStyle(
  //                           fontSize: constants.fontsize16,
  //                           fontFamily: constants.w700,
  //                           color: constants.lightPurple,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 5),
  //                   Text(
  //                     'Money from Head to Pocket',
  //                     style: TextStyle(
  //                       fontSize: constants.fontsize24,
  //                       fontFamily: constants.w700,
  //                       height: 1.1,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 20),
  //                   SizedBox(
  //                     width: 200,
  //                     child: MaterialButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pushNamed(route.coursesPage);
  //                       },
  //                       color: const Color.fromRGBO(255, 153, 0, 1),
  //                       hoverColor: const Color.fromRGBO(38, 10, 56, 1),
  //                       height: 53,
  //                       child: Center(
  //                         child: Text(
  //                           "BEGIN COURSE",
  //                           style: TextStyle(
  //                             fontSize: constants.fontsize18,
  //                             fontFamily: constants.w700,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),

  //       // SizedBox(
  //       //   width: 300,
  //       //   child: Column(
  //       //     mainAxisSize: MainAxisSize.min,
  //       //     crossAxisAlignment: CrossAxisAlignment.start,
  //       //     children: [
  //       //       Image.asset('assets/images/course2.png'),
  //       //       const SizedBox(height: 5),
  //       //       SizedBox(
  //       //         width: 140,
  //       //         child: MaterialButton(
  //       //           onPressed: () {
  //       //             Navigator.of(context).pushNamed(route.coursesPage);
  //       //           },
  //       //           color: const Color.fromRGBO(255, 153, 0, 1),
  //       //           hoverColor: const Color.fromRGBO(38, 10, 56, 1),
  //       //           height: 53,
  //       //           child: Center(
  //       //             child: Text(
  //       //               "LEARN MORE",
  //       //               style: TextStyle(
  //       //                 fontSize: constants.fontsize18,
  //       //                 fontFamily: constants.w500,
  //       //                 color: Colors.white,
  //       //               ),
  //       //             ),
  //       //           ),
  //       //         ),
  //       //       ),
  //       //     ],
  //       //   ),
  //       // ),
  //       // SizedBox(
  //       //   width: 300,
  //       //   child: Column(
  //       //     mainAxisSize: MainAxisSize.min,
  //       //     crossAxisAlignment: CrossAxisAlignment.start,
  //       //     children: [
  //       //       Image.asset('assets/images/course3.png'),
  //       //       const SizedBox(height: 5),
  //       //       SizedBox(
  //       //         width: 140,
  //       //         child: MaterialButton(
  //       //           onPressed: () {
  //       //             Navigator.of(context).pushNamed(route.coursesPage);
  //       //           },
  //       //           color: const Color.fromRGBO(255, 153, 0, 1),
  //       //           hoverColor: const Color.fromRGBO(38, 10, 56, 1),
  //       //           height: 53,
  //       //           child: Center(
  //       //             child: Text(
  //       //               "LEARN MORE",
  //       //               style: TextStyle(
  //       //                 fontSize: constants.fontsize18,
  //       //                 fontFamily: constants.w500,
  //       //                 color: Colors.white,
  //       //               ),
  //       //             ),
  //       //           ),
  //       //         ),
  //       //       ),
  //       //     ],
  //       //   ),
  //       // ),
  //     ],
  //   );
  // }

  // Widget popularCourses({required double width}) {
  //   return Container(
  //     color: Colors.white,
  //     padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Text(
  //           "POPULAR COURSES",
  //           style: TextStyle(
  //             fontSize: constants.fontsize18,
  //             fontFamily: constants.w700,
  //             color: Colors.black,
  //           ),
  //         ),
  //         Container(
  //           height: 1.5,
  //           color: const Color.fromRGBO(182, 5, 5, 1),
  //           width: 69,
  //         ),
  //         const SizedBox(height: 12),
  //         Text(
  //           "Timeless resources for your life, career and business",
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             fontSize: constants.fontsize14,
  //             fontFamily: constants.w300,
  //             color: Colors.black,
  //           ),
  //         ),
  //         const SizedBox(height: 30),

  //         Wrap(
  //           spacing: 50,
  //           runSpacing: 30,
  //           children: [
  //             SizedBox(
  //               width: 300,
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Image.asset('assets/images/course1.webp'),
  //                   const SizedBox(height: 5),
  //                   SizedBox(
  //                     width: 140,
  //                     child: MaterialButton(
  //                       onPressed: () {},
  //                       color: const Color.fromRGBO(255, 153, 0, 1),
  //                       hoverColor: const Color.fromRGBO(38, 10, 56, 1),
  //                       height: 53,
  //                       child: Center(
  //                         child: Text(
  //                           "LEARN MORE",
  //                           style: TextStyle(
  //                             fontSize: constants.fontsize18,
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
  //             SizedBox(
  //               width: 300,
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Image.asset('assets/images/course2.webp'),
  //                   const SizedBox(height: 5),
  //                   SizedBox(
  //                     width: 140,
  //                     child: MaterialButton(
  //                       onPressed: () {},
  //                       color: const Color.fromRGBO(255, 153, 0, 1),
  //                       hoverColor: const Color.fromRGBO(38, 10, 56, 1),
  //                       height: 53,
  //                       child: Center(
  //                         child: Text(
  //                           "LEARN MORE",
  //                           style: TextStyle(
  //                             fontSize: constants.fontsize18,
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
  //             SizedBox(
  //               width: 300,
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Image.asset('assets/images/course3.webp'),
  //                   const SizedBox(height: 5),
  //                   SizedBox(
  //                     width: 140,
  //                     child: MaterialButton(
  //                       onPressed: () {},
  //                       color: const Color.fromRGBO(255, 153, 0, 1),
  //                       hoverColor: const Color.fromRGBO(38, 10, 56, 1),
  //                       height: 53,
  //                       child: Center(
  //                         child: Text(
  //                           "LEARN MORE",
  //                           style: TextStyle(
  //                             fontSize: constants.fontsize18,
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
  //           ],
  //         )

  //       ],
  //     ),
  //   );
  // }

  Widget buildPost(
      {required String image,
      required String title,
      required String body,
      required String comments,
      required String time}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      // width: 211,
      child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              // height: 240,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Career and Business",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w400,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    color: Colors.black,
                    height: 1,
                    width: 60,
                    margin: const EdgeInsets.only(left: 5),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    body,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize22,
                      fontFamily: constants.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "$comments Comments, $time days ago",
                    style: TextStyle(
                      fontSize: constants.fontsize18,
                      fontFamily: constants.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  Widget buildRecentPost(double width, [Color color = Colors.white]) {
    return Container(
      // color: const Color.fromRGBO(240, 240, 240, 1),
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "RECENT POSTS",
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
            color: constants.yellow, // const Color.fromRGBO(255, 153, 0, 1),

            width: 90,
          ),
          const SizedBox(height: 12),
          Text(
            "Timeless articles for your life, career and business",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: constants.fontsize18,
              fontFamily: constants.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: [
              buildPost(
                image: 'assets/images/blog1.webp',
                title: 'CULTIVATING AN EXCEPTIONAL LEADER',
                body:
                    'The Leadership of any organization is crucial to the sucess....read more',
                comments: '14',
                time: '2',
              ),
              buildPost(
                image: 'assets/images/blog2.png',
                title: 'CULTIVATING AN EXCEPTIONAL LEADER',
                body:
                    'The Leadership of any organization is crucial to the sucess....read more',
                comments: '14',
                time: '2',
              ),
              buildPost(
                image: 'assets/images/blog3.webp',
                title: 'CULTIVATING AN EXCEPTIONAL LEADER',
                comments: '14',
                body:
                    'The Leadership of any organization is crucial to the sucess....read more',
                time: '2',
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // Widget buildPost({
  //   required String image,
  //   required String title,
  //   required String body,
  //   required String comments,
  //   required String time,
  // }) {
  //   return Container(
  //     width: 500,
  //     height: 200,
  //     decoration: BoxDecoration(
  //       border: Border.all(
  //         color: Colors.grey,
  //       ),
  //     ),
  //     child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Image.asset(image),
  //           const SizedBox(width: 10),
  //           Expanded(
  //             child: Padding(
  //               padding: const EdgeInsets.fromLTRB(0, 20, 10, 10),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     title,
  //                     style: TextStyle(
  //                       fontSize: constants.fontsize18,
  //                       fontFamily: constants.w700,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 10),
  //                   Text(
  //                     body,
  //                     style: TextStyle(
  //                       fontSize: constants.fontsize16,
  //                       fontFamily: constants.w400,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 10),
  //                   Text(
  //                     "$comments Comments, $time days ago",
  //                     style: TextStyle(
  //                       fontSize: constants.fontsize16,
  //                       fontFamily: constants.w300,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ]),
  //   );
  // }

  Container buildOurClients(Size screen) {
    return Container(
      color: const Color.fromRGBO(221, 221, 221, 1),
      width: screen.width,
      padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Our Clients",
            style: TextStyle(
              color: Colors.black,
              fontFamily: constants.styleScript,
              fontSize: constants.fontsize32,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/org_firstbank.png",
                    height: 60,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/org_ala.png",
                    height: 80,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/org_ecobank.png",
                    height: 50,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/social_channels.png",
                    height: 50,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/org_ebs.png",
                    height: 50,
                  ),
                ],
              ),
              // const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/org_itv.png",
                    height: 60,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/org_globus.png",
                    height: 30,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/org_gt.png",
                    height: 50,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/org_ku.png",
                    height: 40,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/org_seplat.png",
                    height: 70,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget testimonials({required double width, required dynamic res}) {
  //   // CarouselSliderController reviewController = CarouselSliderController();
  //   return Container(
  //     color: Colors.white,
  //     width: width,
  //     padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
  //     child: Column(
  //       children: [
  //         Text(
  //           "TESTIMONIALS",
  //           style: TextStyle(
  //             fontSize: constants.fontsize18,
  //             fontFamily: constants.w700,
  //             color: Colors.black,
  //           ),
  //         ),
  //         Container(
  //           height: 5,
  //           // color: const Color.fromRGBO(182, 5, 5, 1),
  //           color: const Color.fromRGBO(255, 153, 0, 1),

  //           width: 150,
  //         ),
  //         const SizedBox(height: 19),
  //         Text(
  //           "We are in the business of making dreams work",
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             fontSize: 15,
  //             fontFamily: constants.w400,
  //             color: const Color.fromRGBO(34, 34, 34, 0.6),
  //           ),
  //         ),
  //         const SizedBox(height: 32),
  //         SizedBox(
  //           width: width,
  //           height: 700,
  //           child: CarouselSlider.builder(
  //             itemCount: 3, // db.gallery["gallery"].length,
  //             unlimitedMode: true,
  //             // scrollPhysics: const ,
  //             // slideTransform: StackTransform(),
  //             slideTransform: const ParallaxTransform(),
  //             // slideTransform: const ZoomOutSlideTransform(),

  //             enableAutoSlider: true,
  //             autoSliderDelay: const Duration(seconds: 7),
  //             autoSliderTransitionTime: const Duration(milliseconds: 1200),
  //             slideBuilder: (int index) {
  //               return Image.asset(
  //                   './assets/images/testmonial${index + 1}.png');
  //               // return Padding(
  //               //     padding: const EdgeInsets.only(left: 30),
  //               //     child: Image.asset(db.gallery["gallery"][index]));
  //             },
  //           ),
  //         ),
  //         // const SizedBox(
  //         //   height: 30,
  //         // ),
  //         // buildDots(c_index),

  //         // SizedBox(
  //         //   width: width,
  //         //   height: 550,
  //         //   child: CarouselSlider.builder(
  //         //     itemCount: res.length,
  //         //     // itemCount: 6,
  //         //     unlimitedMode: true,
  //         //     controller: reviewController,
  //         //     // scrollPhysics: const ,
  //         //     // slideTransform: StackTransform(),
  //         //     slideTransform: const ParallaxTransform(),
  //         //     // slideTransform: const ZoomOutSlideTransform(),

  //         //     enableAutoSlider: true,
  //         //     autoSliderDelay: const Duration(seconds: 7),
  //         //     autoSliderTransitionTime: const Duration(milliseconds: 1200),
  //         //     slideBuilder: (int index) {
  //         //       return Card(
  //         //         elevation: 20,
  //         //         surfaceTintColor: Colors.white,
  //         //         color: Colors.white,
  //         //         child: Padding(
  //         //           padding: const EdgeInsets.symmetric(
  //         //               horizontal: 30, vertical: 25),
  //         //           child: Column(
  //         //             children: [
  //         //               Text(
  //         //                 res[index]['body'],
  //         //                 style: TextStyle(
  //         //                   height: 1.5,
  //         //                   fontSize: constants.fontsize16,
  //         //                   fontFamily: constants.w300,
  //         //                   color: const Color.fromRGBO(34, 34, 34, 0.75),
  //         //                 ),
  //         //               ),
  //         //               // const SizedBox(height: 10),
  //         //               const Spacer(),
  //         //               ClipRRect(
  //         //                 borderRadius: BorderRadius.circular(360),
  //         //                 child: Container(
  //         //                   height: 90,
  //         //                   width: 90,
  //         //                   color: Colors.white,
  //         //                   child: Image.asset(
  //         //                     res[index]['image'],
  //         //                     width: double.maxFinite,
  //         //                   ),
  //         //                 ),
  //         //               ),
  //         //               const SizedBox(height: 20),
  //         //               Text(
  //         //                 res[index]['name'],
  //         //                 style: TextStyle(
  //         //                   fontSize: constants.fontsize16,
  //         //                   fontFamily: constants.w400,
  //         //                   color: const Color.fromRGBO(34, 34, 34, 1),
  //         //                 ),
  //         //               ),
  //         //               const SizedBox(height: 10),
  //         //               Text(
  //         //                 res[index]['title'],
  //         //                 style: TextStyle(
  //         //                   fontSize: constants.fontsize12,
  //         //                   fontFamily: constants.w300,
  //         //                   color: const Color.fromRGBO(34, 34, 34, 0.6),
  //         //                 ),
  //         //               ),
  //         //             ],
  //         //           ),
  //         //         ),
  //         //       );
  //         //     },
  //         //   ),
  //         // ),
  //       ],
  //     ),
  //   );
  // }

  // int c_index = 0;
  // Widget buildDots(int currentIndex) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: List.generate(
  //       3,
  //       (index) => Container(
  //         height: 8,
  //         width: index == currentIndex ? 22 : 8,
  //         margin: EdgeInsets.only(left: index != 0 ? 15 : 0),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(20),
  //           color: index == currentIndex
  //               ? constants.lightPurple
  //               : Colors.grey[300],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget mailingList({required double width}) {
    bool isLoading = false;
    TextEditingController emailController = TextEditingController();

    return StatefulBuilder(builder: (context, setCustomState) {
      return Container(
        color: const Color.fromRGBO(255, 153, 0, 1),
        width: width,
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 40),
        child: Column(
          children: [
            Text(
              "MAKING DREAMS WORK",
              style: TextStyle(
                height: 1.5,
                fontSize: constants.fontsize16,
                fontFamily: constants.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Ready to take the leap and make your dreams work? Join my emailing list for a mindset recalibration and switch",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontSize: constants.fontsize14,
                fontFamily: constants.w300,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: emailController,

              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: constants.w300,
              ),
              // controller: searchWord,
              // onSubmitted: (value) {},
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter your email address",
                hintStyle: TextStyle(
                  color: const Color.fromRGBO(34, 34, 34, 0.8),
                  fontSize: constants.fontsize14,
                  fontFamily: constants.w300,
                ),
                border: InputBorder.none,
                // constraints: const BoxConstraints(maxWidth: 400, maxHeight: 40),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 140,
              child: MaterialButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        if (emailController.text.isEmpty) {
                          helperWidgets.showToast('Enter email');
                          return;
                        }

                        try {
                          setCustomState(() {
                            isLoading = true;
                          });
                          var res =
                              await subscribeNewsletter(emailController.text);
                          debugPrint(res.toString());
                          if (res['msg'] == 'success') {
                            helperWidgets.showToast("Subscription successful");
                            emailController.clear();
                            setCustomState(() {});
                          } else {
                            helperWidgets.showToast(
                                "Something went wrong, please try again");
                          }
                        } catch (e) {
                          myHttpErrorHandler(e);
                        } finally {
                          setCustomState(() {
                            isLoading = false;
                          });
                        }
                      },
                color: const Color.fromRGBO(38, 10, 56, 1),
                hoverColor: const Color.fromRGBO(79, 20, 116, 1),
                height: 53,
                child: Center(
                  child: isLoading
                      ? const SizedBox(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.black))
                      : Text(
                          "Subscribe",
                          style: TextStyle(
                            fontSize: constants.fontsize18,
                            fontFamily: constants.w400,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  // Widget gallery({required double width}) {
  //   return Container(
  //     color: Colors.white,
  //     padding: const EdgeInsets.symmetric(vertical: 40),
  //     width: width,
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Text(
  //           "GALLERY",
  //           style: TextStyle(
  //             fontSize: 18,
  //             fontFamily: constants.w700,
  //             color: Colors.black,
  //           ),
  //         ),
  //         Container(
  //           height: 5,
  //           // color: const Color.fromRGBO(182, 5, 5, 1),
  //           color: const Color.fromRGBO(255, 153, 0, 1),

  //           width: 150,
  //         ),
  //         const SizedBox(height: 12),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 30),
  //           // padding: const EdgeInsets.all(8.0),
  //           child: Text(
  //             "A peak into highlights of the transformative process of making dreams work",
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //               fontSize: constants.fontsize16,
  //               fontFamily: constants.w300,
  //               color: Colors.black,
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 40),
  //         SizedBox(
  //           width: width,
  //           height: 360,
  //           child: CarouselSlider.builder(
  //             itemCount: db.gallery["gallery"].length,
  //             unlimitedMode: true,
  //             // scrollPhysics: const ,
  //             // slideTransform: StackTransform(),
  //             slideTransform: const ParallaxTransform(),
  //             // slideTransform: const ZoomOutSlideTransform(),

  //             enableAutoSlider: true,
  //             autoSliderDelay: const Duration(seconds: 7),
  //             autoSliderTransitionTime: const Duration(milliseconds: 1200),
  //             slideBuilder: (int index) {
  //               return Padding(
  //                   padding: const EdgeInsets.only(left: 30),
  //                   child: Image.asset(db.gallery["gallery"][index]));
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget form(String title) {
    // int radioValue = 0;
    String selectedSessionType = 'Training';
    return StatefulBuilder(builder: (context, setState) {
      // void _handleRadioValueChanged(int? value) {
      //   if (value != null) setState(() => radioValue = value);
      // }

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        color: Colors.white,
        child: Column(
          children: [
            Text(
              "$title REQUEST FORM",
              style: TextStyle(
                fontSize: 18,
                fontFamily: constants.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 3,
              color: constants
                  .yellow, // color: const Color.fromRGBO(182, 5, 5, 1),
              width: 126,
            ),
            const SizedBox(height: 12),
            Text(
              "Please fill out the Booking Request Form below to schedule your session. Upon submission, my team will promptly review your request and respond to you with the cost of the proposed session, along with our Terms and Conditions of engagement.\n\nPlease note that if you have any urgent inquiries, you can utilize our chat module to speak with one of our Customer Care Representatives who will be happy to assist you.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: constants.fontsize16,
                fontFamily: constants.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 10,
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Container(
                    //   // height: ,
                    //   width: 100,
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: AssetImage(
                    //               "assets/images/about2m.png"),
                    //           fit: BoxFit.cover)),
                    // ),
                    Image.asset(
                      "assets/images/form2.png",
                      width: double.maxFinite,
                    ),
                    const SizedBox(height: 60),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 2),
                        Text(
                          "Full Name",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: Colors.black,
                            // color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: constants.w300,
                          ),
                          // controller: searchWord,
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText: "Enter your full name",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: 15,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "Email",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: Colors.black,
                            // color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: constants.w300,
                          ),
                          // controller: searchWord,
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText: "Enter your email address",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: 15,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "Phone Number",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: Colors.black,
                            // color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: constants.w300,
                          ),
                          // controller: searchWord,
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText: "Enter your phone number",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: 15,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "What session type are you interested in?",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: Colors.black,
                            // color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        DropdownButtonFormField(
                          isExpanded: true,
                          items:
                              ['Speaking', 'Training'].map((String interest) {
                            return DropdownMenuItem(
                              value: interest,
                              child: Text(
                                interest,
                                style: const TextStyle(
                                    // fontFamily: constants.w300,
                                    // fontSize: 20,
                                    ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() => selectedSessionType = newValue!);
                          },
                          value: selectedSessionType,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText:
                                "What session type are you interested in?",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: 15,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "What topic are you interested in?",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: Colors.black,
                            // color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: constants.w300,
                          ),
                          // controller: searchWord,
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText: "Enter your topic of interest here",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: 15,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "What are your expectations at the end of the Session?",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: Colors.black,
                            // color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: constants.w300,
                          ),
                          // controller: searchWord,
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText: "Enter your message here",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: 15,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "When is the best time to reach you via call?",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: Colors.black,
                            // color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: constants.w300,
                          ),
                          // controller: searchWord,
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText: "Type your message here",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: 15,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "Duration of Training / Speaking Session",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: Colors.black,
                            // color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: constants.w300,
                          ),
                          // controller: searchWord,
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText:
                                "Eg: 30 minutes, 1 hour, 2 weeks, 3 months ",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: 15,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 35),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            color: constants.purple,
                            child: Text(
                              "SUBMIT $title REQUEST FORM",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: constants.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildEvent(
      {required String image,
      required String title,
      required String venue,
      required String duration}) {
    return Card(
      elevation: 5,
      child: Container(
        width: 250,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              duration,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: constants.fontsize10,
                fontFamily: constants.w400,
                // fontStyle: FontStyle.italic,
                color: const Color.fromRGBO(34, 34, 34, 1),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: constants.fontsize14,
                fontFamily: constants.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Venue: ',
                style: TextStyle(
                  height: 1.5,
                  fontSize: constants.fontsize10,
                  fontFamily: constants.w600,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: venue,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: constants.fontsize10,
                      fontFamily: constants.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 130,
              child: MaterialButton(
                onPressed: () {},
                color: constants.lightPurple,
                hoverColor: constants.purple,
                height: 35,
                child: Center(
                  child: Text(
                    "Register for Event",
                    style: TextStyle(
                      fontSize: constants.fontsize12,
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
    );
  }

  Widget buildPastEvent(double width) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      // height: 400,
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/gal1.png", fit: BoxFit.cover),
              const SizedBox(width: 30),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "January 15th",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w400,
                      color: const Color.fromRGBO(238, 144, 3, 1),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "School Readiness",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize24,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Venue: Whatsapp",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize18,
                      fontFamily: constants.w400,
                      color: constants.purple,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Text(
                  //   "When: 15th August, 2023\nWhere: Benin city, Edo State",
                  //   // textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     fontSize: constants.fontsize16,
                  //     fontFamily: constants.w400,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  // const SizedBox(height: 20),
                  Text(
                    "Some of the key components of school readiness include exposure to language and literacy, opportunities for socialization and play, and a supportive home environment. By focusing on these areas and working with children to develop the skills they need to succeed in school, parents and educators can help ensure that children.....",
                    // textAlign: TextAlign.center,
                    // softWrap: false,
                    maxLines: 7,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "N 2,000",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize26,
                      fontFamily: constants.w700,
                      color: constants.purple,
                    ),
                  ),

                  const SizedBox(height: 15),
                  // const Spacer(),

                  ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context)
                      //     .pushNamed(route.trainingPage);
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 12.0),
                      child: Text(
                        "GET PDF SUMMARY",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontFamily: constants.w700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: width,
            height: 1,
            color: const Color.fromRGBO(0, 0, 0, 0.3),
          )
        ],
      ),
    );
  }

  // Widget buildPastEvent(double width, dynamic resp) {
  //   // return Container(
  //   //   color: Colors.transparent,
  //   //   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
  //   //   // height: 400,
  //   //   width: width,
  //   //   child: Column(
  //   //     mainAxisSize: MainAxisSize.min,
  //   //     children: [
  //   //       SizedBox(
  //   //         height: 400,
  //   //         child: Row(
  //   //           mainAxisSize: MainAxisSize.min,
  //   //           // crossAxisAlignment: CrossAxisAlignment.start,
  //   //           children: [
  //   //             Expanded(
  //   //               flex: 2,
  //   //               child:
  //   //                   Image.asset("assets/images/gal1.png", fit: BoxFit.cover),
  //   //             ),
  //   //             SizedBox(width: 30),
  //   //             Expanded(
  //   //               flex: 3,
  //   //               child: Column(
  //   //                 mainAxisSize: MainAxisSize.min,
  //   //                 crossAxisAlignment: CrossAxisAlignment.start,
  //   //                 children: [
  //   //                   SizedBox(height: 20),
  //   //                   Text(
  //   //                     "Event",
  //   //                     // textAlign: TextAlign.center,
  //   //                     style: TextStyle(
  //   //                       fontSize: constants.fontsize18,
  //   //                       fontFamily: constants.w400,
  //   //                       color: constants.purple,
  //   //                     ),
  //   //                   ),
  //   //                   SizedBox(height: 10),
  //   //                   Text(
  //   //                     "School Readiness",
  //   //                     // textAlign: TextAlign.center,
  //   //                     style: TextStyle(
  //   //                       fontSize: constants.fontsize24,
  //   //                       fontFamily: constants.w700,
  //   //                       color: Colors.black,
  //   //                     ),
  //   //                   ),
  //   //                   SizedBox(height: 20),
  //   //                   Text(
  //   //                     "When: 15th August, 2023\nWhere: Benin city, Edo State",
  //   //                     // textAlign: TextAlign.center,
  //   //                     style: TextStyle(
  //   //                       fontSize: constants.fontsize16,
  //   //                       fontFamily: constants.w400,
  //   //                       color: Colors.black,
  //   //                     ),
  //   //                   ),
  //   //                   SizedBox(height: 20),
  //   //                   Text(
  //   //                     "Some of the key components of school readiness include exposure to language and literacy, opportunities for socialization and play, and a supportive home environment. By focusing on these areas and working with children to develop the skills they need to succeed in school, parents and educators can help ensure that children.....",
  //   //                     // textAlign: TextAlign.center,
  //   //                     // softWrap: false,
  //   //                     maxLines: 7,
  //   //                     // overflow: TextOverflow.ellipsis,
  //   //                     style: TextStyle(
  //   //                       fontSize: constants.fontsize20,
  //   //                       fontFamily: constants.w300,
  //   //                       color: Colors.black,
  //   //                     ),
  //   //                   ),
  //   //                   SizedBox(height: 10),
  //   //                 ],
  //   //               ),
  //   //             ),
  //   //           ],
  //   //         ),
  //   //       ),
  //   //       SizedBox(height: 10),
  //   //       Container(
  //   //         width: width,
  //   //         height: 1,
  //   //         color: Color.fromRGBO(0, 0, 0, 0.3),
  //   //       )
  //   //     ],
  //   //   ),
  //   // );
  //   return SizedBox(
  //     // height: 370,
  //     // width: 300,
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Stack(
  //           children: [
  //             Container(
  //               width: double.maxFinite,
  //               height: 300,
  //               decoration: BoxDecoration(
  //                 image: DecorationImage(
  //                   image: CachedNetworkImageProvider(resp["image"]),
  //                   fit: BoxFit.cover,
  //                 ),
  //                 // borderRadius: const BorderRadius.only(
  //                 //   topLeft: Radius.circular(20),
  //                 //   topRight: Radius.circular(20),
  //                 // ),
  //               ),
  //             ),
  //             Container(
  //               margin: const EdgeInsets.only(left: 30),
  //               height: 90,
  //               width: 80,
  //               decoration: const BoxDecoration(
  //                 color: Color.fromRGBO(244, 244, 244, 1),
  //                 borderRadius: BorderRadius.only(
  //                   bottomLeft: Radius.circular(8),
  //                   bottomRight: Radius.circular(8),
  //                 ),
  //               ),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: [
  //                   Text(
  //                     resp["month"],
  //                     style: TextStyle(
  //                       fontSize: constants.fontsize12,
  //                       fontFamily: constants.w400,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                   Text(
  //                     resp["day"],
  //                     style: TextStyle(
  //                       fontSize: constants.fontsize12,
  //                       fontFamily: constants.w400,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                   Text(
  //                     resp["year"],
  //                     style: TextStyle(
  //                       fontSize: constants.fontsize12,
  //                       fontFamily: constants.w400,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(0, 20, 10, 20),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 "Event: ${resp["venue"]}",
  //                 style: TextStyle(
  //                   fontSize: constants.fontsize14,
  //                   fontFamily: constants.w500,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //               const SizedBox(height: 10),
  //               Text(
  //                 resp["title"],
  //                 maxLines: 2,
  //                 style: TextStyle(
  //                   overflow: TextOverflow.ellipsis,
  //                   height: 1.5,
  //                   fontSize: constants.fontsize16,
  //                   fontFamily: constants.w700,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //               const SizedBox(height: 15),
  //               Text(
  //                 resp["content"],
  //                 maxLines: 3,
  //                 style: TextStyle(
  //                   overflow: TextOverflow.ellipsis,
  //                   height: 1.5,
  //                   fontSize: constants.fontsize14,
  //                   fontFamily: constants.w400,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //               const SizedBox(height: 20),
  //               // MouseRegion(
  //               //   cursor: SystemMouseCursors.click,
  //               //   onEnter: ((event) {
  //               //     setState(() {
  //               //       numb = index;
  //               //     });
  //               //   }),
  //               //   onExit: ((event) {
  //               //     setState(() {
  //               //       numb = -1;
  //               //     });
  //               //   }),
  //               //   child: GestureDetector(
  //               //     onTap: () {
  //               //       Navigator.of(context).push(
  //               //         MaterialPageRoute(
  //               //           builder: (context) => SiteLayout(
  //               //             screen: 4,
  //               //             res: res,
  //               //           ),
  //               //         ),
  //               //       );
  //               //     },
  //               //     child: Text(
  //               //       "Learn More >>",
  //               //       style: TextStyle(
  //               //         height: 1.5,
  //               //         fontSize: constants.fontsize16,
  //               //         fontFamily: constants.w400,
  //               //         color: numb == index
  //               //             ? const Color.fromRGBO(23, 132, 116, 1)
  //               //             : const Color.fromRGBO(34, 34, 34, 0.51),
  //               //       ),
  //               //     ),
  //               //   ),
  //               // ),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           width: double.maxFinite,
  //           height: 1,
  //           color: const Color.fromRGBO(0, 0, 0, 0.3),
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     ),
  //   );
  // }
}
