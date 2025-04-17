import 'package:flutter/material.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/utils/functions.dart';

import '../../utils/my_widgets.dart/course_widgets.dart';
import '../../utils/my_widgets.dart/testimonial_widgets.dart';

class MobileAboutPage extends StatefulWidget {
  const MobileAboutPage({super.key});

  @override
  State<MobileAboutPage> createState() => _MobileAboutPageState();
}

class _MobileAboutPageState extends State<MobileAboutPage> {
  MobileWidgets myWidgets = MobileWidgets();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            myWidgets.title(width: width, tab: "about"),
            Container(
              width: width,
              height: 320,
              padding: EdgeInsets.fromLTRB(90, 0, width / 2, 0),
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/aboutHeader2.png"),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ABOUT DR. SOLA",
                    style: TextStyle(
                      fontSize: constants.fontsize18,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 3,
                    color: const Color.fromRGBO(182, 5, 5, 1),
                    width: 69,
                  ),
                  const SizedBox(height: 20),
                  Image.asset('assets/images/about1.png'),
                  const SizedBox(height: 20),
                  Text(
                    "Background",
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Dr Sola Okunkpolor (Fpmc) is a highly sought-after international speaker, author, and coach in areas of life, business, and education. She has worked with several organizations to improve business processes, attain quantum growth, and increase profit. Furthermore, she is known for coaching individuals and business owners to gain clarity, witness exponential development in their businesses, find happiness, and ultimately live a fulfilling life.",
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Education",
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "She holds a first degree in Microbiology from Ambrose Alli University, Masters degree in Business Administration and Early Childhood Education from the University of Benin, Benin City, and a Doctorate degree in Early Care - Childhood Education Management from Prowess University, Delaware, USA. She is a fellow with the Chartered Institute of Corporate Mentoring and Coaching of Nigeria, a chartered manager and marketer, certified Montessori educator among other certifications in the field of education.",
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Honors and Awards",
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "As a result of her exceptional contribution to society at all levels, she is the recipient of several awards, among which are the iconic brand of the year 2019 by Crystal Edge Service as well as the Catholic Women's Organization as an international mother of the year. Her result-oriented coaching, training, and consulting tools have consistently delivered results to well over 2,000 individuals and organizations spanning across religious organizations, sectors, and industries, some of which are SEPLAT, First Bank, LAPO, SOS International, Edojobs etc.",
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Work",
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Sola Okunkpolor began her work career as a classroom teacher in the late 1990s before moving to the core financial sector as a banker. Her career spanned over 15 years in both old and new generation banks, specializing in business development and MSME banking before transitioning to education fulltime.",
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w300,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: width,
              color: const Color.fromRGBO(255, 153, 0, 1),
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "A person’s state of mind is a critical factor in achieving sustainable success and creating long-term wealth.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize14,
                      fontFamily: constants.w600,
                      // fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      " - Dr. Sola Okunkpolor",
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
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/about2.png"),
                  const SizedBox(height: 20),
                  Container(
                    color: const Color.fromRGBO(245, 239, 249, 1),
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "MORE ABOUT DR. SOLA",
                          style: TextStyle(
                            fontSize: constants.fontsize14,
                            fontFamily: constants.w300,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Certified Life & Business Coach",
                          style: TextStyle(
                            fontSize: constants.fontsize18,
                            fontFamily: constants.w700,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 3,
                          color: const Color.fromRGBO(182, 5, 5, 1),
                          width: 69,
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            text:
                                'In 2019, Dr. Sola Okunpkolor voluntarily resigned from the banking industry to pursue her passion for education. She established "OUR LADY OF HOPE MONTESSORI SCHOOL," which quickly grew and expanded into another branch within three years. As an educationist, she provides training, coaching, and mentorship to school owners and other education consultants on global best practices in education and successful school management.\n\nAs a life coach, Dr. Sola guides her clients to gain clarity on their purpose, which she believes is the first step towards a fulfilling life. She helps them break down their aspirations into practical everyday actions and motivates them to execute, earning her the nickname ',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: constants.fontsize14,
                              fontFamily: constants.w300,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: '"the Performer."\n\n',
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: constants.fontsize14,
                                  fontFamily: constants.w600,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "As a serial entrepreneur, she leads by example, living out her own advice while also helping others achieve their dreams. Dr. Sola's business ventures include\n",
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: constants.fontsize14,
                                  fontFamily: constants.w300,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '  \u2022 Dreams Work Africa\n  \u2022 Our Lady of Hope Montessori Schools\n  \u2022 Kidz and Partiez\n  \u2022 Teachsmart.\n\n',
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: constants.fontsize14,
                                  fontFamily: constants.w600,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'She prioritizes organic and sustainable growth in pursuit of making dreams a reality. Sola is a devoted Christian, a wife, and a mother of two biological children. When not engaged in teaching, training, or business, she enjoys reading and listening to gospel music.',
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: constants.fontsize14,
                                  fontFamily: constants.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
              color: const Color.fromRGBO(38, 10, 56, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Sign Up for a Complimentary Results Coaching Session!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: constants.fontsize16,
                      fontFamily: constants.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 140,
                    child: MaterialButton(
                      onPressed: () {},
                      color: const Color.fromRGBO(255, 153, 0, 0.9),
                      hoverColor: const Color.fromRGBO(255, 153, 0, 1),
                      height: 53,
                      child: Center(
                        child: Text(
                          "Book a Session",
                          style: TextStyle(
                            fontSize: constants.fontsize14,
                            fontFamily: constants.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PopularCourses(isSmallScreen: true),
            // myWidgets.popularCourses(context, width: width),
            // myWidgets.testimonials(width: width, res: db.reviewList["reviews"]),
             TestimonialsWidget(isSmallScreen:true),

            const Footer()
          ],
        ),
      ),
    );
  }
}
