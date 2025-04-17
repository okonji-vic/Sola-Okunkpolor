import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/global.dart';
import 'package:dio/dio.dart';

String promotionalEndpoint = "user_promotional";

Future<dynamic> viewPromotionalVideo() async {
  http.Client client = http.Client();

  http.Response response = await client.post(
      Uri.https(httpBaseUrl, '/$promotionalEndpoint/view_promotional_video'),
      body: json.encode({
        // "token": getX.read(v.TOKEN),
      }),
      headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
}