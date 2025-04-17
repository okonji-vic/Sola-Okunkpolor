import 'package:flutter/material.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/utils/functions.dart';

import '../../utils/my_widgets.dart/course_widgets.dart';
import '../../utils/my_widgets.dart/gallery_widgets.dart';
import '../../utils/my_widgets.dart/testimonial_widgets.dart';

class MobileTrainingPage extends StatefulWidget {
  const MobileTrainingPage({super.key});

  @override
  State<MobileTrainingPage> createState() => _MobileTrainingPageState();
}

class _MobileTrainingPageState extends State<MobileTrainingPage> {
  MobileWidgets myWidgets = MobileWidgets();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            myWidgets.title(width: width, tab: 'training'),
            Container(
              width: width,
              height: 320,
              padding: EdgeInsets.fromLTRB(90, 0, width / 2, 0),
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/trainingHeader3.webp"),
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
                    "Training, Facilitation and Speaking Engagements",
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
                    // color: const Color.fromRGBO(182, 5, 5, 1),
                    width: 69,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Looking to take your event or in-house training to the next level? Look no further than Dr. Sola as your trainer, speaker, or facilitator. With her captivating and thought-provoking speaking style, Dr. Sola has a unique ability to captivate her audience and hold their attention from start to finish. \n\nWhether you are looking to educate your team on complex concepts or inspire them to reach new heights, Dr. Sola's skillful communication and natural talent for connecting with people on a personal level make her the perfect choice for your event. Her presentations are clear, concise, and engaging, ensuring that every attendee walks away with valuable insights and actionable takeaways. \n\nWith Dr. Sola as your trainer, speaker, or facilitator, you can be sure that your event or in-house training will be a success. So why wait? Book Dr. Sola today and take the first step towards a truly memorable and impactful event.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w300,
                      color: Colors.black,
                    ),
                  ),
                  // const SizedBox(height: 30),
                  // SizedBox(
                  //   width: 140,
                  //   child: MaterialButton(
                  //     onPressed: () {},
                  //     color: const Color.fromRGBO(38, 10, 56, 1),
                  //     hoverColor: constants.yellow,
                  //     height: 53,
                  //     child: Center(
                  //       child: Text(
                  //         "BOOK DR. SOLA",
                  //         style: TextStyle(
                  //           fontSize: constants.fontsize16,
                  //           fontFamily: constants.w400,
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/training1.png"),
                  const SizedBox(height: 20),
                  Container(
                    color: const Color.fromRGBO(245, 239, 249, 1),
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Text(
                        //   "",
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     fontSize: constants.fontsize16,
                        //     fontFamily: constants.w600,
                        //     color: Colors.black,
                        //   ),
                        // ),
                        // const SizedBox(height: 10),
                        // Container(
                        //   height: 3,
                        //   color: constants.yellow,
                        //   // color: const Color.fromRGBO(182, 5, 5, 1),
                        //   width: 69,
                        // ),
                        // const SizedBox(height: 12),
                        Text(
                          "As a highly sought-after speaker, I understand the power of words to inspire, transform minds, and create new beginnings. I am deeply passionate about helping people make their dreams a reality, and my expertise in this area has made me the go-to speaker for conferences, corporations, colleges, churches, and other platforms.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: constants.fontsize14,
                            fontFamily: constants.w300,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "\n\nI'm Dr. Sola Okunkpolor and I believe that a good learning curve is essential for growth.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: constants.lightPurple,
                          ),
                        ),
                        Text(
                          "\n\nMy approach is focused on empowering my audience to take action towards realizing their dreams and career objectives. I believe that true inspiration is not just about making people feel good, but about motivating them to make meaningful changes in their lives. By sharing my own experiences and insights, I aim to help people overcome obstacles, tap into their potential, and achieve their goals. \n\nWhether I am speaking to a large audience or working with a small group, my goal is always the same: to help people unlock their full potential and live their best lives. If you are looking for a performer-oriented speaker who can inspire your audience to action, look no further. Contact me today and let's start making your event a success!",
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
            Container(
              color: const Color.fromRGBO(255, 153, 0, 1),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Upon my initial encounter with Dr. Sola's oratory skills, I was struck with awe. Her delivery was so impactful that it seemed as though a radiant light had illuminated my mind. The manner in which she spoke, exhibiting both astuteness and passion, coupled with simplicity, made complex subject matters easily comprehensible.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w400,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      " -  Uyi Isiekwe",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: constants.fontsize14,
                        fontFamily: constants.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            myWidgets.form('SESSION'),
            // myWidgets.popularCourses(context, width: width),
            PopularCourses(isSmallScreen:true),
            TestimonialsWidget(),

            // myWidgets.testimonials(width: width, res: db.reviewList["reviews"]),
            // myWidgets.gallery(width: width),
                        Gallery(),

            myWidgets.mailingList(width: width),
            const Footer()
          ],
        ),
      ),
    );
  }
}
