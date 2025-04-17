// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:auto_size_text/auto_size_text.dart';
import 'package:sola_web/main.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

import '../utils/global.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return build_footer(width, context);
  }
}

// List<String> ourApps = ["Heurekka", "NaijaPharms", "sola_web"];

//It checks if the current screen is a tablet or a desktop
Widget build_footer(double width, BuildContext ctx) {
  if (width < 850) {
    return tabletFooter(ctx, width);
  } else {
    return desktopFooter(ctx, width);
  }
}

void launchURL(url) async {
  if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
}

//footer for desktop screens
Widget desktopFooter(BuildContext ctx, double width) {
  bool shopHovered = false;
  bool coachingHovered = false;
  bool speakingHovered = false;
  bool consultingHovered = false;

  bool instagramHovered = false;
  bool facebookHovered = false;
  bool linkedinHovered = false;
  bool tiktokHovered = false;
  bool aboutHovered = false;

  return StatefulBuilder(builder: (context, setState) {
    return Container(
      width: width,
      color: const Color.fromRGBO(38, 10, 56, 1),
      child: Column(
        children: [
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width / 2.8,
                  // flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 150),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ABOUT DR. SOLA",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Dr. Sola Okunkpolor (Fpmc) is a highly sought-after international speaker, author, and coach in areas of life, business, and education. She has worked with several organizations to improve business processes, attain quantum growth, and increase profit. Furthermore, she is known for coaching individuals and business owners to gain clarity, witness exponential development in their businesses, find happiness, and ultimately live a fulfilling life.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize14,
                            fontFamily: constants.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50),
                    // padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "RESOURCES",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              aboutHovered = true;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              aboutHovered = false;
                            });
                          },
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(ctx).pushNamed(route.aboutPage);
                            },
                            child: Text(
                              "ABOUT",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: constants.fontsize14,
                                fontFamily: aboutHovered
                                    ? constants.w600
                                    : constants.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
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
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(ctx).pushNamed(route.coachingPage);
                            },
                            child: Text(
                              "COACHING",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: constants.fontsize14,
                                fontFamily: coachingHovered
                                    ? constants.w600
                                    : constants.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              speakingHovered = true;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              speakingHovered = false;
                            });
                          },
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(ctx).pushNamed(route.trainingPage);
                            },
                            child: Text(
                              "SPEAKING",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: constants.fontsize14,
                                fontFamily: speakingHovered
                                    ? constants.w600
                                    : constants.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              consultingHovered = true;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              consultingHovered = false;
                            });
                          },
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(ctx).pushNamed(route.consultingPage);
                            },
                            child: Text(
                              "CONSULTING",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: constants.fontsize14,
                                fontFamily: consultingHovered
                                    ? constants.w600
                                    : constants.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
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
                              Navigator.of(ctx).pushNamed(route.shopPage);
                            },
                            child: Text(
                              "SHOP",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: constants.fontsize14,
                                fontFamily: shopHovered
                                    ? constants.w600
                                    : constants.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50),
                    // padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LET'S CONNECT",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              instagramHovered = true;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              instagramHovered = false;
                            });
                          },
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              html.window.open(instagramHandle, 'new tab');
                              // //Navigator.of(ctx).pushNamed(route.homePage);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/images/instagram.png',
                                    width: 22),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "INSTAGRAM",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: constants.fontsize14,
                                      fontFamily: instagramHovered
                                          ? constants.w600
                                          : constants.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              facebookHovered = true;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              facebookHovered = false;
                            });
                          },
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              html.window.open(facebookHandle, 'new tab');

                              // //Navigator.of(ctx).pushNamed(route.homePage);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/images/facebook.png',
                                    width: 22),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "FACEBOOK",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: constants.fontsize14,
                                      fontFamily: facebookHovered
                                          ? constants.w600
                                          : constants.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              linkedinHovered = true;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              linkedinHovered = false;
                            });
                          },
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              html.window.open(linkedinHandle, 'new tab');

                              // //Navigator.of(ctx).pushNamed(route.homePage);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/images/linkedin.png',
                                    width: 22),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "LINKEDIN",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: constants.fontsize14,
                                      fontFamily: linkedinHovered
                                          ? constants.w600
                                          : constants.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              tiktokHovered = true;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              tiktokHovered = false;
                            });
                          },
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              html.window.open(tiktokHandle, 'new tab');

                              // //Navigator.of(ctx).pushNamed(route.homePage);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/images/tiktok.png',
                                    width: 22),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "TIKTOK",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: constants.fontsize14,
                                      fontFamily: tiktokHovered
                                          ? constants.w600
                                          : constants.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    // padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CONTACT US",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/phone.png",
                              height: 10,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                "+234 000 0000 000",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: constants.fontsize14,
                                  fontFamily: constants.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/email.png",
                              height: 10,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                "solaokunkpolor@gmail.com",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: constants.fontsize14,
                                  fontFamily: constants.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/address.png",
                              height: 11,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                "Our Lady Of Hope Montessori Schools,(Emerald Centre) 131A&B 2ND East Circularby wisdom street junction, Benin City. Nigeria.",
                                // softWrap: true,
                                maxLines: 7,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: constants.fontsize14,
                                  fontFamily: constants.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          Container(
            color: Colors.white,
            width: width,
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "COPYRIGHT ${DateTime.now().year} © SOLA OKUNKPOLOR. ALL RIGHTS RESERVED",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: constants.fontsize14,
                fontFamily: constants.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  });
}

