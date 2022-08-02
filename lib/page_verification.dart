import 'package:appwrite_phone_login/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerificationPage extends ConsumerStatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationPageState();
}

class _VerificationPageState extends ConsumerState<VerificationPage> {
  final _codeController = TextEditingController();

  String get code => _codeController.text;

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
                  Navigator.of(context).pushNamed(AppRoutes.homePage);
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
