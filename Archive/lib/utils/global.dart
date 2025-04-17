import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:intl/intl.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/utils/timeManager.dart';

import 'constants.dart';
import 'helper_widgets.dart';
import 'routes.dart';
import 'variable.dart';

String httpBaseUrl = "server-sola.onrender.com";
String dioBaseUrl = "https://server-sola.onrender.com";

String instagramHandle ="https://www.instagram.com/ourladyofhope__benin?igsh=MzRlODBiNWFlZA==";

String facebookHandle ="https://www.facebook.com/olusola.okunkpolor?mibextid=ZbWKwL";

String linkedinHandle ="https://www.linkedin.com/in/dr-sola-okunkpolor-fpmc-a18791100";

String tiktokHandle = "https://www.tiktok.com/@iamsolaokunkpolor?_t=8mAsweYjlw6&_r=1";

// Constants constants = Constants();
HelperWidget helperWidgets = HelperWidget();
final getX = GetStorage();
// Routes route = Routes();
Variables v = Variables();
TimeManager timeManager = TimeManager();


Color black_text_color = const Color.fromRGBO(34, 34, 34, 1);
Color grey_text_color = const Color.fromRGBO(93, 93, 93, 1);

Color primaryColor = const Color.fromRGBO(255, 153, 0, 1);
Color light_orange = const Color.fromRGBO(255, 153, 0, 0.15);
Color background_color = const Color.fromRGBO(249, 251, 252, 1);

String? thousandFormat(String figures) {
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  // NumberFormat numberFormat = NumberFormat("#,##0.00", "en_US");
  try {
    double fig = double.parse(figures);
    // print(myFormat.format(fig));
    return myFormat.format(fig);
  } on FormatException {
    // print(myFormat.format(fig));
    return "...";
  }

  
}


String capitalizeFirstLetter(String text) {
  if (text.isEmpty) {
    return text; // Return the text string if it's empty
  }
  return text[0].toUpperCase() + text.substring(1);
}

myDioErrorHandler(dynamic e, {bool for_chatting = false}) {
  print('---------ERROR---------> ${e.error}');
  print('---------ERROR---------> ${e.message}');
  print('---------ERROR---------> ${e.response}');
  if (e.error is SocketException) {
    helperWidgets.showToast("Check your internet connection & try again");
  } else if (e.error == "Http status error [413]") {
    helperWidgets.showToast("File size too large");
    // widgets_d.showToast("File shouldn't be more than 10mb");
  } else {
    if (for_chatting) {
      //the behaviour is unpredictable while chatting or in channels, we don't want it disturbing the UX
      // widgets_d.showToast("Message could not be sent. Try again");
    } else {
      helperWidgets.showToast("oOops! An error occured. Please try again later");
    }
  }
}

myHttpErrorHandler(var e) {
  print('-----------------> $e');
  if (e is SocketException) {
    helperWidgets.showToast("Check your internet connection & try again");
  } else {
    helperWidgets.showToast("oOps! An error occured");
  }
}


