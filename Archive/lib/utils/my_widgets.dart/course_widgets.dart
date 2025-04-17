import 'package:flutter/material.dart';

import '../../api_service/course_api.dart';
import '../../api_service/payment_api.dart';
import '../../main.dart';
import '../global.dart';
import 'dart:html' as html;

class PopularCourses extends StatefulWidget {
  bool isSmallScreen;
  // Function() reload;
  PopularCourses({super.key, this.isSmallScreen = false});

  @override
  State<PopularCourses> createState() => _PopularCoursesState();
}

class _PopularCoursesState extends State<PopularCourses> {
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
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "POPULAR COURSES",
                  style: TextStyle(
                    fontSize: widget.isSmallScreen ? 20 : 32,
                    fontFamily: constants.w700,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 5,
                  // color: const Color.fromRGBO(182, 5, 5, 1),
                  color:
                      constants.yellow, // const Color.fromRGBO(255, 153, 0, 1),
                  width: 150,
                ),
                const SizedBox(height: 12),
                Text(
                  "Timeless resources for your life, career and business",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.isSmallScreen
                        ? constants.fontsize18
                        : constants.fontsize20,
                    fontFamily: constants.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: [
                      ...List.generate(courseList.length, (index) {
                        return BuildCourse(courseData: courseList[index]);
                      })
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

class BuildCourse extends StatefulWidget {
  dynamic courseData;
  bool isSmallScreen;

  BuildCourse(
      {super.key, required this.courseData, this.isSmallScreen = false});

  @override
  State<BuildCourse> createState() => _BuildCourseState();
}

class _BuildCourseState extends State<BuildCourse> {
  @override
  Widget build(BuildContext context) {
    return buildCourse();
  }

  Container buildCourse() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      width: 320,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.asset('assets/images/course1.webp'),
          helperWidgets.build_cached_image('${widget.courseData['img_url']}',
              height: null, width: null),
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
                      '${widget.courseData['abbreviation']}',
                      style: TextStyle(
                        fontSize: widget.isSmallScreen
                            ? constants.fontsize18
                            : constants.fontsize20,
                        fontFamily: constants.w700,
                        color: constants
                            .yellow, // const Color.fromRGBO(255, 153, 0, 1),
                      ),
                    ),
                    Text(
                      capitalizeFirstLetter(widget.courseData['course_type']),
                      style: TextStyle(
                        fontSize: widget.isSmallScreen
                            ? constants.fontsize18
                            : constants.fontsize20,
                        fontFamily: constants.w700,
                        color: constants.lightPurple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  '${widget.courseData['title']}',
                  style: TextStyle(
                    fontSize: widget.isSmallScreen
                        ? constants.fontsize20
                        : constants.fontsize24,
                    fontFamily: constants.w700,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 20),
                buildRegisterButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  StatefulBuilder buildRegisterButton() {
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
                      if (widget.courseData['course_type'] == 'free') {
                        var res =
                            await registerCourses(widget.courseData['_id']);
                        debugPrint(res.toString());
                        if (res['msg'] == 'success') {
                          helperWidgets
                              .showToast("Course registered successfully");
                          Navigator.of(context)
                              .pushNamed(route.userAccountControl);
                        } else if (res['msg'] ==
                            'user has already registered for this course') {
                          helperWidgets.showToast(
                              "You have already registered for this course");
                        } else {
                          helperWidgets.showToast(
                              "oOps something went wrong. Please try again");
                        }
                      } else {
                        var res = await makePayment([widget.courseData['_id']],
                            widget.courseData['price'], "Course");
                        debugPrint(res.toString());
                        if (res['msg'] == 'success') {
                          helperWidgets.showToast(
                              "After successful payment check your account for the paid course");
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
          color: constants.lightPurple, // const Color.fromRGBO(255, 153, 0, 1),
          hoverColor: constants.yellow, // const Color.fromRGBO(38, 10, 56, 1),
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
