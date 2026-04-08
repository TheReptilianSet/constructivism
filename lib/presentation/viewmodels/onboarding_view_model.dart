import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingViewModel extends Cubit<int> {
  OnboardingViewModel() : super(0);

  void changePage(int index) => emit(index);
}
