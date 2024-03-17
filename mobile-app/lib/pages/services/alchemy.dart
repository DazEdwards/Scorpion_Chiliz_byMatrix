import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  ApiService._internal();

  // Generic API call function
  Future<void> call(String method, List params, TextEditingController resultAreaController) async {
    resultAreaController.text = 'requesting...';

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    dynamic result;

    var url = Uri.https("solana-devnet.g.alchemy.com", "v2/6B72XWfTF0ma8201YoVVhVToUlxDIoo4");
    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "method": method,
          "params": params
        }),
      );

      result = response.body;
    } catch (e) {
      resultAreaController.text = e.toString();
      rethrow;
    }

    // Handle the result according to your application's logic
    resultAreaController.text = result.toString();
  }
}
