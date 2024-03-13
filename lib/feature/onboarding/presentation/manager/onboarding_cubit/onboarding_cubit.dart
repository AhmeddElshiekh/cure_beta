import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  dynamic select = FirebaseFirestore.instance.collection('select');

   addUser() {
    return select
        .doc('ahmmedd');
  }
}
