import '../models/subscription_plan.dart';

abstract class SubscriptionRepository {
  Future<bool> hasActiveSubscription();
  Future<void> buy(SubscriptionPlan plan);
}
