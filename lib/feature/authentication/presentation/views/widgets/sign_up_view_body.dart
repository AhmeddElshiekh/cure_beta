import 'package:cure/core/errors/firebase_errors.dart';
import 'package:cure/core/utils/cache_helper.dart';
import 'package:cure/core/utils/constant.dart';
import 'package:cure/core/utils/snack_bar.dart';
import 'package:cure/feature/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:cure/feature/authentication/presentation/views/log_in_view.dart';
import 'package:cure/feature/authentication/presentation/views/widgets/Auth_text_button.dart';
import 'package:cure/feature/authentication/presentation/views/widgets/Auth_text_form_filed.dart';
import 'package:cure/feature/select_field/presentation/views/select_field_view.dart';
import 'package:cure/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessfulState) {
          // && FirebaseAuth.instance.currentUser!.emailVerified
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            customSnackBar(context,
                massage: 'Register Successfully', color: Colors.green);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectFieldView(),
                ),
                (route) => false);
          });
        }
        if (state is RegisterErrorState) {
          firebaseAuthError(state.errMassage, context);
        }
      },
      builder: (context, state) {
        var authCubit = BlocProvider.of<AuthCubit>(context);
        var regKey = GlobalKey<FormState>();
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: regKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Create New Account',
                            style: TextStyle(color: mainColor, fontSize: 26)),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Full Name',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AuthTextFormFiled(
                        hint: 'Enter Your Name',
                        controller: authCubit.regNameController,
                        inputType: TextInputType.name,
                        prefixIcon: IconBroken.Profile,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please, Enter your name';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Email',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AuthTextFormFiled(
                        controller: authCubit.regEmailController,
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
                        controller: authCubit.regPasswordController,
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
                      height: 20,
                    ),
                    const Text(
                      'Mobile Number',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AuthTextFormFiled(
                        hint: 'Enter Your Phone Number',
                        controller: authCubit.regPhoneController,
                        inputType: TextInputType.phone,
                        prefixIcon: IconBroken.Call,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please, Enter your phone number';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    if (state is RegisterLoadingState)
                      const Center(child: CircularProgressIndicator()),
                    if (state is! RegisterLoadingState)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthTextButton(
                            onPressed: () {
                              if (regKey.currentState!.validate()) {
                                authCubit.register(context);
                              }
                            },
                            text: 'Sign Up',
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
                          'You already have an account',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginView(),
                                ),
                                (route) => false);
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: mainColor),
                          ),
                        )
                      ],
                    ),
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
