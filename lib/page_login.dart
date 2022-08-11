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
      body: SingleChildScrollView(
          child: Column(
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
            decoration:
                InputDecoration(labelText: 'Phone', enabled: !state.isLoading),
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {
                state.isLoading
                    ? null
                    : ref.read(loginControllerProvider.notifier).phoneSession(
                        userId: 'unique()', number: _phoneController.text);
              },
              child: state.isLoading
                  ? const CircularProgressIndicator()
                  : const Text("SEND"),
            ),
          ),
          state.maybeWhen(
            data: (data) {
              Navigator.pushNamed(context, AppRoutes.verificationPage);
              return Container();
            },
            orElse: () {
              return Container();
            },
          )
        ],
      )),
    );
  }
}
