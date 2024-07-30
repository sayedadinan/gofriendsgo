import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:gofriendsgo/model/chat_models/fetch_messages_model.dart';
import 'package:gofriendsgo/services/api/app_apis.dart';

class FetchMessagesService {

  Future<http.Response?> sendMessageId(FetchMessagesRequest fetchMessageRequest,String token) async {
    final url = Uri.parse('${API.baseUrl}/fetchMessages');
    final headers = {
         'Authorization': 'Bearer $token',
         'Content-Type': 'application/json'
    };
    final body = jsonEncode(fetchMessageRequest.toJson());

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

     return response;
    } catch (error) {
      log('Error registering user: $error');
      return null;
    }
  }
 
 Future<FetchMessagesModel> fetchMessages(FetchMessagesRequest fetchMessageRequest,String token)async{
 
  try {
    
     final http.Response? response = await sendMessageId(fetchMessageRequest,token);
     if (response==null) {
       throw Exception('error while fetching messages');
     }else{
      if (response.statusCode==200) {
        final parsed = jsonDecode(response.body);
        return FetchMessagesModel.fromJson(parsed);

      }else{
        throw Exception("error in request ${response.statusCode}");
      }
     }
    
  } catch (e) {
    throw Exception("error while fetching messages and catched in catch $e");
  }
 
 }


}


