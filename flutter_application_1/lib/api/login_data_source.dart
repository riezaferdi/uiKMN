//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '/main.dart';

class LoginDataSource {
  Future<void> login(String email, String password) async {
    try {
      final Uri loginUri = Uri.parse("https://reqres.in/api/login");
      final Map<String, dynamic> body = {
        "email": email,
        "password": password,
      };
      Response response = await post(loginUri, body: body);
      //dynamic responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        const SnackBar(
          content: Text("Login Successfully!"),
        );
        // MaterialPageRoute(
        //   builder: (context) => const MainApp(),
        // );
      } else {
        const SnackBar(
          content: Text("Login Failed!"),
        );
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
