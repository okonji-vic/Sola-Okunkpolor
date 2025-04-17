import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/global.dart';

String endpoint = "/user_gallery";

Future<dynamic> viewGallery() async {
  http.Client client = http.Client();

    http.Response response =
        await client.post(Uri.https(httpBaseUrl, '$endpoint/view_gallery'),
            body: json.encode({
              //  "token": getX.read(v.TOKEN),
            }),

            headers: {"Content-Type": "application/json"});

    dynamic decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    return decodedResponse;

}