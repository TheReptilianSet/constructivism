import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/subscription_plan.dart';
import '../../domain/repositories/subscription_repository.dart';

class PaywallState {
  const PaywallState({
    required this.selectedPlan,
    required this.isLoading,
  });

  final SubscriptionPlan selectedPlan;
  final bool isLoading;

  PaywallState copyWith({
    SubscriptionPlan? selectedPlan,
    bool? isLoading,
  }) {
    return PaywallState(
      selectedPlan: selectedPlan ?? this.selectedPlan,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class PaywallViewModel extends Cubit<PaywallState> {
  PaywallViewModel(this._repository)
      : super(
          const PaywallState(
            selectedPlan: SubscriptionPlan.yearly,
            isLoading: false,
          ),
        );

  final SubscriptionRepository _repository;

  void selectPlan(SubscriptionPlan plan) {
    emit(state.copyWith(selectedPlan: plan));
  }

  Future<void> buy() async {
    emit(state.copyWith(isLoading: true));
    await _repository.buy(state.selectedPlan);
    emit(state.copyWith(isLoading: false));
  }
}
