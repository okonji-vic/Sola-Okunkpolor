import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/global.dart';

String paymentEndpoint = "/user_payment";

Future<dynamic> makePayment(List eventIDs, int amount, String event) async {
  http.Client client = http.Client();

  debugPrint("${{
    "token": getX.read(v.TOKEN),
    "event_ids": eventIDs,
    "amount": amount,
    "fullname": getX.read(v.FULLNAME),
    "phone_no": getX.read(v.PHONE),
    "event": event,
    "email": getX.read(v.EMAIL),
  }}");

  http.Response response =
      await client.post(Uri.https(httpBaseUrl, '$paymentEndpoint/make_payment'),
          body: json.encode({
            "token": getX.read(v.TOKEN),
            "event_ids": eventIDs,
            "amount": amount,
            "fullname": getX.read(v.FULLNAME),
            "phone_no": getX.read(v.PHONE).isEmpty ? "080" : getX.read(v.PHONE),
            "event": event,
            "email": getX.read(v.EMAIL),
          }),
          headers: {"Content-Type": "application/json"});

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}
