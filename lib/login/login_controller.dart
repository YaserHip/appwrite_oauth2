import 'package:appwrite_phone_login/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<AsyncValue<void>> {
  LoginController({required this.authRepository})
      : super(const AsyncData(null));
  final AuthRepository authRepository;

  Future<void> oAuth2Session(String provider) async {
    try {
      state = const AsyncLoading();
      final value = await authRepository.oAuth2Session(provider);
      state = AsyncData(value);
    } on Error catch (e) {
      state = AsyncError(e);
    }
  }

  Future<void> phoneSession(
      {required String userId, required String number}) async {
    try {
      state = const AsyncLoading();
      final value = await authRepository.phoneSession(userId, number);
      state = AsyncData(value);
    } on Error catch (e) {
      state = AsyncError(e);
    }
  }

  Future<void> phoneSessionConfirmation(String secret) async {
    try {
      state = const AsyncLoading();
      final value = authRepository.phoneSessionConfirmation(secret);
      state = AsyncData(value);
    } on Error catch (e) {
      state = AsyncError(e);
    }
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, AsyncValue<void>>((ref) {
  return LoginController(authRepository: ref.watch(authRepositoryProvider));
});
