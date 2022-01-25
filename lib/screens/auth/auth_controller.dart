import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  static const String baseURL = "http://127.0.0.1:8000/api/";
  static const Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  static Future<http.Response> register(
      String firstName, String lastName, String email, String password) async {
    Map data = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + "auth/register");
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    // ignore: avoid_print
    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {"email": email, "password": password};
    var body = json.encode(data);
    var url = Uri.parse(baseURL + "auth/login");
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    // ignore: avoid_print
    print(response.body);
    return response;
  }
}
