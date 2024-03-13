import 'package:cure/feature/authentication/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: SignupViewBody(),
    );
  }
}
