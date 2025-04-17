import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../../api_service/promotional_video_api.dart';
import '../../main.dart';
import '../global.dart';

class PromotionalVideo extends StatefulWidget {
  bool isSmallScreen;
  PromotionalVideo({super.key, this.isSmallScreen = false});

  @override
  State<PromotionalVideo> createState() => _PromotionalVideoState();
}

class _PromotionalVideoState extends State<PromotionalVideo> {
  var promotionalVideo;

  loadPromotionalVideo() async {
    try {
      var res = await viewPromotionalVideo();
      debugPrint(res.toString());
      if (res['msg'] == 'success') {
        setState(() {
          promotionalVideo = res['promotional_video'];
        });
      }
    } catch (e) {
      myHttpErrorHandler(e);
    }
  }

  @override
  initState() {
    // setupVideo();
    super.initState();
    loadPromotionalVideo();
  }

  @override
  Widget build(BuildContext context) {
    return promotionalVideo == null
        ? const SizedBox()
        : Padding(
            padding: widget.isSmallScreen
                ? const EdgeInsets.fromLTRB(0, 40, 0, 40)
                : const EdgeInsets.fromLTRB(90, 90, 90, 40),
            child: InkWell(
              onTap: () {
                html.window.open(promotionalVideo['video_link'], 'new tab');
              },
              child: Stack(
                  alignment: widget.isSmallScreen
                      ? Alignment.bottomCenter
                      : Alignment.centerLeft,
                  children: [
                    helperWidgets.build_cached_image(
                        "${promotionalVideo['thumbnail_img_url']}",
                        height: 600,
                        width: MediaQuery.of(context).size.width),
                    Container(
                      height: 600,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    widget.isSmallScreen
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      "assets/images/youtube.png",
                                      fit: BoxFit.cover,
                                      width: 110,
                                      height: 65,
                                    ),
                                  ),
                                  // Spacer(),
                                  const SizedBox(
                                    height: 150,
                                  ),
                                  Text(
                                    "${promotionalVideo['video_title']}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: constants.w600,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "${promotionalVideo['video_subtitle']}",
                                    style: TextStyle(
                                      color: constants.yellow,
                                      fontFamily: constants.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                ]),
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${promotionalVideo['video_title']}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: constants.w600,
                                            fontSize: 42,
                                            height: 1.1,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${promotionalVideo['video_subtitle']}",
                                          style: TextStyle(
                                            color: constants.yellow,
                                            fontFamily: constants.w600,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Image.asset(
                                    "assets/images/youtube.png",
                                    fit: BoxFit.cover,
                                    width: 110,
                                    height: 65,
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ]),
            ),
          );
  }
}
