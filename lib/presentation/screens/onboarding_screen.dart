import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodels/onboarding_view_model.dart';
import '../widgets/constructivist_illustration.dart';
import 'paywall_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingViewModel(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'СТАРТ\nИДЕИ',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 24),
                const ConstructivistIllustration(),
                const SizedBox(height: 24),
                Expanded(
                  child: BlocBuilder<OnboardingViewModel, int>(
                    builder: (context, pageIndex) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: PageView(
                              controller: _controller,
                              onPageChanged: context
                                  .read<OnboardingViewModel>()
                                  .changePage,
                              children: const [
                                _OnboardingPage(
                                  title: 'Простое начало',
                                  subtitle:
                                      'Короткий вводный экран, чтобы показать ритм и стиль приложения.',
                                ),
                                _OnboardingPage(
                                  title: 'Подписка открывает доступ',
                                  subtitle:
                                      'После покупки домашний экран будет открываться сразу при следующем запуске.',
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: List.generate(
                              2,
                              (index) => Container(
                                margin: const EdgeInsets.only(right: 8),
                                width: pageIndex == index ? 28 : 10,
                                height: 10,
                                color: pageIndex == index
                                    ? const Color(0xFFD72638)
                                    : Colors.black12,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: const RoundedRectangleBorder(),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const PaywallScreen(),
                        ),
                      );
                    },
                    child: const Text('Продолжить'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Text(subtitle, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
