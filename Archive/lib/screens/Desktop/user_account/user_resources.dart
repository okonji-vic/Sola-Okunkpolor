import 'package:flutter/material.dart';

import '../../../api_service/order_api.dart';
import '../../../main.dart';
import '../../../utils/global.dart';
import 'dart:html' as html;


class UserResources extends StatefulWidget {
  bool isSmallScreen;
  UserResources({super.key, required this.isSmallScreen});

  @override
  State<UserResources> createState() => _UserResourcesState();
}

class _UserResourcesState extends State<UserResources> {
  List<dynamic> _future_list = [];
  Future<dynamic>? _futureData;

  @override
  void initState() {
    loadFuture();
    super.initState();
  }

  loadFuture() {
    _futureData = viewUserOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'My Resources',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: constants.fontsize32,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // emptyState()

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

                    if (snapshot.data["orders"] != null) {
                      _future_list = snapshot.data["orders"];
                    }

                    if (_future_list.isEmpty) {
                      return emptyState();
                    } else {
                      // admins_count = snapshot.data['total_count'];
                      return Wrap(
                        spacing: widget.isSmallScreen ? 20 : 40,
                        runSpacing: 40,
                        children: List.generate(_future_list.length, (index) {
                          return buildResource(_future_list[index]);
                        }),
                      );
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

          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget buildResource(dynamic orderData) {
    return SizedBox(
      width: widget.isSmallScreen ? 150 : 320,
      child: InkWell(
        onTap:(){
                              html.window.open(orderData['product_file_url'], 'new tab');

        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.asset(
            //   "assets/images/shop_item1.png",
            //   // fit: BoxFit.cover,
            //   height:
            //   // width: 320,
            // ),
            helperWidgets.build_cached_image(orderData["img_urls"][0],
                height: widget.isSmallScreen ? 130 : 300, width: null),
            // const SizedBox(
            //   height: 5,
            // ),
            Text(
              orderData["product_category"],
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(width: 50, child: Divider()),
            Text(
              orderData["product_name"],
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: widget.isSmallScreen ? 14 : 24,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              orderData["short_product_description"],
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_resource.png",

              // fit: BoxFit.cover,

              height: 400,

              // width: 0,
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                text: 'You have not acquired any resources. \nVisit the ',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: 'shop page ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: constants.lightPurple,
                    ),
                  ),
                  const TextSpan(
                    text: 'to access various resources',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
