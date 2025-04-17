import 'package:flutter/material.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/utils/functions.dart';

import '../../api_service/course_api.dart';
import '../../utils/global.dart';
import '../../utils/my_widgets.dart/course_widgets.dart';
import '../../utils/my_widgets.dart/gallery_widgets.dart';
import '../../utils/my_widgets.dart/promotionalVideo.dart';
import '../../utils/my_widgets.dart/testimonial_widgets.dart';

class MobileCoursesPage extends StatefulWidget {
  const MobileCoursesPage({super.key});

  @override
  State<MobileCoursesPage> createState() => _MobileCoursesPageState();
}

class _MobileCoursesPageState extends State<MobileCoursesPage> {
  MobileWidgets myWidgets = MobileWidgets();
  List<dynamic> _future_list = [];
  Future<dynamic>? _futureData;

  List<String> categoryList = [];
  List keyWordList = [];
  List selectedCategories = [];
  List selectedKeywords = [];

  String pricing = "";

  @override
  void initState() {
    getCategories();
    getKeywords();
    loadFuture();
    super.initState();
  }

  getCategories() async {
    try {
      var res = await viewCourseCategories();
      if (res['msg'] == 'success') {
        categoryList = res['categories']['categories'];

        // for (int i = 0; i < categoryList.length; i++) {
        //   courseCategoryFilter.add({
        //     "filter": categoryList[i],
        //     "checked": false,
        //   });
        // }
        setState(() {});
      }
    } catch (e) {}
  }

  getKeywords() async {
    try {
      var res = await viewCourseKeywords();
      debugPrint(res.toString());
      if (res['msg'] == 'success') {
        keyWordList = res['keywords']['keywords'];
        setState(() {});
      }
    } catch (e) {}
  }

  loadFuture() {
    if (pricing == "" &&
        selectedCategories.isEmpty &&
        selectedKeywords.isEmpty) {
      print(1);
      _futureData = viewCourses();
    } else if (pricing.isNotEmpty &&
        selectedCategories.isEmpty &&
        selectedKeywords.isEmpty) {
      print(2);
      _futureData = viewFilterCourses(pricing, categoryList, keyWordList);
    } else {
      _futureData =
          viewFilterCourses(pricing, selectedCategories, selectedKeywords);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            myWidgets.title(width: width, tab: "courses"),
            Container(
              width: width,
              height: 320,
              padding: EdgeInsets.fromLTRB(30, 0, width / 2, 0),
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/coursesHeader2.png"),
                ),
              ),
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "I BELIEVE IN MAKING ",
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 16,
                          fontFamily: constants.w400,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: "YOUR BUSINESS WORK ",
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 16,
                                fontFamily: constants.w400,
                                color: constants.yellow),
                          ),
                          TextSpan(
                            text: "FOR YOU, NOT THE OTHER WAY AROUND ",
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 16,
                              fontFamily: constants.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          
            keyWordWidget(),

            // myWidgets.buildCourses(context),
          

            PromotionalVideo(isSmallScreen: true),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
            //   child: Image.asset(
            //     'assets/images/vidm.webp',
            //     width: width,
            //     fit: BoxFit.cover,
            //     alignment: Alignment.topCenter,
            //   ),
            // ),
            Container(
              // color: const Color.fromRGBO(221, 221, 221, 1),
              color: const Color.fromRGBO(20, 5, 29, 1),
              width: width,
              padding: const EdgeInsets.fromLTRB(30, 25, 30, 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "FEATURED IN",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: constants.w700,
                      fontSize: constants.fontsize18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/images/channelsTV.png",
                            height: 70,
                          ),
                          Image.asset(
                            "assets/images/iTV.png",
                            height: 60,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/images/kuTV.png",
                            width: 60,
                          ),
                          Image.asset(
                            "assets/images/ebs.png",
                            height: 80,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            myWidgets.buildRecentPost(width),
            // myWidgets.gallery(width: width),
            // myWidgets.testimonials(width: width, res: db.reviewList["reviews"]),
            Gallery(
              isSmallScreen: true,
            ),
            TestimonialsWidget(),
            myWidgets.mailingList(width: width),
            const Footer()
          ],
        ),
      ),
    );
  }

  Widget keyWordWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40),
      child: Wrap(
        runSpacing: 15,
        spacing: 15,
        // runAlignment: Alignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ...List.generate(keyWordList.length, (index) {
            return InkWell(
              onTap: () {
                if (selectedKeywords.contains(keyWordList[index])) {
                  selectedKeywords.remove(keyWordList[index]);
                } else {
                  selectedKeywords.add(keyWordList[index]);
                }
                setState(() {
                  loadFuture();
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
              ),
            );
          })
        ],
      ),
    );
  }

  // List<String> courseCategoryFilter = [];

  List<String> pricingFilter = [
    "All Courses",
    "xcPaid",
    "Free",
  ];

  void _showPopupMenu(
    BuildContext context,
    Offset offset,
  ) {
    //final GlobalKey<State<StatefulWidget>> menuKey = GlobalKey<State>();
    double left = offset.dx;
    double top = offset.dy;
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          left - 100, top + 20, left + 200, double.maxFinite),
      items: [
        PopupMenuItem(
          child: Row(
            children: [
              DropdownButton<String>(
                // value: 'Option 1',
                icon: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pricing',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: constants.w400,
                          fontSize: 18,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ]),

                underline: const SizedBox(),
                onChanged: (String? newValue) {
                  // Handle dropdown value change
                   setState(() {
                        pricing = newValue!;
                        if ("All Courses" == pricing) {
                          selectedCategories = categoryList;
                         

                          // selectedKeywords = [];
                        }
                        loadFuture();
                      });
                },
                items:
                    pricingFilter.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: constants.w400,
                        fontSize: 16,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          child: Row(
            children: [
              DropdownButton<String>(
                underline: const SizedBox(),
                icon: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'xCourse Category',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: constants.w400,
                          fontSize: 18,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ]),
                // value: 'Option A',
                onChanged: (String? newValue) {
                   setState(() {
                         if (selectedCategories.contains(newValue)) {
                  selectedCategories.remove(newValue);
                } else {
                  selectedCategories.add(newValue);
                }
                setState(() {
                  loadFuture();
                });
                      });
                },
                items: categoryList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: constants.w400,
                        fontSize: 16,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  Rect _menuButtonRect(BuildContext context) {
    final RenderBox buttonBox = context.findRenderObject() as RenderBox;
    final Offset buttonOffset = buttonBox.localToGlobal(Offset.zero);
    return Rect.fromPoints(
      buttonOffset,
      buttonOffset + buttonBox.size.bottomRight(Offset.zero),
    );
  }
}
