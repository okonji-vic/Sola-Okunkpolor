import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Screens/footer.dart';
import '../../main.dart';
import 'helpers/BuildMobileArticles.dart';

class MobileViewArticles extends StatefulWidget {
  const MobileViewArticles({super.key});

  @override
  State<MobileViewArticles> createState() => _MobileViewArticlesState();
}

class _MobileViewArticlesState extends State<MobileViewArticles> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          myMobileWidgets.title(
              width: screen.width, tab: "blog", show_divider: true),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post["category"],
                  style: TextStyle(
                    fontSize: constants.fontsize16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Text(
                    post["title"],
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: constants.w500,
                      // letterSpacing: 1.2,
                    ),
                  ),
                ),
                Text(
                  "By " + post["author"],
                  style: TextStyle(
                    fontSize: constants.fontsize16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      post["date_posted"],
                      style: TextStyle(
                          fontSize: constants.fontsize14,
                          color: Colors.black54),
                    ),
                    Text(
                      " - " + post["mins_read"] + " mins read",
                      style: TextStyle(
                          fontSize: constants.fontsize14,
                          color: Colors.black54),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  post['image'],
                  height: 500,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  post["body"],
                  style: TextStyle(
                    fontSize: constants.fontsize18,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Read Next",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: constants.w700,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 3.5,
                      margin: EdgeInsets.only(top: 2),
                      color: Color.fromRGBO(182, 5, 5, 1),
                      width: 160,
                    ),
                  ],
                ),
                SizedBox(height: 50),
                SizedBox(
                  // color: Colors.red,
                  width: screen.width,
                  height: 400,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 10),
                    itemCount: db.gallery["gallery"].length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 30),
                        width: screen.width - 200,
                        child: BuildMobileArticles(
                          "Coaching during crisis: Research shows coaching helps employees navigate change and uncertainty",
                          "Learn about 15 of the highest-paying tech jobs and transition into a lucrative career. Find out what it takes to hold and excel in these roles.",
                          "sa2.png",
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          myMobileWidgets.mailingList(width: screen.width),
          Footer()
        ],
      ),
    );
  }

  Map<String, dynamic> post = {
    "category": "Blog/Research Insights",
    "title":
        "Shaping the future of work with purpose: Insights from Adam Grant and Alexi Robichaux",
    "author": "Dr. Sola Okunkpolor",
    "date_posted": "January 23, 2024",
    "mins_read": "6",
    "image": "./assets/images/blog_cover1.png",
    "body":
        "Sola Okunkpolor and co-founder Alexi Robichaux sat down with organizational psychologist, author, and BetterUp Science Board Member Adam Grant to discuss the role that purpose plays in building a future-ready workplace. \n\nLeaders often try to create purpose through meaningful mission statements, but most people struggle to connect their jobs and daily actions to them. When it comes to purpose, leaders need to help link individual roles to their impact on stakeholders and teammates. A key responsibility for managers is to work with their direct reports to determine how their role connects to broader organizational goals.",
  };
}
