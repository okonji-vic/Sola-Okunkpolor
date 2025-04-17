import 'package:flutter/material.dart';

import '../../main.dart';
import '../footer.dart';

class BlogDesktop extends StatefulWidget {
  const BlogDesktop({super.key});

  @override
  State<BlogDesktop> createState() => _BlogDesktopState();
}

class _BlogDesktopState extends State<BlogDesktop> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          myWidgets.title(width: screen.width, tab: "blog"),
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 10, 80, 50),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Blog",
                      style: TextStyle(
                        color: constants.lightPurple,
                        fontFamily: constants.w700,
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Container(
                        color: constants.lightPurple,
                        padding: const EdgeInsets.only(left: 30),
                        height: 60,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Timeless articles for your life, career and business",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: constants.w500,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    sideBarFilter(
                      screen,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          keyWordWidget(),
                          const SizedBox(
                            height: 50,
                          ),
                          Wrap(
                            spacing: 15,
                            runSpacing: 15,
                            children: List.generate(db.recent_posts_data.length,
                                (index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      route.viewBlogPage,
                                      arguments: {
                                        "title": db.recent_posts_data[index]
                                            ["title"],
                                        "image": db.recent_posts_data[index]
                                            ["image"],
                                      });
                                },
                                child: blogWidget(index, screen),
                              );
                            }),
                          ),
                          //               GridView.builder(
                          //               physics: NeverScrollableScrollPhysics(),
                          //   padding: const EdgeInsets.symmetric(horizontal: 50),
                          //   shrinkWrap: true,
                          //   itemCount: db.recent_posts_data.length, // Change this to your actual item count
                          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          //     crossAxisCount: 3,
                          //     // crossAxisSpacing: 25.0,
                          //     // mainAxisSpacing: 25.0,
                          //   ),
                          //   itemBuilder: (BuildContext context, int index) {
                          //     return FlutterLogo();
                          //     // return blogWidget(index);
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          myWidgets.mailingList(width: screen.width),
          const Footer(),
        ],
      ),
    );
  }

  Widget blogWidget(int index, var screen) {
    return Container(
      width: screen.width / 5,
      height: 500,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "${db.recent_posts_data[index]['image']}",
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "${db.recent_posts_data[index]['title']}",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: constants.purple,
              fontFamily: constants.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Expanded(
            child: Text(
              "${db.recent_posts_data[index]['body']}",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                color: Colors.black,
                fontFamily: constants.w400,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // const Spacer(),
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
    );
  }

  Widget keyWordWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Wrap(
        runSpacing: 15,
        spacing: 15,
        // runAlignment: Alignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text(
              "KEY WORDS",
              style: TextStyle(
                color: Colors.black,
                fontFamily: constants.w600,
                fontSize: 22,
              ),
            ),
          ),
          ...List.generate(keyWordList.length, (index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[500]!, width: 0.8),
              ),
              child: Text(
                "${keyWordList[index]}",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: constants.w600,
                  fontSize: 20,
                ),
              ),
            );
          })
        ],
      ),
    );
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

  Widget sideBarFilter(var screen) {
    return SizedBox(
      width: screen.width / 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "FILTER",
            style: TextStyle(
              color: Colors.black,
              fontFamily: constants.w500,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          blogPostFilterWidget(),
          const SizedBox(
            height: 50,
          ),
          blogPostCategoryWidget(),
        ],
      ),
    );
  }

  List<dynamic> blogCategoryFilter = [
    {
      "filter": "All Courses",
      "checked": false,
    },
    {
      "filter": "Career",
      "checked": false,
    },
    {
      "filter": "Mentorship",
      "checked": false,
    },
    {
      "filter": "Education",
      "checked": false,
    },
    {
      "filter": "Business",
      "checked": false,
    },
    {
      "filter": "Start up",
      "checked": false,
    },
    {
      "filter": "Marriage",
      "checked": false,
    },
    {
      "filter": "Counselling",
      "checked": false,
    },
    {
      "filter": "Submission",
      "checked": false,
    },
    {
      "filter": "Family",
      "checked": false,
    },
    {
      "filter": "Children",
      "checked": false,
    },
    {
      "filter": "LeaderShip",
      "checked": false,
    },
  ];

  Widget blogPostCategoryWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Blog Category",
          style: TextStyle(
            color: Colors.black,
            fontFamily: constants.w500,
            fontSize: 20,
            decoration: TextDecoration.underline,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        ...List.generate(blogCategoryFilter.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Checkbox(
                    value: blogCategoryFilter[index]['checked'],
                    onChanged: (val) {
                      setState(() {
                        blogCategoryFilter[index]['checked'] = val;
                      });
                    }),
                Expanded(
                  child: Text(
                    "${blogCategoryFilter[index]['filter']}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: constants.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          );
        })
      ],
    );
  }

  List<dynamic> blogPostFilter = [
    {
      "filter": "All Blog Post",
      "checked": false,
    },
    {
      "filter": "Most Likes",
      "checked": false,
    },
    {
      "filter": "Most Comments",
      "checked": false,
    },
    {
      "filter": "Most Shared",
      "checked": false,
    }
  ];

  Widget blogPostFilterWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Blog Posts",
          style: TextStyle(
            color: Colors.black,
            fontFamily: constants.w500,
            fontSize: 20,
            decoration: TextDecoration.underline,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        ...List.generate(blogPostFilter.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Checkbox(
                    value: blogPostFilter[index]['checked'],
                    onChanged: (val) {
                      setState(() {
                        blogPostFilter[index]['checked'] = val;
                      });
                    }),
                Expanded(
                  child: Text(
                    "${blogPostFilter[index]['filter']}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: constants.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          );
        })
      ],
    );
  }

  final bool _is_sa1_Hovered = false;
  final bool _is_sa2_Hovered = false;
}

