import 'package:flutter/material.dart';

import 'app.dart';
import 'core/storage/subscription_storage.dart';
import 'data/repositories/subscription_repository_impl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = SubscriptionStorage();
  final repository = SubscriptionRepositoryImpl(storage);

  runApp(App(repository: repository));
}
