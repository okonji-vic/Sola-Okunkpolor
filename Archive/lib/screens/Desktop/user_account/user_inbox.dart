import 'package:flutter/material.dart';

import '../../../api_service/inbox_api.dart';
import '../../../main.dart';
import '../../../utils/global.dart';

class UserInbox extends StatefulWidget {
  const UserInbox({super.key});

  @override
  State<UserInbox> createState() => _UserInboxState();
}

class _UserInboxState extends State<UserInbox> {
  List<dynamic> _future_list = [];
  Future<dynamic>? _futureData;

  @override
  void initState() {
    loadFuture();
    super.initState();
  }

  loadFuture() {
    _futureData = viewUserInbox();
  }

  bool isLoading = false;

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
            'My Inbox',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: constants.fontsize32,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
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

                    if (snapshot.data["notifications"] != null) {
                      _future_list = snapshot.data["notifications"];
                    }

                    if (_future_list.isEmpty) {
                      return emptyState();
                    } else {
                      // admins_count = snapshot.data['total_count'];
                      return Column(
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runSpacing: 40,
                            spacing: 40,
                            children:
                                List.generate(_future_list.length, (index) {
                              return buildInbox(_future_list[index]);
                            }),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              height: 40,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 10),
                                    side: BorderSide(
                                      color: constants.lightPurple,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                    )),
                                onPressed: isLoading
                                    ? null
                                    : () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        try {
                                          var res = await clearUserInbox();
                                          print(res);
                                          if (res['msg'] == 'success') {
                                            helperWidgets.showToast(
                                              "Inbox cleared successfully",
                                              leading: const Icon(
                                                Icons.check_circle,
                                                color: Colors.white,
                                              ),
                                            );

                                            setState(() {
                                              loadFuture();
                                            });
                                          } else {
                                            helperWidgets.showToast(
                                                'Oops something went wrong. Try again later');
                                          }
                                        } catch (e) {
                                          print(e);
                                          myHttpErrorHandler(e);
                                        } finally {
                                          setState(() {
                                            isLoading = false;
                                          });
                                        }
                                      },
                                // shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(6)),
                                child: isLoading
                                    ? SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          color: constants.lightPurple,
                                        ))
                                    : Text(
                                        "CLEAR ALL",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: constants.w400,
                                          color: constants.lightPurple,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
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
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget buildInbox(var notificationData) {
    return Container(
      // color: ,
      // width: 320,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: constants.yellow,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${notificationData['event']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${notificationData['message']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                timeManager.date_from_timestamp(notificationData['timestamp']),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                timeManager.time_from_timestamp(notificationData['timestamp']),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
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
              "assets/images/no_inbox.png",

              // fit: BoxFit.cover,

              height: 400,

              // width: 0,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You have no Messages. Please check\n back later',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
