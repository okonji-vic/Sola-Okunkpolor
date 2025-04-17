import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/global.dart';

Future<dynamic> checkConversations() async {
  http.Client client = http.Client();

  String endpoint = "/help_feedback/check_convers";

  http.Response response = await client.post(
    Uri.https(httpBaseUrl, endpoint),
    body: json.encode({
      v.TOKEN: getX.read(v.TOKEN),
      'sender_name': getX.read(v.FULLNAME),
      'sender_img':
          getX.read(v.USER_IMAGE).isEmpty ? "a" : getX.read(v.USER_IMAGE),
      // 'receiver_name': receiverName,
      // 'receiver_img': receiverImg,
      // 'receiver_id': receiverID,
      'target': 'admin',
      'day': DateTime.now().day,
      'month': DateTime.now().month - 1,
      'year': DateTime.now().year,
    }),
    headers: {"Content-Type": "application/json"},
  );

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
}

Future<dynamic> getMessages(String conversationID) async {
  http.Client client = http.Client();

  String endpoint = "/help_feedback/get_messages";

  http.Response response = await client.post(
    Uri.https(httpBaseUrl, endpoint),
    body: json.encode(
        {v.TOKEN: getX.read(v.TOKEN), "conversation_id": conversationID}),
    headers: {"Content-Type": "application/json"},
  );

  dynamic decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
}
