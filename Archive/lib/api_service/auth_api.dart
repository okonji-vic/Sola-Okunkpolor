import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/global.dart';

String authEndpoint = "/user_auth";

Future<dynamic> createAccount(String fullname, String email, String password) async {
  http.Client client = http.Client();

  try {
    http.Response response =
        await client.post(Uri.https(httpBaseUrl, '$authEndpoint/signup'),
            body: json.encode({
              "fullname": fullname,
              "email": email,
              "password": password,
            }),
            headers: {"Content-Type": "application/json"});

    dynamic decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    return decodedResponse;
  } catch (e) {
    debugPrint(e.toString());
  }
}
Future<dynamic> loginAccount(String email, String password) async {
  http.Client client = http.Client();

  try {
    http.Response response =
        await client.post(Uri.https(httpBaseUrl, '$authEndpoint/login'),
            body: json.encode({
              "email": email,
              "password": password,
            }),
            headers: {"Content-Type": "application/json"});

    dynamic decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    return decodedResponse;
  } catch (e) {
    debugPrint(e.toString());
  }
}

Future<dynamic> changePassword(String oldPassword, String newPassword) async {
  http.Client client = http.Client();

  http.Response response = await client
      .post(Uri.https(httpBaseUrl, '$authEndpoint/change_password_web'),
          body: json.encode({
            "token": getX.read(v.TOKEN),
            "old_password": oldPassword,
            "new_password": newPassword,
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
}

Future<dynamic> forgotPassword(String email) async {
  http.Client client = http.Client();

  http.Response response =
      await client.post(Uri.https(httpBaseUrl, '$authEndpoint/forgot_password'),
          body: json.encode({
            "email": email,
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
}
