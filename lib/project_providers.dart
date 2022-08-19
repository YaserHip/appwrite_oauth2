// ignore_for_file: non_constant_identifier_names

import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AWClientProvider = Provider<Client>((ref) {
  Client client = Client();
  client
      .setEndpoint(
          'https://59d1-2806-2f0-20c0-30e8-c58c-55de-f8ea-5e12.ngrok.io/v1')
      .setProject('62edbde08a15f2e95ee3');
  return client;
});

final AWAccountProvider = Provider<Account>((ref) {
  final AWClient = ref.watch(AWClientProvider);
  return Account(AWClient);
});
