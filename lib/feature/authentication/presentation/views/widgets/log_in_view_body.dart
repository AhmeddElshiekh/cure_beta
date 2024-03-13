import 'package:cure/core/errors/firebase_errors.dart';
import 'package:cure/core/utils/cache_helper.dart';
import 'package:cure/core/utils/constant.dart';
import 'package:cure/core/utils/snack_bar.dart';
import 'package:cure/feature/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:cure/feature/authentication/presentation/views/sign_up_view.dart';
import 'package:cure/feature/authentication/presentation/views/widgets/Auth_text_button.dart';
import 'package:cure/feature/authentication/presentation/views/widgets/Auth_text_form_filed.dart';
import 'package:cure/feature/home/presentation/views/home_view.dart';
import 'package:cure/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SendEmailForPasswordSuccessfullyState) {
          customSnackBar(context,
              massage: 'Please, Check your G-mail', color: Colors.green);
        }
        if (state is LoginSuccessfulState) {
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            customSnackBar(context,
                massage: 'Login Successfully', color: Colors.green);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
                (route) => false);
          });
        }
        if (state is LoginErrorState) {
          firebaseAuthError(state.errMassage, context);
        }
      },
      builder: (context, state) {
        var authCubit = BlocProvider.of<AuthCubit>(context);
        var logKey = GlobalKey<FormState>();
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: logKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Welcome',
                            style: TextStyle(color: mainColor, fontSize: 26)),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Sign In',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      'Email',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    AuthTextFormFiled(
                        controller: authCubit.logEmailController,
                        inputType: TextInputType.emailAddress,
                        prefixIcon: Icons.alternate_email,
                        hint: 'Enter Your Email',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please, Enter your email address';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Password',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    AuthTextFormFiled(
                        controller: authCubit.logPasswordController,
                        inputType: TextInputType.visiblePassword,
                        obscure: authCubit.isHide,
                        prefixIcon: IconBroken.Password,
                        suffixIcon: authCubit.suffix,
                        hint: 'Enter Your Password',
                        onPressed: () {
                          authCubit.showPassword();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please, Enter your password';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forget Password ?',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: mainColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    if (state is LoginLoadingState)
                      const Center(child: CircularProgressIndicator()),
                    if (state is! LoginLoadingState)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthTextButton(
                            onPressed: () {
                              if (logKey.currentState!.validate()) {
                                authCubit.login(context);
                              }
                            },
                            text: 'Sign In',
                            color: mainColor,
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Assets.imagesFacebook, height: 50),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          Assets.imagesGoogle,
                          height: 60,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupView(),
                                ));
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: mainColor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
