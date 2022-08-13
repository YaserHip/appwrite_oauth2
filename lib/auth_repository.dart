import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_phone_login/project_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  AuthRepository({required this.account});
  final Account account;
  var userId = '';

  Future<void> oAuth2Session(String provider) async {
    return await account.createOAuth2Session(provider: provider);
  }

  Future<Token> phoneSession(String userId, String number) async {
    userId = userId;
    return await account.createPhoneSession(userId: userId, number: number);
  }

  Future<Session> phoneSessionConfirmation(String secret) async {
    return await account.updatePhoneSession(userId: userId, secret: secret);
  }
}

final authRepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRepository(account: ref.watch(AWAccountProvider)));
