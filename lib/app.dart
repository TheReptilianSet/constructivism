import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/repositories/subscription_repository.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/onboarding_screen.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/viewmodels/app_start_view_model.dart';

class App extends StatelessWidget {
  const App({super.key, required this.repository});

  final SubscriptionRepository repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: repository,
      child: BlocProvider(
        create: (_) => AppStartViewModel(repository)..load(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Конструктивизм Подписка',
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFF4EBDC),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFD72638),
              background: const Color(0xFFF4EBDC),
            ),
            useMaterial3: true,
            textTheme: const TextTheme(
              displaySmall: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w900,
                height: 0.95,
              ),
              titleLarge: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              bodyLarge: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          home: BlocBuilder<AppStartViewModel, AppStartState>(
            builder: (context, state) {
              switch (state.status) {
                case AppStartStatus.loading:
                  return const SplashScreen();
                case AppStartStatus.authorized:
                  return const HomeScreen();
                case AppStartStatus.unauthorized:
                  return const OnboardingScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}
