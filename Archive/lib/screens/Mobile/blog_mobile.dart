import 'package:flutter/material.dart';
import '../../main.dart';
import '../footer.dart';
import 'build_blog_card.dart';

class MobileBlog extends StatefulWidget {
  const MobileBlog({super.key});

  @override
  State<MobileBlog> createState() => _MobileBlogState();
}

class _MobileBlogState extends State<MobileBlog> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          myMobileWidgets.title(
              width: screen.width, tab: "blog", show_divider: true),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
              child: Text(
                "Blog",
                style: TextStyle(
                  color: constants.lightPurple,
                  fontFamily: constants.w700,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Container(
            color: constants.lightPurple,
            padding: const EdgeInsets.all(20),
            height: 60,
            child: Text(
              "Timeless articles for your life, career and business",
              style: TextStyle(
                color: Colors.white,
                fontFamily: constants.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            // alignment: Alignment.centerLeft,
          ),
          // SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 15,
            ),
            child: Text(
              "KEY WORDS",
              style: TextStyle(
                color: Colors.black,
                fontFamily: constants.w600,
                fontSize: 16,
              ),
            ),
          ),
          keyWordWidget(),
          const SizedBox(height: 30),
          BuildBlogCardMobile(db.recent_posts_data[0]),
          BuildBlogCardMobile(db.recent_posts_data[1]),
          BuildBlogCardMobile(db.recent_posts_data[2]),
          BuildBlogCardMobile(db.recent_posts_data[3]),
          myMobileWidgets.mailingList(width: screen.width),
          const Footer(),
        ],
      ),
    );
  }

  Widget keyWordWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Wrap(
        runSpacing: 15,
        spacing: 15,
        // runAlignment: Alignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(
          keyWordList.length,
          (index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[500]!, width: 0.8),
              ),
              child: Text(
                "${keyWordList[index]}",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: constants.w600,
                  fontSize: 16,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<dynamic> keyWordList = [
  'Coaching',
  'Mentoring',
  'Business',
  'Start up',
  'Leadership',
  'Consulting',
  'Ideas',
];
