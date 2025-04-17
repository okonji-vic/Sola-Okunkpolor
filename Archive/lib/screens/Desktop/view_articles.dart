import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Screens/footer.dart';
import '../../main.dart';
import 'helper_widgets/BuildArticles.dart';

class ViewArticles extends StatefulWidget {
  const ViewArticles({super.key});

  @override
  State<ViewArticles> createState() => _ViewArticlesState();
}

class _ViewArticlesState extends State<ViewArticles> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          myWidgets.title(width: screen.width, tab: "blog", show_divider: true),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screen.width * 0.18,
              vertical: 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post["category"],
                  style: TextStyle(
                    fontSize: constants.fontsize18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Text(
                    post["title"],
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: constants.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Text(
                  "By "+post["author"],
                  style: TextStyle(
                    fontSize: constants.fontsize18,
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
                        fontSize: constants.fontsize14, color: Colors.black54
                      ),
                    ),
                    Text(
                      " - " + post["mins_read"] + " mins read",
                      style: TextStyle(
                        fontSize: constants.fontsize14, color: Colors.black54
                      ),
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
              horizontal: 100,
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
                LayoutBuilder(
                  builder: (context, constraints) {
                    int columns = (constraints.maxWidth / 400)
                        .floor(); // Adjust 300 based on your item width
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // padding: const EdgeInsets.all(10.0),
                      itemCount: 3,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          mainAxisSpacing: 25,
                          crossAxisSpacing: 40,
                          mainAxisExtent: 500
                          // childAspectRatio: 0.9,
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        return BuildArticles(db.shopList["shop"][index]);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          myWidgets.mailingList(width: screen.width),
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
