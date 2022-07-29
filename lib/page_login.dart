import 'package:appwrite_phone_login/app_router.dart';
import 'package:appwrite_phone_login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final _phoneController = TextEditingController();

  String get phone => _phoneController.text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
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
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.verificationPage);
                  },
                  child: const Text("SEND"),
                ),
              ),
            ],
          ),
        ));
  }
}
