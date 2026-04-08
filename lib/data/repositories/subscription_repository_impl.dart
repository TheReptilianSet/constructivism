import '../../core/storage/subscription_storage.dart';
import '../../domain/models/subscription_plan.dart';
import '../../domain/repositories/subscription_repository.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  SubscriptionRepositoryImpl(this._storage);

  final SubscriptionStorage _storage;

  @override
  Future<bool> hasActiveSubscription() {
    return _storage.hasActiveSubscription();
  }

  @override
  Future<void> buy(SubscriptionPlan plan) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    await _storage.saveSubscription(true);
  }
}
