import 'package:appwrite_phone_login/app_router.dart';
import 'package:appwrite_phone_login/login/login_controller.dart';
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
    final nav = Navigator.of(context);

    return Scaffold(
        appBar: AppBar(title: const Text("Login with phone")),
        body: Center(
          child: state.isLoading
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      child: const Text("Facebook"),
                      onPressed: () async {
                        final success = await ref
                            .read(loginControllerProvider.notifier)
                            .oAuth2Session("facebook");
                        if (success) {
                          nav.pushNamed(AppRoutes.homePage);
                        }
                      },
                    ),
                    ElevatedButton(
                      child: const Text("Google"),
                      onPressed: () async {
                        final success = await ref
                            .read(loginControllerProvider.notifier)
                            .oAuth2Session("google");
                        if (success) {
                          nav.pushNamed(AppRoutes.homePage);
                        }
                      },
                    ),
                    ElevatedButton(
                      child: const Text("Auth0"),
                      onPressed: () async {
                        final success = await ref
                            .read(loginControllerProvider.notifier)
                            .oAuth2Session("auth0");
                        if (success) {
                          nav.pushNamed(AppRoutes.homePage);
                        }
                      },
                    ),
                  ],
                ),
        ));
  }
}
