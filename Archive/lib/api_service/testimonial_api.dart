import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/global.dart';

String testimonialEndpoint = "/user_testimonial";

Future<dynamic> viewTestimonials() async {
  http.Client client = http.Client();

    http.Response response =
        await client.post(Uri.https(httpBaseUrl, '$testimonialEndpoint/view_testimonials'),
            body: json.encode({
              //  "token": getX.read(v.TOKEN),
            }),

            headers: {"Content-Type": "application/json"});

    dynamic decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    return decodedResponse;

}