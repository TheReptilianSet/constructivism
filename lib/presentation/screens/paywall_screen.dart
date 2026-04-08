import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/subscription_plan.dart';
import '../../domain/repositories/subscription_repository.dart';
import '../viewmodels/paywall_view_model.dart';
import '../widgets/constructivist_illustration.dart';
import '../widgets/subscription_option_card.dart';
import 'home_screen.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaywallViewModel(context.read<SubscriptionRepository>()),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: BlocConsumer<PaywallViewModel, PaywallState>(
          listener: (context, state) {
            if (!state.isLoading) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute<void>(
                  builder: (_) => const HomeScreen(),
                ),
                (_) => false,
              );
            }
          },
          listenWhen: (previous, current) =>
              previous.isLoading && !current.isLoading,
          builder: (context, state) {
            final viewModel = context.read<PaywallViewModel>();
                
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ВЫБЕРИ\nДОСТУП',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 24),
                      const ConstructivistIllustration(height: 160),
                      const SizedBox(height: 24),
                      const Text(
                        'Минимальный paywall в эстетике конструктивизма.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SubscriptionOptionCard(
                        plan: SubscriptionPlan.monthly,
                        isSelected: state.selectedPlan == SubscriptionPlan.monthly,
                        onTap: () => viewModel.selectPlan(SubscriptionPlan.monthly),
                      ),
                      const SizedBox(height: 16),
                      SubscriptionOptionCard(
                        plan: SubscriptionPlan.yearly,
                        isSelected: state.selectedPlan == SubscriptionPlan.yearly,
                        onTap: () => viewModel.selectPlan(SubscriptionPlan.yearly),
                      ),
                      // const Spacer(),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFFD72638),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: const RoundedRectangleBorder(),
                          ),
                          onPressed: state.isLoading ? null : viewModel.buy,
                          child: Text(
                            state.isLoading ? 'Покупка...' : 'Продолжить',
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
