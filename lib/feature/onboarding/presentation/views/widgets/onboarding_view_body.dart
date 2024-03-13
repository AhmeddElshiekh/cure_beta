import 'package:cure/feature/authentication/presentation/views/log_in_view.dart';
import 'package:cure/feature/authentication/presentation/views/sign_up_view.dart';
import 'package:cure/feature/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';
import 'package:cure/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var onBoardingCubit = BlocProvider.of<OnboardingCubit>(context);
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                Assets.imagesLogo,
                width: 150,
                height: 250,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff8ED7F0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * .6, 90)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView(),));

                    },
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0B8FAC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * .6, 90)),
                onPressed: ()async {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupView(),));
                },
                child: const Text(
                  'انشاء حساب',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        );
      },
    );
  }
}
