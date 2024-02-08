import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import bloc
// import './bloc/auth_repository.dart';
// import './bloc/form_submission_status.dart';
// import './bloc/login/login_bloc.dart';
// import './bloc/login/login_event.dart';
// import "package:flutter_bloc/flutter_bloc.dart";
// import './bloc/login/login_state.dart';
//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final apiUrl = "https://reqres.in/api/login";
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> sendPostRequest() async {
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          {
            "email": emailController.text,
            "password": passController.text,
          },
        ),
      );

      if (response.statusCode == 200) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text("Login Successfully!"),
        //   ),
        // );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const MainApp(),
        //   ),
        // );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("password", passController.text);
        prefs.setString("email", emailController.text);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext ctx) => const MainApp(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Failed!"),
          ),
        );
      }
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
        title: const Text(
          'Email Login',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Email!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passController,
                decoration: const InputDecoration(hintText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Password!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendPostRequest;
                  }
                },
                child: Container(
                  height: 50,
                  //color: Colors.green,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
