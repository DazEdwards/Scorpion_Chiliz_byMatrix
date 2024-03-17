import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'dart:convert';

class VoiceApi {



  Future<List<int>?> getVoiceFromText(String text, int avatarId) async {

    const String elevenLabsKey = "test";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'xi-api-key': elevenLabsKey,
    };

    String url = 'https://nodeuploadfileworker-5aba151d8ff7.herokuapp.com/synthsize';
    try {
      await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode({"text": text, 'avatar_id': avatarId}),
      );

      const Duration(seconds: 2);

    } catch (e) {
      print('Error fetching voice: $e');
    }
  }
}