//footer for tablet screens
Widget tabletFooter(BuildContext ctx, double width) {
  return StatefulBuilder(builder: (context, setState) {
    return Container(
      width: width,
      color: const Color.fromRGBO(38, 10, 56, 1),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 1,
            width: width - 80,
            color: Colors.white,
          ),
          const SizedBox(height: 30),
          Text(
            "ABOUT DR. SOLA",
            style: TextStyle(
              fontSize: 14,
              fontFamily: constants.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Dr. Sola Okunkpolor (Fpmc) is a highly sought-after international speaker, author, and coach in areas of life, business, and education. She has worked with several organizations to improve business processes, attain quantum growth, and increase profit. Furthermore, she is known for coaching individuals and business owners to gain clarity, witness exponential development in their businesses, find happiness, and ultimately live a fulfilling life.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: constants.fontsize14,
                fontFamily: constants.w300,
                color: const Color.fromRGBO(245, 245, 242, 0.8),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "RESOURCES",
            style: TextStyle(
              fontSize: 14,
              fontFamily: constants.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              alignment: WrapAlignment.center,
              // runAlignment: WrapAlignment.center,
              // crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 50,
              runSpacing: 10,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(ctx).pushNamed(route.aboutPage);
                  },
                  child: Text(
                    "ABOUT",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: constants.w300,
                      color: const Color.fromRGBO(245, 245, 242, 0.8),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(ctx).pushNamed(route.shopPage);
                  },
                  child: Text(
                    "SHOP",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: constants.w300,
                      color: const Color.fromRGBO(245, 245, 242, 0.8),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(ctx).pushNamed(route.trainingPage);
                  },
                  child: Text(
                    "SPEAKING",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: constants.w300,
                      color: const Color.fromRGBO(245, 245, 242, 0.8),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(ctx).pushNamed(route.coachingPage);
                  },
                  child: Text(
                    "COACHING",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: constants.w300,
                      color: const Color.fromRGBO(245, 245, 242, 0.8),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(ctx).pushNamed(route.consultingPage);
                  },
                  child: Text(
                    "CONSULTING",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: constants.w300,
                      color: const Color.fromRGBO(245, 245, 242, 0.8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "LET'S CONNECT",
            style: TextStyle(
              fontSize: 14,
              fontFamily: constants.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 50,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    html.window.open(instagramHandle, 'new tab');

                    //Navigator.of(ctx).pushNamed(route.homePage);
                  },
                  child: Text(
                    "INSTAGRAM",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: constants.w300,
                      color: const Color.fromRGBO(245, 245, 242, 0.8),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     // //Navigator.of(ctx).pushNamed(route.homePage);
                //   },
                //   child: Text(
                //     "Solutions",
                //     textAlign: TextAlign.start,
                //     style: TextStyle(
                //       fontSize: 13,
                //       fontFamily: constants.w300,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    html.window.open(facebookHandle, 'new tab');

                    //Navigator.of(ctx).pushNamed(route.newsEventsPage);
                  },
                  child: Text(
                    "FACEBOOK",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: constants.w300,
                      color: const Color.fromRGBO(245, 245, 242, 0.8),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    html.window.open(linkedinHandle, 'new tab');

                    //Navigator.of(ctx).pushNamed(route.researchPage);
                  },
                  child: Text(
                    "LINKEDIN",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: constants.w300,
                      color: const Color.fromRGBO(245, 245, 242, 0.8),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    html.window.open(tiktokHandle, 'new tab');

                    //Navigator.of(ctx).pushNamed(route.aboutUsPage);
                  },
                  child: Text(
                    "TIKTOK",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: constants.w300,
                      color: const Color.fromRGBO(245, 245, 242, 0.8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 10),
          // GestureDetector(
          //   onTap: () {
          //     //Navigator.of(ctx).pushNamed(route.aboutUsPage);
          //   },
          //   child: Text(
          //     "About Us",
          //     textAlign: TextAlign.start,
          //     style: TextStyle(
          //       fontSize: 13,
          //       fontFamily: constants.w300,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          const SizedBox(height: 40),
          Text(
            "CONTACT US",
            style: TextStyle(
              fontSize: 14,
              fontFamily: constants.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/phone.png",
                height: 10,
              ),
              const SizedBox(width: 5),
              Text(
                "+234 000 0000 000",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: constants.w300,
                  color: const Color.fromRGBO(245, 245, 242, 0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/email.png",
                height: 10,
              ),
              const SizedBox(width: 5),
              Text(
                "Solaokunkpolor@gmail.com",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: constants.w300,
                  color: const Color.fromRGBO(245, 245, 242, 0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/address.png",
                height: 11,
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: 220,
                child: Text(
                  "Our Lady Of Hope Montessori Schools,(Emerald Centre) 131A&B 2ND East Circularby wisdom street junction, Benin City. Nigeria.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: constants.w300,
                    color: const Color.fromRGBO(245, 245, 242, 0.8),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            height: 1,
            width: width - 80,
            color: Colors.white,
          ),
          // const SizedBox(height: 14),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         //Navigator.of(ctx).pushNamed(route.privacy);
          //       },
          //       child: Text(
          //         "Privacy Statement",
          //         textAlign: TextAlign.start,
          //         style: TextStyle(
          //           fontSize: 13,
          //           fontFamily: constants.w300,
          //           color: const Color.fromRGBO(245, 245, 242, 0.8),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(width: 12),
          //     Text(
          //       "|",
          //       textAlign: TextAlign.start,
          //       style: TextStyle(
          //         fontSize: 14,
          //         fontFamily: constants.w300,
          //         color: const Color.fromRGBO(245, 245, 242, 0.8),
          //       ),
          //     ),
          //     const SizedBox(width: 15),
          //     GestureDetector(
          //       onTap: () {
          //         //Navigator.of(ctx).pushNamed(route.admin_login);
          //       },
          //       child: Text(
          //         "Terms of Use",
          //         textAlign: TextAlign.start,
          //         style: TextStyle(
          //           fontSize: 13,
          //           fontFamily: constants.w300,
          //           color: const Color.fromRGBO(245, 245, 242, 0.8),
          //         ),
          //       ),
          //     ),
          //     // SizedBox(width: 12),
          //     // Text(
          //     //   "|",
          //     //   textAlign: TextAlign.start,
          //     //   style: TextStyle(
          //     //     fontSize: 14,
          //     //     fontFamily: constants.w300,
          //     //     color: Colors.white,
          //     //   ),
          //     // ),
          //     // SizedBox(width: 15),
          //     // GestureDetector(
          //     //   onTap: () {
          //     //     // //Navigator.of(ctx).pushNamed(route.homePage);
          //     //   },
          //     //   child: Text(
          //     //     "Contact",
          //     //     textAlign: TextAlign.start,
          //     //     style: TextStyle(
          //     //       fontSize: 13,
          //     //       fontFamily: constants.w300,
          //     //       color: Colors.white,
          //     //     ),
          //     //   ),
          //     // ),
          //   ],
          // ),
          // const SizedBox(height: 18),
          // Container(
          //   height: 1,
          //   width: width - 80,
          //   color: Colors.white,
          // ),
          // const SizedBox(height: 15),
          // Image.asset(
          //   'assets/images/icon.png',
          //   height: 46,
          // ),
          // const SizedBox(height: 15),
          // Container(
          //   height: 0.5,
          //   width: width,
          //   color: Colors.white,
          // ),
          // const SizedBox(height: 12),
          // Text(
          //   "Last Updated April 2023",
          //   style: TextStyle(
          //     fontSize: 12,
          //     fontFamily: constants.w300,
          //     color: Color.fromRGBO(245, 245, 242, 0.8),
          //   ),
          // ),
          const SizedBox(height: 15),
          Text(
            "COPYRIGHT ${DateTime.now().year} © SOLA OKUNKPOLOR. ALL RIGHTS RESERVED",
            style: TextStyle(
              fontSize: 12,
              fontFamily: constants.w300,
              color: const Color.fromRGBO(245, 245, 242, 0.8),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  });
}
