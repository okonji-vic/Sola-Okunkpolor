import 'package:flutter/material.dart';

import '../../../api_service/course_api.dart';
import '../../../main.dart';
import '../../../utils/global.dart';

class UserCourse extends StatefulWidget {
  Function(dynamic) navigateTo;

  UserCourse({super.key, required this.navigateTo});

  @override
  State<UserCourse> createState() => _UserCourseState();
}

class _UserCourseState extends State<UserCourse> {
  List<dynamic> _future_list = [];
  Future<dynamic>? _futureData;

  @override
  void initState() {
    loadFuture();
    super.initState();
  }

  loadFuture() {
    _futureData = viewUserCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'My Courses',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: constants.fontsize32,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // emptyState()
          // myWidgets.buildCourses(context),

          FutureBuilder<dynamic>(
            future: _futureData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                print('>>>>>>>>>>>>>>>>>>>>>>> CHECKING... ${snapshot.data} ');
                if (snapshot.hasError) {
                  // NO INTERNET CONNECTION
                  return const Center(
                    child: Text("No internet connection. Please try again"),
                  );
                } else if (snapshot.hasData) {
                  //main widget here

                  // dynamic adminsList = snapshot.data;
                  if (snapshot.data["status"] == "ok") {
                    // news = courses["articles"];
                    // print('>>>>>>>>>>>>>>>>>>>>>>> ${snapshot.data}');

                    if (snapshot.data["courses"] != null) {
                      _future_list = snapshot.data["courses"];
                    }

                    if (_future_list.isEmpty) {
                      return emptyState();
                    } else {
                      // admins_count = snapshot.data['total_count'];
                      return Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: 15,
                        spacing: 15,
                        children: List.generate(_future_list.length, (index) {
                          return myWidgets.buildCourse(
                            (){

                              widget.navigateTo({
                                'page': 'view_course',
                                'data': _future_list[index],
                              });
                            },
                              _future_list[index]);
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

          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget emptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_course.png",

              // fit: BoxFit.cover,

              height: 300,

              // width: 0,
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                text: 'You have not registered for any course. \nVisit the ',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: 'course page ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: constants.lightPurple,
                    ),
                  ),
                  const TextSpan(
                    text: 'to start a course.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
