import 'package:cure/feature/authentication/presentation/views/widgets/log_in_view_body.dart';
import 'package:flutter/material.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        body:  LoginViewBody(),

    );
  }
}
