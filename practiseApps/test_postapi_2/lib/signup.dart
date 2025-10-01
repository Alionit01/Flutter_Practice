import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse("https://reqres.in/api/register"),
        headers: {"x-api-key": "reqres-free-v1"},
        body: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        print("Account created: ${response.body}");
      } else {
        print("Failed: ${response.statusCode} → ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                login(
                  emailController.text.toString(),
                  passwordController.text.toString(),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(child: Text("Sign Up")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
