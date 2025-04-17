import 'package:flutter/material.dart';

import '../../../api_service/event_api.dart';
import '../../../main.dart';
import '../../../utils/global.dart';

class UserEvents extends StatefulWidget {
  const UserEvents({super.key});

  @override
  State<UserEvents> createState() => _UserEventsState();
}

class _UserEventsState extends State<UserEvents> {
  List<dynamic> _future_list = [];
  Future<dynamic>? _futureData;

  @override
  void initState() {
    loadFuture();
    super.initState();
  }

  loadFuture() {
    _futureData = viewUserEvents();
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
            'My Events',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: constants.fontsize32,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // emptyState(),
          // Wrap(
          //   spacing: 40,
          //   runSpacing: 40,
          //   children: [

          //     buildEvent(),
          //     buildEvent(),
          //     buildEvent(),
          //   ],
          // ),
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

                    if (snapshot.data["events"] != null) {
                      _future_list = snapshot.data["events"];
                    }

                    if (_future_list.isEmpty) {
                      return emptyState();
                    } else {
                      // admins_count = snapshot.data['total_count'];
                      return Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: 15,
                        spacing: 15,
                        children: List.generate(_future_list.length, (index) {
                          return buildEvent(_future_list[index]);
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

  Widget buildEvent(dynamic eventData) {
    return Container(
      width: 320,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          helperWidgets.build_cached_image(
            eventData['img_url'],
            height: 300,
            width: null,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${eventData['date']}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: constants.lightPurple,
                      ),
                    ),
                    Text(
                      eventData['event_type'] == 'free'
                          ? 'FREE'
                          : 'N${thousandFormat(eventData['price'].toString())}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: eventData['event_type'] == 'free'
                            ? Colors.green
                            : constants.lightPurple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${eventData['event_name']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Venue: ${eventData['venue']}',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: constants.lightPurple,
                      ),
                    ),
                    Text(
                      '${eventData['time']}',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: constants.lightPurple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${eventData['description']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Meeting Link:',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: '  ${eventData['meeting_link']}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: constants.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget emptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_event.png",

              // fit: BoxFit.cover,

              height: 300,

              // width: 0,
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                text: 'You have not registered for any events. \nVisit the ',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: 'events page',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: constants.lightPurple,
                    ),
                  ),
                  const TextSpan(
                    text: ' to browse upcoming events ',
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