// class BlogDesktop extends StatefulWidget {
//   const BlogDesktop({super.key});

//   @override
//   State<BlogDesktop> createState() => _BlogDesktopState();
// }

// class _BlogDesktopState extends State<BlogDesktop> {
//   @override
//   Widget build(BuildContext context) {
//     var screen = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ListView(
//         children: [
//           myWidgets.title(width: screen.width, tab: "blog"),
//           Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: screen.width * 0.22,
//               vertical: 60,
//             ),
//             color: const Color.fromRGBO(244, 245, 248, 1),
//             child: Column(
//               children: [
//                 Text(
//                   "Insights on exploring human potential and unlocking professional and personal growth."
//                       .toUpperCase(),
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: constants.fontsize26,
//                     fontFamily: constants.w700,
//                     // fontWeight: FontWeight.bold
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   "BLOG",
//                   style: TextStyle(
//                     fontFamily: constants.openSans,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 80.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 30),
//                 Container(
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 4,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Image.asset("./assets/images/r_and_i.png",
//                                 height: 20),
//                             const SizedBox(height: 20),
//                             Text(
//                               "Shaping the future of work with purpose: Insights from Adam Grant and Alexi Robichaux",
//                               style: TextStyle(
//                                 fontSize: constants.fontsize28,
//                                 fontFamily: constants.w500,
//                               ),
//                             ),
//                             const SizedBox(height: 6),
//                             Text(
//                               "January 18th, 2024",
//                               style: TextStyle(
//                                 letterSpacing: 1.5,
//                                 fontSize: constants.fontsize14,
//                                 fontFamily: constants.w500,
//                               ),
//                             ),
//                             const SizedBox(height: 35),
//                             SizedBox(
//                               width: 150,
//                               child: MaterialButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (_) =>
//                                               const ViewArticles()));
//                                 },
//                                 color: const Color.fromRGBO(255, 153, 0, 0.9),
//                                 hoverColor:
//                                     const Color.fromRGBO(255, 153, 0, 1),
//                                 height: 53,
//                                 child: Center(
//                                   child: Text(
//                                     "Read More",
//                                     style: TextStyle(
//                                       fontSize: constants.fontsize18,
//                                       fontFamily: constants.w500,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 40),
//                       Expanded(
//                         flex: 6,
//                         child: Image.asset(
//                           "./assets/images/blog_cover1.png",
//                           height: 400,
//                           fit: BoxFit.cover,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 80),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Spotlight Articles",
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontFamily: constants.w700,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Container(
//                       height: 3.5,
//                       margin: const EdgeInsets.only(top: 10),
//                       color: const Color.fromRGBO(182, 5, 5, 1),
//                       width: 160,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Stack(
//                             children: [
//                               Image.asset(
//                                 "./assets/images/sa1.png",
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                               ),
//                               Positioned(
//                                 right: 0,
//                                 bottom: 0,
//                                 child: MouseRegion(
//                                   cursor: SystemMouseCursors.click,
//                                   onEnter: (_) {
//                                     setState(() {
//                                       _is_sa1_Hovered = true;
//                                     });
//                                   },
//                                   onExit: (_) {
//                                     setState(() {
//                                       _is_sa1_Hovered = false;
//                                     });
//                                   },
//                                   child: Image.asset(
//                                     "./assets/images/arrow_right.png",
//                                     fit: BoxFit.contain,
//                                     // height: 100,
//                                     width: _is_sa1_Hovered ? 70 : 60,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           Container(
//                             height: 100,
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 4.0),
//                             child: Text(
//                               "What is Coaching",
//                               // textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: constants.fontsize20,
//                                 fontWeight: FontWeight.w600,
//                                 // fontFamily: constants.openSans,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 100),
//                     Expanded(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Stack(
//                             children: [
//                               Image.asset(
//                                 "./assets/images/sa2.png",
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                               Positioned(
//                                 right: 0,
//                                 bottom: 0,
//                                 child: MouseRegion(
//                                   cursor: SystemMouseCursors.click,
//                                   onEnter: (_) {
//                                     setState(() {
//                                       _is_sa2_Hovered = true;
//                                     });
//                                   },
//                                   onExit: (_) {
//                                     setState(() {
//                                       _is_sa2_Hovered = false;
//                                     });
//                                   },
//                                   child: Image.asset(
//                                     "./assets/images/arrow_right.png",
//                                     fit: BoxFit.contain,
//                                     // height: 100,
//                                     width: _is_sa2_Hovered ? 70 : 60,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           Container(
//                             height: 100,
//                             // color: Colors.red,
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 4.0),
//                             child: Text(
//                               "Coaching during crisis: Research shows coaching helps employees navigate change and uncertainty",
//                               // textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: constants.fontsize20,
//                                 fontWeight: FontWeight.w600,
//                                 // fontFamily: constants.openSans,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 60),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Latest Articles",
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontFamily: constants.w700,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Container(
//                       height: 3.5,
//                       margin: const EdgeInsets.only(top: 10),
//                       color: const Color.fromRGBO(182, 5, 5, 1),
//                       width: 160,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 LayoutBuilder(
//                   builder: (context, constraints) {
//                     int columns = (constraints.maxWidth / 400)
//                         .floor(); // Adjust 300 based on your item width
//                     return GridView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       // padding: const EdgeInsets.all(10.0),
//                       itemCount: db.shopList["shop"].length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: columns,
//                           mainAxisSpacing: 25,
//                           crossAxisSpacing: 40,
//                           mainAxisExtent: 500
//                           // childAspectRatio: 0.9,
//                           ),
//                       itemBuilder: (BuildContext context, int index) {
//                         return BuildArticles(db.shopList["shop"][index]);
//                       },
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 40),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 100),
//                   child: Image.asset(
//                     "assets/images/learn_success.png",
//                     fit: BoxFit.contain,
//                     height: 500,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
//           myWidgets.mailingList(width: screen.width),
//           const Footer(),
//         ],
//       ),
//     );
//   }

//   bool _is_sa1_Hovered = false;
//   bool _is_sa2_Hovered = false;
// }
