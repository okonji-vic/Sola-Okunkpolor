import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Screens/footer.dart';
import '../../main.dart';
import '../Desktop/helper_widgets/BuildArticles.dart';
import 'build_blog_card.dart';

class MobileViewBlogs extends StatefulWidget {
  const MobileViewBlogs({super.key});

  @override
  State<MobileViewBlogs> createState() => _MobileViewBlogsState();
}

class _MobileViewBlogsState extends State<MobileViewBlogs> {
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
          myMobileWidgets.title(
              width: screen.width, tab: "blog", show_divider: true),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    "$title",
                    style: TextStyle(
                      fontSize: 40,
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
                const SizedBox(
                  height: 5,
                ),
                Text(
                  post["date_posted"],
                  style: TextStyle(
                      fontSize: constants.fontsize14, color: Colors.black54),
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "$image",
                  height: screen.height - 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  post["body"],
                  style: TextStyle(
                    fontSize: constants.fontsize16,
                  ),
                ),
                const SizedBox(
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
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        "COMMENTS",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: constants.w600,
                          letterSpacing: 1.2,
                          color: constants.lightPurple,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Fullname",
                          style: TextStyle(
                            fontSize: 16,
                            // fontFamily: constants.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 6),
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
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 16,
                            // fontFamily: constants.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 6),
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
                    const SizedBox(height: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Comment",
                          style: TextStyle(
                            // fontSize: 16,
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
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        height: 40,
                        width: 200,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                constants.lightPurple),
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    4,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onPressed: loadingState == 0 ? () async {} : null,
                          child: buildButtonChild(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Osawele Ernest",
                                      style: TextStyle(
                                        fontFamily: constants.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    const Text("yesterday")
                                  ],
                                )
                              ],
                            ),
                            // showPinPopup(context, {})
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "This is the most exceptional piece ive read in a while, it really transform my life and business, i recommend this. peice, Also i bought a ton of them for my Clients.",
                          style: TextStyle(
                            fontSize: constants.fontsize16,
                            color: const Color.fromRGBO(0, 0, 0, 0.8),
                            height: 1.4,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 60),
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
          const SizedBox(
            height: 30,
          ),
          build_recent_blog_posts(),
          const Footer()
        ],
      ),
    );
  }

  int loadingState = 0;
  String comment = '';
  Widget buildButtonChild() {
    if (loadingState == 0) {
      return const Text(
        "SUBMIT",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      );
    } else {
      return const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(color: Colors.white));
    }
  }

  final InputDecoration _myDecoration = const InputDecoration(
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
      color: const Color.fromRGBO(245, 245, 245, 1),
      // color: Color.fromRGBO(220, 33, 33, 1),
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
                fontSize: 24,
                fontFamily: constants.w700,
                color: constants.lightPurple,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BuildBlogCardMobile(db.recent_posts_data[0]),
              BuildBlogCardMobile(db.recent_posts_data[1]),
              BuildBlogCardMobile(db.recent_posts_data[2]),
              BuildBlogCardMobile(db.recent_posts_data[3]),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
