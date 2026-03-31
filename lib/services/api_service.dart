import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000/chat-stream";

  static Future<Stream<String>> sendMessageStream(String message) async {
    final request = http.Request(
      'POST',
      Uri.parse(baseUrl),
    );

    request.headers.addAll({
      "Content-Type": "application/json",
    });

    request.body = jsonEncode({
      "message": message,
    });

    final response = await request.send();

    if (response.statusCode != 200) {
      throw Exception("Error: ${response.statusCode}");
    }

    return response.stream
        .transform(utf8.decoder);
  }
}

