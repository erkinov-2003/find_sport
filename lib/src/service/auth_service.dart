import 'dart:convert';

import 'package:find_sport/src/core/config/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkService {
  Future saveApiUserData(
    String firsName,
    lastName,
    phoneNumber,
    password,
    confirmPassword,
  ) async {
    final uri = Uri.parse(AppConfig.baseUrl);

    Map<String, dynamic> data = {
      "firstname": firsName,
      "lastname": lastName,
      "phone": phoneNumber,
      "password": password,
      "confirmPassword": confirmPassword,
    };

    Response response = await http.post(
      uri,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("User muvoffiqiyatli saqlandi! ${response.body}");
    }else{
      throw Exception("Error nimadur hato ketdi");
    }
  }
}
