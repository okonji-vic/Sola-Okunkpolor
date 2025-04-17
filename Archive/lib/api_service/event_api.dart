import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/global.dart';

String eventEndpoint = "/user_event";

Future<dynamic> viewUserEvents() async {
  http.Client client = http.Client();

  http.Response response = await client
      .post(Uri.https(httpBaseUrl, '$eventEndpoint/view_user_events'),
          body: json.encode({
            "token": getX.read(v.TOKEN),
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}
