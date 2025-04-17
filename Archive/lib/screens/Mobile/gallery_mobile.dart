import 'package:flutter/material.dart';

import '../../api_service/gallery_api.dart';
import '../../main.dart';
import '../../utils/global.dart';
import '../footer.dart';

class MobileGallery extends StatefulWidget {
  const MobileGallery({super.key});

  @override
  State<MobileGallery> createState() => _MobileGalleryState();
}

class _MobileGalleryState extends State<MobileGallery> {
  List<dynamic> _future_list = [];
  Future<dynamic>? _futureData;
  @override
  void initState() {
    loadFuture();
    super.initState();
  }

  loadFuture() {
    _futureData = viewGallery();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        myMobileWidgets.title(width: screen.width, tab: "gallery"),
        const SizedBox(height: 40),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "DR. SOLA'S PHOTO GALLERY",
              style: TextStyle(
                fontSize: constants.fontsize18,
                fontFamily: constants.w700,
                color: Colors.black,
              ),
            ),
            Container(
              height: 1.5,
              margin: const EdgeInsets.only(top: 10),
              color: constants.yellow,
              // color: Color.fromRGBO(182, 5, 5, 1),
              width: 150,
            ),
          ],
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                height: 400,
                width: screen.width - 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 4,
                    color: const Color.fromRGBO(213, 212, 212, 1),
                  ),
                ),
                child: Image.asset(
                  "assets/images/gallery.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: const Color.fromRGBO(245, 239, 249, 1),
                padding: const EdgeInsets.fromLTRB(35, 30, 35, 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "I'm Dr. Sola Okunkpolor and I believe that everyone has the capacity to achieve greatness.",
                      style: TextStyle(
                        fontSize: constants.fontsize18,
                        fontFamily: constants.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Welcome to my photo gallery! As a coach, my goal is to empower individuals and groups to unlock their full potential and achieve their goals. The photos in this gallery capture the powerful moments of transformation that my coaching programs inspire.\n\nFrom one-on-one coaching sessions to group workshops and seminars, I am passionate about helping my clients develop the skills, knowledge, and mindset they need to live their best lives. I believe that everyone has the capacity to achieve greatness, and the photos in this gallery capture the energy, enthusiasm, and sense of accomplishment that are hallmarks of my coaching programs.\n\nSo take a moment to explore my photo gallery and see the impact that coaching can have. I hope these photos inspire you to take the first step toward unlocking your own full potential.",
                      style: TextStyle(
                        fontSize: constants.fontsize16,
                        fontFamily: constants.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        FutureBuilder<dynamic>(
          future: _futureData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              print('>>>>>>>>>>>>>>>>>>>>>>> CHECKING... ${snapshot.data} ');
              if (snapshot.hasError) {
                // NO INTERNET CONNECTION
                return const Center(
                  child: Text("No internet connection. Please try again"),
                );
              } else if (snapshot.hasData) {
                //main widget here

                // dynamic adminsList = snapshot.data;
                if (snapshot.data["status"] == "ok") {
                  // news = courses["articles"];
                  // print('>>>>>>>>>>>>>>>>>>>>>>> ${snapshot.data}');

                  if (snapshot.data["gallery"] != null) {
                    _future_list = snapshot.data["gallery"]['img_urls'];
                  } else {
                    _future_list = [];
                  }

                  if (_future_list.isEmpty) {
                    return const Center(
                      child: Text(
                        'No image found',
                        style: TextStyle(
                          // fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    );
                  } else {
                    // admins_count = snapshot.data['total_count'];
                    return Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 15,
                      spacing: 15,
                      children: List.generate(_future_list.length, (index) {
                        return Center(
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 10,
                                  color: const Color.fromRGBO(255, 232, 176, 1),
                                ),
                              ),
                              child: helperWidgets.build_cached_image(
                                _future_list[index],
                                height: 300,
                                width: 300,
                              )),
                        );
                      }),
                    );

                    //  GridView.builder(
                    //   padding: const EdgeInsets.symmetric(horizontal: 50),
                    //   shrinkWrap: true,
                    //   itemCount: 15, // Change this to your actual item count
                    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 3,
                    //     crossAxisSpacing: 25.0,
                    //     mainAxisSpacing: 25.0,
                    //   ),
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return Container(
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //           width: 10,
                    //           color: const Color.fromRGBO(255, 232, 176, 1),
                    //         ),
                    //       ),
                    //       child: Image.asset(
                    //         "assets/images/gal${index + 1}.png",
                    //         fit: BoxFit.cover,
                    //       ),
                    //     );
                    //   },
                    // ),
                  }
                } else {
                  // //print('>>>>>>>>>>>>>>>>>>>>>>> AN ERROR OCCURED ');

                  return const Center(
                    child: Text("An unknown error occured"),
                  );
                }
              } else {
                return const Center(
                  child: Text("A server error occured"),
                );
              }
            } else {
              return const Center(
                child: Text("A server error occured"),
              );
            }
          },
        ),
        const SizedBox(height: 40),
        const Footer(),
      ],
    ));
  }
}
