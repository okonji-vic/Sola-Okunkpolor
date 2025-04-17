import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/global.dart';

String endpoint = "/user_notification";

Future<dynamic> viewUserInbox() async {
  http.Client client = http.Client();

  http.Response response = await client
      .post(Uri.https(httpBaseUrl, '$endpoint/view_notifications'),
          body: json.encode({
            "token": getX.read(v.TOKEN),
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}
Future<dynamic> clearUserInbox() async {
  http.Client client = http.Client();

  http.Response response = await client
      .post(Uri.https(httpBaseUrl, '$endpoint/clear_notifications'),
          body: json.encode({
            "token": getX.read(v.TOKEN),
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}
