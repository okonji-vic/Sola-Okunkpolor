// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sola_web/screens/Desktop/auth/login.dart';
import 'package:sola_web/screens/footer.dart';
import 'package:sola_web/main.dart';

import '../../../api_service/auth_api.dart';
import '../../../utils/global.dart';

class DesktopSignUp extends StatefulWidget {
  const DesktopSignUp({Key? key}) : super(key: key);

  @override
  _DesktopSignUpState createState() => _DesktopSignUpState();
}

class _DesktopSignUpState extends State<DesktopSignUp> {
  int loadingState = 0;
  String _fullname = '';
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
          myWidgets.title(width: screen.width, tab: "auth", show_divider: true),
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
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: constants.fontsize30,
                        fontFamily: "Sen",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 15),
                      height: 5,
                      color: constants.yellow,
                      // color: Color.fromRGBO(182, 5, 5, 1),
                      width: 100,
                    ),
                    Text(
                      "Create an account to take a course(s)",
                      style: TextStyle(
                        fontSize: constants.fontsize18,
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
                      child: Text("Full Name", style: _myTextStyle),
                    ),
                    TextField(
                      onChanged: (val) {
                        _fullname = val;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: _myDecoration,
                      enabled: loadingState == 0 ? true : false,
                    ),
                  ],
                ),

                _sizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      child: Text("Email address", style: _myTextStyle),
                    ),
                    TextField(
                      onChanged: (val) {
                        _email = val;
                      },
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: _myDecoration,
                      enabled: loadingState == 0 ? true : false,
                    ),
                  ],
                ),

                _sizedBox,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      child: Text("Password", style: _myTextStyle),
                    ),
                    TextField(
                      onChanged: (val) {
                        _password = val;
                      },
                      textInputAction: TextInputAction.done,
                      obscureText: obscureText,
                      decoration: _myDecoration.copyWith(
                          suffixIcon: IconButton(
                        icon: obscureText
                            ? Icon(Icons.visibility_outlined)
                            : Icon(Icons.visibility_off_outlined),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      )),
                      enabled: loadingState == 0 ? true : false,
                    ),
                  ],
                ),

                // CupertinoButton(
                //   child: Text(
                //     "Forgot password?",
                //     style: _myTextStyle,
                //   ),
                //   onPressed: () {
                //     Navigator.push(
                //         context, MaterialPageRoute(builder: (_) => Material()));
                //   },
                // ),

                SizedBox(height: 50),

                SizedBox(
                  height: 45,
                  child: ElevatedButton(
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
                            if (_fullname.isEmpty &&
                                _email.isEmpty &&
                                _password.isEmpty) {
                              helperWidgets
                                  .showToast('All fields must be filled');
                              return;
                            }
                            setState(() {
                              loadingState = 1;
                            });
                            signupRequest();
                            // dynamic result =
                            //     await loginRequest(_email.trim(), _password);
                          }
                        : null,
                    child: buildButtonChild(),
                  ),
                ),


             
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Have an Account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    CupertinoButton(
                      child: Text(
                        "Sign In",
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
                            builder: (_) => DesktopLogin(),
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
        "Sign Up",
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

  signupRequest() async {
    try {
      var res = await createAccount(_fullname, _email, _password);
      debugPrint(res.toString());
      if (res['msg'] == 'success') {
        _saveLocally(res);
        Navigator.of(context).pushNamed(route.userAccountControl);
      } else {
        helperWidgets.showToast(
          "An error occured while trying to sign up. Please try again",
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

  _saveLocally(dynamic tempData) {
    getX.write(v.TOKEN, tempData[v.TOKEN]);
    Map<String, dynamic> data = tempData['user'];
    getX.write(v.LOGGED_IN, true);
    // getX.write(v.IS_ONLINE, true);
    getX.write(v.USER_ID, data[v.USER_ID]);
    getX.write(v.FULLNAME, data[v.FULLNAME]);
    getX.write(v.EMAIL, data[v.EMAIL]);
    getX.write(v.USER_IMAGE, data[v.USER_IMAGE]);
    getX.write(v.PHONE, data[v.PHONE]);
  }

  showMyDialog(String message) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setCustomState) {
            return CupertinoAlertDialog(
              title: Text(
                'Log in failed',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Sen"),
              ),
              content: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(message,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Sen",
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Try again',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Sen")),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                // TextButton(
                //   child: Text('Forgot Password?', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "Sen")),
                //   onPressed: () {
                //     Navigator.pop(context);
                //     Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgotPassword()));
                //   },
                // ),
              ],
            );
          },
        );
      },
    );
  }
}
