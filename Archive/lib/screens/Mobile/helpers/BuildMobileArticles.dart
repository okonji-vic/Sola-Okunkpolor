import 'package:flutter/material.dart';
import 'package:sola_web/main.dart';

class BuildMobileArticles extends StatelessWidget {
  BuildMobileArticles(this.title, this.details, this.image, {super.key});
  String title;
  String details;
  String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "./assets/images/$image",
          fit: BoxFit.cover,
          width: double.maxFinite,
        ),
        Material(
          elevation: 5,
          color: Colors.white,
          child: Container(
            height: 160,
            width: double.maxFinite,
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  // textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: constants.fontsize20,
                    fontWeight: FontWeight.w600,
                    // fontFamily: constants.openSans,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  details,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: constants.fontsize16,
                    fontWeight: FontWeight.normal,
                    // fontFamily: constants.openSans,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
