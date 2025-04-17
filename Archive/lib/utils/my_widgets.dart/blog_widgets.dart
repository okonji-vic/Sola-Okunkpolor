import 'package:flutter/material.dart';

import '../../api_service/course_api.dart';
import '../../api_service/payment_api.dart';
import '../../main.dart';
import '../global.dart';
import 'dart:html' as html;

class RecentPost extends StatefulWidget {
  // Function() reload;
  const RecentPost({super.key});

  @override
  State<RecentPost> createState() => _RecentPostState();
}

class _RecentPostState extends State<RecentPost> {
  List courseList = [];
  @override
  void initState() {
    loadCourses();
    super.initState();
  }

  loadCourses() async {
    try {
      var res = await viewCourses();
      debugPrint(res.toString());
      if (res['msg'] == 'success') {
        courseList = res['courses'].take(3).toList();
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return courseList.isEmpty
        ? const SizedBox()
        : Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 90),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "POPULAR COURSES",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: constants.w700,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 5,
                  // color: const Color.fromRGBO(182, 5, 5, 1),
                  color: const Color.fromRGBO(255, 153, 0, 1),
                  width: 150,
                ),
                const SizedBox(height: 12),
                Text(
                  "Timeless resources for your life, career and business",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: constants.fontsize20,
                    fontFamily: constants.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: [
                    ...List.generate(courseList.length, (index) {
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
                              padding:
                                  const EdgeInsets.fromLTRB(15, 10, 15, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${courseList[index]['abbreviation']}',
                                        style: TextStyle(
                                          fontSize: constants.fontsize20,
                                          fontFamily: constants.w700,
                                          color: const Color.fromRGBO(
                                              255, 153, 0, 1),
                                        ),
                                      ),
                                      Text(
                                        capitalizeFirstLetter(
                                            courseList[index]['course_type']),
                                        style: TextStyle(
                                          fontSize: constants.fontsize20,
                                          fontFamily: constants.w700,
                                          color: constants.lightPurple,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '${courseList[index]['title']}',
                                    style: TextStyle(
                                      fontSize: constants.fontsize24,
                                      fontFamily: constants.w700,
                                      height: 1.1,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  buildRegisterButton(index),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ],
            ),
          );
  }

  StatefulBuilder buildRegisterButton(int index) {
    bool isLoading = false;
    return StatefulBuilder(builder: (context, setCustomState) {
      return SizedBox(
        width: 200,
        child: MaterialButton(
          onPressed: isLoading
              ? null
              : () async {
                  if (getX.read(v.LOGGED_IN) == null) {
                    helperWidgets
                        .showToast("Please login to register for a course");
                    Navigator.of(context).pushNamed(route.signupPage);
                  } else {
                    setCustomState(() {
                      isLoading = true;
                    });
                    try {
                      if (courseList[index]['course_type'] == 'free') {
                        var res =
                            await registerCourses(courseList[index]['_id']);
                        debugPrint(res.toString());
                        if (res['msg'] == 'success') {
                          helperWidgets
                              .showToast("Course registered successfully");
                        } else if (res['msg'] ==
                            'user has already registered for this course') {
                          helperWidgets.showToast(
                              "You have already registered for this course");
                        } else {
                          helperWidgets.showToast(
                              "oOps something went wrong. Please try again");
                        }
                      } else {
                        var res = await makePayment([courseList[index]['_id']],
                            courseList[index]['price'], "Course");
                        debugPrint(res.toString());
                        if (res['msg'] == 'success') {
                          helperWidgets
                              .showToast("Proceeding to course payment.");
                          String url =
                              res['response']['data']['authorization_url'];
                          html.window.open(url, 'new tab');
                        } else {
                          helperWidgets.showToast(
                              "oOps something went wrong. Please try again");
                        }
                      }
                    } catch (e) {
                      myHttpErrorHandler(e);
                    } finally {
                      setCustomState(() {
                        isLoading = false;
                      });
                    }

                    // Navigator.of(context).pushNamed(route.coursesPage);
                  }
                },
          color: const Color.fromRGBO(255, 153, 0, 1),
          hoverColor: const Color.fromRGBO(38, 10, 56, 1),
          height: 53,
          child: Center(
            child: isLoading
                ? const SizedBox(
                    child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ))
                : Text(
                    "REGISTER COURSE",
                    style: TextStyle(
                      fontSize: constants.fontsize18,
                      fontFamily: constants.w700,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      );
    });
  }
}
