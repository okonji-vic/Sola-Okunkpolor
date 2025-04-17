// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sola_web/Screens/Mobile/Auth/login.dart';
import 'package:sola_web/screens/Desktop/auth/signup.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';

import '../../../api_service/auth_api.dart';
import '../../../screens/Mobile/auth/signup.dart';
import '../../../utils/global.dart';

class MobileForgotPassword extends StatefulWidget {
  const MobileForgotPassword({Key? key}) : super(key: key);

  @override
  _MobileForgotPasswordState createState() => _MobileForgotPasswordState();
}

class _MobileForgotPasswordState extends State<MobileForgotPassword> {
  int loadingState = 0;
  String _email = '';
  String _password = '';
  bool obscureText = true;

  final SizedBox _sizedBox = SizedBox(height: 30);

  // Constants myColor = Constants();

  final InputDecoration _myDecoration = InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      border: OutlineInputBorder());

  final TextStyle _myTextStyle = TextStyle(
    fontSize: 14,
    // fontFamily: "Sen",
    color: Colors.black87,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          myMobileWidgets.title(width: screen.width, tab: "auth", show_divider: true),
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screen.width * 0.15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(
                        fontSize: constants.fontsize22,
                        fontFamily: "Sen",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 15),
                      height: 3.5,
                      color: constants.yellow,
                      // color: Color.fromRGBO(182, 5, 5, 1),
                      width: 70,
                    ),
                    Text(
                      "Enter your email address and we will send you a link to reset your password.",
                      style: TextStyle(
                        fontSize: constants.fontsize14,
                        fontFamily: constants.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      child: Text("Email",
                          style: _myTextStyle),
                    ),
                    TextField(
                      onChanged: (val) {
                        _email = val;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: _myDecoration,
                      enabled: loadingState == 0 ? true : false,
                    ),
                  ],
                ),

        

            

           

                SizedBox(height: 50),

                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    child: buildButtonChild(),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(constants.yellow),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onPressed: loadingState == 0
                        ? () async {
                            if ( _email.isEmpty ) {
                              helperWidgets
                                  .showToast('All fields must be filled');
                              return;
                            }
                            setState(() {
                              loadingState = 1;
                            });
                            forgotPasswordRequest();     
                          }
                        : null,
                  ),
                ),

            

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Back to",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    CupertinoButton(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: constants.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            letterSpacing: 1.5),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MobileLogin(),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: 50),
              ],
            ),
          ),
          Footer(),
        ],
      ),
    );
  }

  Widget buildButtonChild() {
    if (loadingState == 0) {
      return Text(
        "Sign In",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      );
    } else if (loadingState == 1) {
      return SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(color: Colors.white));
    } else {
      return SizedBox(
          height: 20,
          width: 20,
          child: Icon(Icons.check_rounded, color: Colors.white));
    }
  }


forgotPasswordRequest() async {
    try {
      var res = await forgotPassword(_email);
      debugPrint(res.toString());
      if (res['msg'] == 'Password reset email sent, please check your email') {
        helperWidgets.showToast(
          "Password reset email sent, please check your email",
        );
      } else if (res['msg'] == 'Please enter a valid email') {
        helperWidgets.showToast(
          "Please enter a valid email",
          leading: const Icon(
            Icons.error,
          ),
        );
      } else if (res['msg'] == 'There is no user account with this email') {
        helperWidgets.showToast(
          "There is no user account with this email",
          leading: const Icon(
            Icons.error,
          ),
        );
      } else if (res['msg'] == 'Email not sent') {
        helperWidgets.showToast(
          "Email not sent",
          leading: const Icon(
            Icons.error,
          ),
        );
      } else {
        helperWidgets.showToast(
          "An error occured while trying to send email. Please try again",
          leading: const Icon(
            Icons.error,
          ),
        );
      }
    } catch (e) {
      myHttpErrorHandler(e);
    } finally {
      setState(() {
        loadingState = 0;
      });
    }
  }



}
