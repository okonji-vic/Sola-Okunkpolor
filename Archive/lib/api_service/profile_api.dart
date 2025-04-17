import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../../utils/global.dart';

String profileEndpoint = "user_profile";


Future<dynamic> editProfile(dynamic formData) async {
  Response response;
  Dio dio = Dio();

  String endpoint = "/$profileEndpoint/edit_profile";

  response = await dio.post(
    "$dioBaseUrl$endpoint",
    data: formData,
    options: Options(method: "POST", responseType: ResponseType.json, headers: {
      "Authorization": getX.read(v.TOKEN),
      "Content-Type": "multipart/form-data",
    }),
  );

  return response.data;
}