import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/global.dart';

String blogEndpoint = "/user_blog";

Future<dynamic> viewBlogs() async {
  http.Client client = http.Client();

    http.Response response =
        await client.post(Uri.https(httpBaseUrl, '$blogEndpoint/view_blogs'),
            body: json.encode({
              //  "token": getX.read(v.TOKEN),
            }),
            headers: {"Content-Type": "application/json"});

    dynamic decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    return decodedResponse;

}

Future<dynamic> viewFilterBlog(String pricing,List categories,List keywords) async {
  http.Client client = http.Client();

  http.Response response = await client
      .post(Uri.https(httpBaseUrl, '$blogEndpoint/view_filter_blogs'),
          body: json.encode({
            // "token": getX.read(v.TOKEN),
            "pricing":pricing,
            "categories":categories,
            "keywords":keywords,
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}



Future<dynamic> viewBlogCategories() async {
  http.Client client = http.Client();

  http.Response response =
      await client.post(Uri.https(httpBaseUrl, 'user_blog_categories/view_categories'),
          body: json.encode({
            //  "token": getX.read(v.TOKEN),
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}
Future<dynamic> viewBlogKeywords() async {
  http.Client client = http.Client();

  http.Response response =
      await client.post(Uri.https(httpBaseUrl, 'user_blog_keywords/view_keywords'),
          body: json.encode({
            //  "token": getX.read(v.TOKEN),
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}

