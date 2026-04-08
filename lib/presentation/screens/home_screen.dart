import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodels/home_view_model.dart';
import '../widgets/constructivist_illustration.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Главная',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          backgroundColor: const Color(0xFFF4EBDC),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ДОСТУП\nАКТИВЕН',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 20),
              const ConstructivistIllustration(height: 140),
              const SizedBox(height: 20),
              const Text(
                'Пример домашнего экрана после покупки подписки.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<HomeViewModel, List<String>>(
                  builder: (context, items) {
                    return ListView.separated(
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(18),
                          color: index.isEven ? Colors.black : const Color(0xFFD72638),
                          child: Text(
                            items[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
