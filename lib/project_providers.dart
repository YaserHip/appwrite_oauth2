// ignore_for_file: non_constant_identifier_names

import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AWClientProvider = Provider<Client>((ref) {
  Client client = Client();
  client
      .setEndpoint(
          'https://0bae-2806-2f0-20c0-30e8-bd82-fbf6-77a1-fdc1.ngrok.io/v1')
      .setProject('62d07cbf622684975b28');
  return client;
});

final AWAccountProvider = Provider<Account>((ref) {
  final AWClient = ref.watch(AWClientProvider);
  return Account(AWClient);
});
