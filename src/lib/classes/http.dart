import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//For android, need to modify AndroidManifest.xml to allow internet access

class Http {
  static Future<http.Response> authenticateUser(
    String userName,
    String password,
  ) async {
    final apiKey = dotenv.env['API_KEY'];
    if (apiKey == null) {
      throw Exception('API key not found in .env file');
    }
    return http.post(
      Uri.parse('https://authenticateuser-es4to5jqjq-uc.a.run.app'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-api-key': apiKey,
      },
      body: jsonEncode(<String, String>{
        'userName': userName,
        'password': password,
      }),
    );
  }
}
