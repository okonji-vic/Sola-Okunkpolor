import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/global.dart';

String courseEndpoint = "/user_course";

Future<dynamic> viewUserCourses() async {
  http.Client client = http.Client();

  http.Response response = await client
      .post(Uri.https(httpBaseUrl, '$courseEndpoint/view_user_courses'),
          body: json.encode({
            "token": getX.read(v.TOKEN),
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}
Future<dynamic> viewFilterCourses(String pricing,List categories,List keywords) async {
  http.Client client = http.Client();

  http.Response response = await client
      .post(Uri.https(httpBaseUrl, '$courseEndpoint/view_filter_courses'),
          body: json.encode({
            "token": getX.read(v.TOKEN),
            "pricing":pricing,
            "categories":categories,
            "keywords":keywords,
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}

Future<dynamic> registerCourses(String courseID) async {
  http.Client client = http.Client();

  debugPrint('${{
    "token": getX.read(v.TOKEN),
    "course_id": courseID,
  }}');

  http.Response response = await client
      .post(Uri.https(httpBaseUrl, '$courseEndpoint/register_course'),
          body: json.encode({
            "token": getX.read(v.TOKEN),
            "course_id": courseID,
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}

Future<dynamic> viewCourses() async {
  http.Client client = http.Client();

  http.Response response =
      await client.post(Uri.https(httpBaseUrl, '$courseEndpoint/view_courses'),
          body: json.encode({
            //  "token": getX.read(v.TOKEN),
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}



Future<dynamic> viewCourseCategories() async {
  http.Client client = http.Client();

  http.Response response =
      await client.post(Uri.https(httpBaseUrl, 'user_course_categories/view_categories'),
          body: json.encode({
            //  "token": getX.read(v.TOKEN),
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}
Future<dynamic> viewCourseKeywords() async {
  http.Client client = http.Client();

  http.Response response =
      await client.post(Uri.https(httpBaseUrl, 'user_course_keywords/view_keywords'),
          body: json.encode({
            //  "token": getX.read(v.TOKEN),
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}

