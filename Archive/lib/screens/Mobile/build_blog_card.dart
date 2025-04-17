import 'package:flutter/material.dart';

import '../../main.dart';

class BuildBlogCardMobile extends StatelessWidget {
  BuildBlogCardMobile(this.blog_data, {super.key});
  var blog_data;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print({
          "title": blog_data["title"],
          "image": blog_data["image"],
        });
        Navigator.of(context).pushNamed(route.viewBlogPage, arguments: {
          "title": blog_data["title"],
          "image": blog_data["image"],
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        height: screen.height - 200,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Image.asset(
                  blog_data["image"],
                  height: double.maxFinite,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${blog_data["title"]}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: constants.fontsize20,
                        fontFamily: constants.w700,
                        color: constants.lightPurple),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${blog_data["desc"]}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: constants.w400,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "14 Comments, 25 Likes, 8 Shares ",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: constants.w400,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "2 days ago",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: constants.w400,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
          ],
          ),
        ),
      ),
    );
  }
}
