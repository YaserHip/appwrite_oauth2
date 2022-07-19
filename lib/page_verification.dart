import 'package:appwrite_phone_login/page_home.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification message."),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 54,
            ),
            const Text(
              "Verification code:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.send,
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text("VERIFY"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
