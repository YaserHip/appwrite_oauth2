import 'package:appwrite_phone_login/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<AsyncValue<void>> {
  LoginController({required this.authRepository})
      : super(const AsyncData(null));
  final AuthRepository authRepository;

  Future<void> phoneSession(String userId, String number) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => authRepository.phoneSession(userId, number));
  }

  Future<void> phoneSessionConfirmation(String secret) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => authRepository.phoneSessionConfirmation(secret));
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, AsyncValue<void>>((ref) {
  return LoginController(authRepository: ref.watch(authRepositoryProvider));
});
