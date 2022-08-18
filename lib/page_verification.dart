import 'package:appwrite_phone_login/app_router.dart';
import 'package:appwrite_phone_login/login/login_controller.dart';
import 'package:appwrite_phone_login/state_manager_widget.dart';
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
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginControllerProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Verification message."),
        ),
        body: StateManager(
          isLoading: state.isLoading,
          child: SingleChildScrollView(
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
        ));
  }
}
