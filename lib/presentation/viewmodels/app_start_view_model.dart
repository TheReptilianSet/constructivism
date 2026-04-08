import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/subscription_repository.dart';

class AppStartState {
  const AppStartState({required this.status});

  final AppStartStatus status;
}

enum AppStartStatus { loading, authorized, unauthorized }

class AppStartViewModel extends Cubit<AppStartState> {
  AppStartViewModel(this._repository)
      : super(const AppStartState(status: AppStartStatus.loading));

  final SubscriptionRepository _repository;

  Future<void> load() async {
    final hasSubscription = await _repository.hasActiveSubscription();

    emit(
      AppStartState(
        status: hasSubscription
            ? AppStartStatus.authorized
            : AppStartStatus.unauthorized,
      ),
    );
  }
}
