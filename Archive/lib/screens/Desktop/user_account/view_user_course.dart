import 'package:flutter/material.dart';
import 'package:sola_web/main.dart';

import '../../../utils/global.dart';

class ViewUserCourse extends StatefulWidget {
  dynamic res;
  Function(dynamic) navigateTo;
  ViewUserCourse({super.key, required this.navigateTo, required this.res});

  @override
  State<ViewUserCourse> createState() => _ViewUserCourseState();
}

class _ViewUserCourseState extends State<ViewUserCourse> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            widget.navigateTo({'page': 'courses'});
          },
          child: Text(
            '<<      Back to My courses',
            style: TextStyle(
              fontFamily: constants.w400,
              // fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            helperWidgets.build_cached_image(
              widget.res['img_url'],
              height: 120,
              width: 140,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.res['title']}',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: constants.w700,
                    ),
                  ),
                  Text(
                    'Brief Course Description',
                    style: TextStyle(
                      fontSize: 18,
                      color: constants.yellow,
                      fontFamily: constants.w700,
                    ),
                  ),
                  Text(
                    '${widget.res['description'].isEmpty ? "No description was added" : widget.res['description']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: constants.w300,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
