import 'package:cure/feature/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';
import 'package:cure/feature/onboarding/presentation/views/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/snack_bar_back.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: doubleTap(widget: const OnboardingViewBody()),
      ),
    );
  }
}
