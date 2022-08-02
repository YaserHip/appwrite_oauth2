import 'package:appwrite_phone_login/app_router.dart';
import 'package:appwrite_phone_login/login_controller.dart';
import 'package:appwrite_phone_login/state_manager_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _phoneController = TextEditingController();

  String get phone => _phoneController.text;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Login with phone")),
      body: StateManager(
          isLoading: state.isLoading,
          child: SingleChildScrollView(
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
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.send,
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(loginControllerProvider.notifier)
                          .phoneSession("unique()", _phoneController.text);
                      Navigator.of(context)
                          .pushNamed(AppRoutes.verificationPage);
                    },
                    child: const Text("SEND"),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
