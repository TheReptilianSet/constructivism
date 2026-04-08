import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<List<String>> {
  HomeViewModel()
      : super(
          const [
            'Личный трек прогресса',
            'Новый визуальный модуль',
            'Еженедельная подборка идей',
          ],
        );
}
