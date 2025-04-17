import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Screens/footer.dart';
import '../../main.dart';
import 'helper_widgets/BuildArticles.dart';

class ViewBlogs extends StatefulWidget {
  const ViewBlogs({super.key});

  @override
  State<ViewBlogs> createState() => _ViewBlogsState();
}

class _ViewBlogsState extends State<ViewBlogs> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final title = arguments['title'];
    final image = arguments['image'];

    var screen = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          myWidgets.title(width: screen.width, tab: "blog"),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      child: Text(
                        "< Back to blog posts",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  post["category"],
                  style: TextStyle(
                    fontSize: constants.fontsize18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: constants.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Text(
                  "By " + post["author"],
                  style: TextStyle(
                    fontSize: constants.fontsize18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  post["date_posted"],
                  style: TextStyle(
                      fontSize: constants.fontsize14, color: Colors.black54),
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  image,
                  height: screen.height - 200,
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
                  height: 60,
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
                SizedBox(height: 50),
                // LayoutBuilder(
                //   builder: (context, constraints) {
                //     int columns = (constraints.maxWidth / 400)
                //         .floor(); // Adjust 300 based on your item width
                //     return GridView.builder(
                //       physics: const NeverScrollableScrollPhysics(),
                //       shrinkWrap: true,
                //       // padding: const EdgeInsets.all(10.0),
                //       itemCount: 3,
                //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //           crossAxisCount: columns,
                //           mainAxisSpacing: 25,
                //           crossAxisSpacing: 40,
                //           mainAxisExtent: 500
                //           // childAspectRatio: 0.9,
                //           ),
                //       itemBuilder: (BuildContext context, int index) {
                //         return BuildArticles(db.shopList["shop"][index]);
                //       },
                //     );
                //   },
                // ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Text(
                      "Comment",
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: constants.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Fullname",
                                style: TextStyle(
                                  fontSize: 16,
                                  // fontFamily: constants.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(height: 6),
                              Column(
                                children: [
                                  TextField(
                                    onChanged: (val) {
                                      comment = val;
                                    },
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 1,
                                    textInputAction: TextInputAction.newline,
                                    decoration: _myDecoration,
                                    enabled: loadingState == 0 ? true : false,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 16,
                                  // fontFamily: constants.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(height: 6),
                              Column(
                                children: [
                                  TextField(
                                    onChanged: (val) {
                                      comment = val;
                                    },
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 1,
                                    textInputAction: TextInputAction.newline,
                                    decoration: _myDecoration,
                                    enabled: loadingState == 0 ? true : false,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Comment",
                          style: TextStyle(
                            fontSize: 16,
                            // fontFamily: constants.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        TextField(
                          onChanged: (val) {
                            comment = val;
                          },
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          textInputAction: TextInputAction.newline,
                          decoration: _myDecoration,
                          enabled: loadingState == 0 ? true : false,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                        child: buildButtonChild(),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              constants.lightPurple),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  4,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: loadingState == 0 ? () async {} : null,
                      ),
                    ),
                    SizedBox(height: 50),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Osawele Ernest",
                                      style: TextStyle(
                                        fontFamily: constants.w500,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text("yesterday")
                                  ],
                                )
                              ],
                            ),
                            // showPinPopup(context, {})
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "This is the most exceptional piece ive read in a while, it really transform my life and business, i recommend this. peice, Also i bought a ton of them for my Clients.",
                          style: TextStyle(
                            fontSize: constants.fontsize18,
                            color: Color.fromRGBO(0, 0, 0, 0.8),
                            height: 1.4,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 60),
                    Center(
                      child: TextButton(
                        child: Text(
                          "View more comments",
                          style: TextStyle(
                            color: constants.yellow,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          build_recent_blog_posts(),

          // myWidgets.mailingList(width: screen.width),
          Footer()
        ],
      ),
    );
  }

  int loadingState = 0;
  String comment = '';
  Widget buildButtonChild() {
    if (loadingState == 0) {
      return Text(
        "Submit",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      );
    } else {
      return SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(color: Colors.white));
    }
  }

  final InputDecoration _myDecoration = InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(18, 5, 18, 5),
    border: OutlineInputBorder(),
  );

  Map<String, dynamic> post = {
    "category": "Blog/Leadership",
    'title': "Putting a stop to bad work habits",
    "author": "Admin",
    "date_posted": "January 23, 2024",
    "mins_read": "6",
    "image": "./assets/images/blog1.webp",
    "body": '''1. Focus on Value Creation:
In tough economic times, consumers become more discerning about how they spend their money. Therefore, it's crucial for startups to focus on creating genuine value for their target audience. Identify pain points and unmet needs within your market and develop products or services that address them effectively. By delivering real value to customers, you can differentiate your startup and build a loyal customer base.

2. Embrace Agility and Flexibility:
Flexibility is essential for startups navigating uncertain economic conditions. Be prepared to adapt quickly to changes in the market, customer preferences, and economic trends. Maintain a lean and agile approach to business operations, allowing you to pivot when necessary and seize new opportunities as they arise. Stay attuned to market dynamics and be willing to adjust your strategies accordingly.

3. Cultivate Innovation and Creativity:
Tough economic times often call for innovative solutions. Encourage a culture of innovation and creativity within your startup, empowering employees to think outside the box and explore new ideas. Foster an environment where experimentation is encouraged, and failure is seen as a learning opportunity. By fostering a culture of innovation, startups can uncover novel solutions to challenges and stay ahead of the competition.

4. Build Strong Relationships:
Relationships are invaluable in business, especially during challenging times. Invest in building strong relationships with customers, suppliers, investors, and other key stakeholders. Listen to their feedback, address their concerns, and demonstrate your commitment to their success. Additionally, cultivate a strong network of mentors, advisors, and peers who can provide guidance, support, and valuable insights as you navigate the startup journey.

5. Prioritize Financial Discipline:
In a tough economy, financial discipline is paramount for startup survival. Prioritize cash flow management, monitor expenses closely, and seek opportunities to reduce costs without sacrificing quality. Explore alternative funding sources such as bootstrapping, crowdfunding, or strategic partnerships to fuel growth while conserving capital. By maintaining financial discipline, startups can weather economic downturns more effectively and position themselves for long-term success.

Conclusion:
While building a successful startup in a tough economy presents unique challenges, it also offers opportunities for innovation, resilience, and growth. By focusing on value creation, embracing agility, fostering innovation, building strong relationships, and prioritizing financial discipline, startups can navigate economic uncertainties and emerge stronger on the other side. With determination, creativity, and a strategic mindset, entrepreneurs can turn adversity into opportunity and build thriving businesses even in the toughest of times.''',
  };

  Container build_recent_blog_posts() {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1),
      // padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      // height: 650,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Text(
              "MORE POSTS",
              style: TextStyle(
                fontSize: constants.fontsize30,
                fontFamily: constants.w700,
                color: constants.lightPurple,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              build_recent_posts_card(0),
              SizedBox(width: 10),
              build_recent_posts_card(1),
              SizedBox(width: 10),
              build_recent_posts_card(2),
              SizedBox(width: 10),
              build_recent_posts_card(3),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Expanded build_recent_posts_card(int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(route.viewBlogPage, arguments: {
            "title": db.recent_posts_data[index]["title"],
            "image": db.recent_posts_data[index]["image"],
          });
        },
        child: Container(
          color: Colors.white,
          height: 450,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    "${db.recent_posts_data[index]["image"]}",

                    // height: 120, // Adjust the height as needed
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "${db.recent_posts_data[index]["title"]}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w700,
                      color: constants.lightPurple),
                ),
                SizedBox(height: 10),
                Text(
                  "${db.recent_posts_data[index]["desc"]}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: constants.fontsize18,
                    fontFamily: constants.w400,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 20),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    "Read more >>",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: constants.fontsize16,
                      fontFamily: constants.w600,
                      color: constants.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
