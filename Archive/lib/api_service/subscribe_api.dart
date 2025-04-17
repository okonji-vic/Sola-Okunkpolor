import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/global.dart';


Future<dynamic> subscribeNewsletter(String email) async {
  http.Client client = http.Client();

  http.Response response = await client
      .post(Uri.https(httpBaseUrl, 'user_subscribe/subscribe'),
          body: json.encode({
            "email": email,
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}
