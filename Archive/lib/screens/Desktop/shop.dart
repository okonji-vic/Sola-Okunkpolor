import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sola_web/screens/Desktop/view_shop_product.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/utils/functions.dart';

import '../../utils/my_widgets.dart/course_widgets.dart';
import '../../utils/my_widgets.dart/testimonial_widgets.dart';

class DesktopShopPage extends StatefulWidget {
  const DesktopShopPage({super.key});

  @override
  State<DesktopShopPage> createState() => _DesktopShopPageState();
}

class _DesktopShopPageState extends State<DesktopShopPage> {
  List<String> categories = [
    "All",
    "Audio Resources",
    "Video Resources",
    "Books",
    "PDF/Other Resources",
  ];

  String category_selection = "All";
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            myWidgets.title(width: screen.width, tab: "shop"),
            SizedBox(
              width: screen.width,
              height: screen.height - 100,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/shop1.webp",
                          fit: BoxFit.cover,
                          height: double.maxFinite,
                          width: double.maxFinite,
                        ),
                        Positioned(
                          top: 15,
                          left: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            color: const Color.fromRGBO(182, 5, 5, 1),
                            child: const Text(
                              "Featured Products",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        build_stack(
                          bottom_positioned: 35,
                          left_positioned: 60,
                          title: "Centering your Mind",
                          desc:
                              "Some of the key components of school\nreadiness include exposure to\nlanguage and literacy",
                          slashed_price: '₦16,700',
                          price: '₦9,900',
                          main_pic: true,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/shop2.webp",
                                fit: BoxFit.cover,
                                height: double.maxFinite,
                                width: double.maxFinite,
                              ),
                              build_stack(
                                bottom_positioned: 35,
                                left_positioned: 60,
                                title: "School Readiness Audio",
                                desc:
                                    "Some of the key components of school\nreadiness include exposure to\nlanguage and literacy",
                                slashed_price: '₦16,700',
                                price: '₦9,000',
                                main_pic: false,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/shop3.webp",
                                fit: BoxFit.cover,
                                height: double.maxFinite,
                                width: double.maxFinite,
                              ),
                              build_stack(
                                bottom_positioned: 35,
                                left_positioned: 60,
                                title: "Beating procrastination series",
                                desc:
                                    "Some of the key components of school\nreadiness include exposure to\nlanguage and literacy",
                                slashed_price: '₦16,700',
                                price: '₦9,000',
                                main_pic: false,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "CATEGORIES",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: constants.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 3.5,
                    color: constants.yellow,
                    // color: Color.fromRGBO(182, 5, 5, 1),
                    width: 150,
                  ),
                  const SizedBox(height: 50),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      Container(
                        height: 70,
                        width: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        color: const Color.fromRGBO(244, 244, 244, 1),
                        alignment: Alignment.center,
                        child: Text(
                          "All",
                          style: TextStyle(
                            fontSize: constants.fontsize20,
                            fontFamily: constants.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 270,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        color: const Color.fromRGBO(244, 244, 244, 1),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/shop_audio.png",
                                height: 25),
                            const SizedBox(width: 10),
                            Text(
                              "Audio Resourses",
                              style: TextStyle(
                                fontSize: constants.fontsize20,
                                fontFamily: constants.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 250,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        color: const Color.fromRGBO(244, 244, 244, 1),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/shop_video.png",
                                height: 25),
                            const SizedBox(width: 10),
                            Text(
                              "Video Resourses",
                              style: TextStyle(
                                fontSize: constants.fontsize20,
                                fontFamily: constants.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 150,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        color: const Color.fromRGBO(244, 244, 244, 1),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/shop_book.png",
                                height: 25),
                            const SizedBox(width: 10),
                            Text(
                              "Books",
                              style: TextStyle(
                                fontSize: constants.fontsize20,
                                fontFamily: constants.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 300,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        color: const Color.fromRGBO(244, 244, 244, 1),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/shop_pdf.png",
                                height: 25),
                            const SizedBox(width: 10),
                            Text(
                              "PDF/Other Resources",
                              style: TextStyle(
                                fontSize: constants.fontsize20,
                                fontFamily: constants.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  LayoutBuilder(builder: (context, constraints) {
                    int columns = (constraints.maxWidth / 400)
                        .floor(); // Adjust 300 based on your item width
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10.0),
                      itemCount: db.shopList["shop"].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          mainAxisSpacing: 25,
                          crossAxisSpacing: 25,
                          mainAxisExtent: 700
                          // childAspectRatio: 0.9,
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ViewShopProduct()));
                          },
                          child: myWidgets.buildShop(
                              resp: db.shopList["shop"][index]),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
            PopularCourses(),
            TestimonialsWidget(),
            myWidgets.mailingList(width: screen.width),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Positioned build_stack({
    required double bottom_positioned,
    required double left_positioned,
    required String title,
    required String desc,
    required String slashed_price,
    required String price,
    required bool main_pic,
  }) {
    double mainTitleFont =
        main_pic ? constants.fontsize32 : constants.fontsize24;
    double subFont = main_pic ? constants.fontsize22 : constants.fontsize16;
    return Positioned(
      bottom: bottom_positioned,
      left: left_positioned,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: mainTitleFont,
              fontFamily: constants.w500,
              color: Colors.white,
            ),
          ),
          Text(
            desc,
            style: TextStyle(
              color: Colors.white,
              fontSize: subFont,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    // style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: slashed_price,
                        style: TextStyle(
                          fontFamily: constants.w500,
                          fontSize: subFont,
                          color: const Color.fromRGBO(240, 42, 42, 1),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: subFont,
                    color: const Color.fromRGBO(255, 153, 0, 1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: main_pic ? 30 : 10),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(255, 153, 0, 1),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: main_pic ? 12.0 : 6.0),
              child: Text(
                "BUY NOW",
                style: TextStyle(
                    fontSize: main_pic ? 18 : 14, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
