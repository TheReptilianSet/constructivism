import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionStorage {
  static const _key = 'has_active_subscription';

  Future<bool> hasActiveSubscription() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  Future<void> saveSubscription(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);
  }
}
