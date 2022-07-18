import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Login with phone")),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 54,
              ),
              const Text(
                "Phone number:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const TextField(
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.send,
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("SEND"),
                ),
              ),
            ],
          ),
        ));
  }
}
