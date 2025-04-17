import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/global.dart';

String orderEndpoint = "/user_order";

Future<dynamic> viewUserOrders() async {
  http.Client client = http.Client();

  http.Response response = await client
      .post(Uri.https(httpBaseUrl, '$orderEndpoint/view_user_orders'),
          body: json.encode({
            "token": getX.read(v.TOKEN),
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}
