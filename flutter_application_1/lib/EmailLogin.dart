import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email Login',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainApp(),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: sendPostRequest,
              child: Container(
                height: 50,
                //color: Colors.green,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
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
    );
  }
}
