import 'package:flutter/material.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/utils/functions.dart';

import '../../utils/my_widgets.dart/course_widgets.dart';
import '../../utils/my_widgets.dart/gallery_widgets.dart';
import '../../utils/my_widgets.dart/testimonial_widgets.dart';

class DesktopConsultingPage extends StatefulWidget {
  const DesktopConsultingPage({super.key});

  @override
  State<DesktopConsultingPage> createState() => _DesktopConsultingPageState();
}

class _DesktopConsultingPageState extends State<DesktopConsultingPage> {
  DesktopWidgets myWidgets = DesktopWidgets();
  int _radioValue = 0;
  @override
  Widget build(BuildContext context) {
    var scr = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    void _handleRadioValueChanged(int? value) {
      if (value != null) setState(() => _radioValue = value);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            myWidgets.title(width: width, tab: "consulting"),
            Container(
              width: scr.width,
              height: scr.height - 100,

              // padding: EdgeInsets.fromLTRB(90, 0, width / 2, 0),
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  // opacity: 0.5,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/consulting.webp"),
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
                                    Navigator.of(context)
                                        .pushNamed(route.trainingPage);
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
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "CONSULTING THAT MAKES DREAMS WORK",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 5,
                    // color: Color.fromRGBO(182, 5, 5, 1),
                    color: const Color.fromRGBO(238, 144, 3, 1),
                    width: 400,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Welcome to a world of limitless possibilities with Dr. Sola’s transformative consultation services. Whether you're seeking to break through mental blocks, reach new levels of success, or discover your true purpose, Dr. Sola provides the expert guidance and support you need to unlock your full potential. \n\nHer unique blend of coaching and consulting expertise provides a holistic approach to personal and professional development, empowering you to transform your life from the inside out. With a focus on building deep connections and fostering a growth mindset, her consultation services provide a safe and supportive space to explore your innermost desires and develop a roadmap for success. \n\nExperience the power of transformational coaching and consulting - book Dr. Sola today to start your journey towards living the life of your dreams.",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w300,
                      color: Colors.black,
                    ),
                  ),
                  // const SizedBox(height: 50),
                  // SizedBox(
                  //   width: 200,
                  //   child: MaterialButton(
                  //     onPressed: () {
                  //       Navigator.of(context).pushNamed(route.bookConsultation);
                  //     },
                  //     color: const Color.fromRGBO(38, 10, 56, 1),
                  //     hoverColor: constants.yellow,
                  //     height: 53,
                  //     child: Center(
                  //       child: Text(
                  //         "BOOK DR. SOLA",
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
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Image.asset("assets/images/gal3.png"),
                        const SizedBox(height: 50),
                        SizedBox(
                          width: 200,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(route.bookConsultation);
                            },
                            color: const Color.fromRGBO(38, 10, 56, 1),
                            hoverColor: constants.yellow,
                            height: 53,
                            child: Center(
                              child: Text(
                                "BOOK DR. SOLA",
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
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: const Color.fromRGBO(245, 239, 249, 1),
                      padding: const EdgeInsets.fromLTRB(50, 60, 80, 70),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Sola, The Consulting Guru",
                            style: TextStyle(
                              fontSize: constants.fontsize32,
                              fontFamily: constants.w700,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Expert in organizational strategy, performance improvement, and growth",
                            style: TextStyle(
                              fontSize: constants.fontsize20,
                              fontFamily: constants.w300,
                              color: constants.lightPurple,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Meet Sola, an expert in decluttering the systems and structures of organizations to uncover the very essence responsible for strategic growth, performance improvement, and profit increase. Through her extensive experience, Sola has developed a unique approach to organizational problem-solving, which involves a strategic diagnosis to determine the exact problem and its extent within the organization.\nOnce the problem has been identified, Sola works closely with her clients to develop a customized solution mechanism that addresses the challenge head-on and moves the organization closer to its goals. Whether you're facing issues with workflow, communication, or performance, Sola's expertise and guidance can help you streamline your processes and achieve greater success.\nWith Sola's support, you can expect to see tangible results and improvements in your organization's overall performance. Say goodbye to inefficiencies and roadblocks, and hello to strategic growth and increased profitability. Book a consultation with Sola today and take the first step towards organizational success!",
                            style: TextStyle(
                              fontSize: constants.fontsize20,
                              fontFamily: constants.w300,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                        "assets/images/consulting_option1.png",
                        height: 600,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        "assets/images/consulting_option2.png",
                        height: 600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            myWidgets.form(title: "CONSULTING"),
            PopularCourses(),
            TestimonialsWidget(),
                        Gallery(),

            // myWidgets.gallery(context, width: width),
            myWidgets.mailingList(width: width),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
