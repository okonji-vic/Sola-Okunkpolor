import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../utils/global.dart';
import '../auth/login.dart';

class Logout extends StatefulWidget {
  Function(dynamic) navigateTo;

  Logout({super.key, required this.navigateTo});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      child: Container(
        width: double.maxFinite,
        height: screen.height - 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            margin: const EdgeInsets.only(
              right: 50,
              bottom: 50,
            ),
            height: 400,
            width: 700,
            child: Material(
              elevation: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "./assets/images/logout.png",
                    height: 160,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Are you sure you want to log out of your account?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: constants.lightPurple,
                            ),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Yes",
                            style: TextStyle(
                              color: constants.lightPurple,
                              fontSize: constants.fontsize16,
                            ),
                          ),
                        ),
                        onPressed: () {
                          getX.erase();
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => DesktopLogin()),
                              (route) => false);
                        },
                      ),
                      const SizedBox(width: 50),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(constants.lightPurple),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          child: Text(
                            "No",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: constants.fontsize14,
                            ),
                          ),
                        ),
                        onPressed: () {
                          widget.navigateTo(
                            {
                              'page':'courses'
                            }
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool loading = false;
}
