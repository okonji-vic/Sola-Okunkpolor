import 'package:flutter/material.dart';
import 'package:sola_web/main.dart';

import '../../../utils/global.dart';

class ViewUserCourseMobile extends StatefulWidget {
  Function(dynamic) navigateTo;
  dynamic res;
  ViewUserCourseMobile(
      {super.key, required this.res, required this.navigateTo});

  @override
  State<ViewUserCourseMobile> createState() => _ViewUserCourseMobileState();
}

class _ViewUserCourseMobileState extends State<ViewUserCourseMobile> {
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
      
         helperWidgets.build_cached_image(
              widget.res['img_url'],
          height: 170,
          width: double.maxFinite,
            ),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            '${widget.res['title']}',
            style: TextStyle(
              fontSize: 24,
              fontFamily: constants.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            'Brief Course Description',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: constants.yellow,
              fontFamily: constants.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '${widget.res['description'].isEmpty ? "No description was added" : widget.res['description']}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontFamily: constants.w300,
          ),
        )
      ]),
    );
  }
}
