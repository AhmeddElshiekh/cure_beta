import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cure/core/utils/cache_helper.dart';
import 'package:cure/core/utils/constant.dart';
import 'package:cure/feature/authentication/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  var regNameController = TextEditingController();
  var regPhoneController = TextEditingController();
  var regPasswordController = TextEditingController();
  var regEmailController = TextEditingController();
  var logPasswordController = TextEditingController();
  var logEmailController = TextEditingController();

  register(context) async {
    emit(RegisterLoadingState());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: regEmailController.text,
        password: regPasswordController.text,
      )
          .then((value) {
        UserModel model = UserModel(
            name: regNameController.text,
            phone: regPhoneController.text,
            email: regEmailController.text,
            uId: value.user!.uid);
        FirebaseFirestore.instance
            .collection('users')
            .doc(value.user!.uid)
            .set(model.toMap());
        emit(RegisterSuccessfulState(value.user!.uid));
      });
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }

  void login(context) async {
    emit(LoginLoadingState());

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: logEmailController.text,
              password: logPasswordController.text)
          .then((value) {
        emit(LoginSuccessfulState(value.user!.uid));
      });
    } catch (e) {
      log(e.toString());
      emit(LoginErrorState(e.toString()));
    }
  }

  //
  // Future signInWithGoogleInWeb(context) async {
  //   emit(LoginWithGoogleLoadingState());
  //
  //   GoogleAuthProvider googleProvider = GoogleAuthProvider();
  //
  //   googleProvider
  //       .addScope('https://www.googleapis.com/auth/contacts.readonly');
  //   googleProvider.setCustomParameters({});
  //
  //   await FirebaseAuth.instance.signInWithPopup(googleProvider).then((value) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const Home(),
  //         ));
  //     emit(LoginWithGoogleSuccessfullyState());
  //   }).catchError((error) {
  //     log(error.toString());
  //     emit(LoginWithGoogleErrorState(error.toString()));
  //   });
  // }

  // Future signInWithGoogleInPhone(context) async {
  //   emit(LoginWithGoogleLoadingState());
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   if (googleUser == null) {
  //     return;
  //   }
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;
  //
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //
  //   await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const Home(),
  //         ));
  //     emit(LoginWithGoogleSuccessfullyState());
  //   }).catchError((error) {
  //     log(error.toString());
  //     emit(LoginWithGoogleErrorState(error.toString()));
  //   });
  // }

  // void emailVerified(context) {
  //   FirebaseAuth.instance.currentUser!.emailVerified
  //       ? Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const Home(),
  //           ))
  //       : Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const EmailVerificationView(),
  //           ));
  // }

  // bool sent = false;
  //
  // void sendEmail(context) async {
  //   await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  //   sent = true;
  //   emit(SendEmailState());
  // }
  //
  // void sendEmailForPassword(context) async {
  //
  //     if (logEmailController.text == '') {
  //       customSnackBar(context,
  //           massage: 'Please, Enter your G-mail', color: Colors.red);
  //     } else {
  //         await FirebaseAuth.instance
  //           .sendPasswordResetEmail(email: logEmailController.text)
  //           .then((value) {
  //         emit(SendEmailForPasswordSuccessfullyState());
  //       }).catchError((error) {
  //         firebaseAuthError(error.toString(), context);
  //         emit(SendEmailForPasswordErrorState(error));
  //       });
  //
  //     }
  //
  // }

  bool isHide = true;
  IconData suffix = Icons.visibility;

  void showPassword() {
    isHide = !isHide;
    suffix = isHide ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AuthShowPasswordState());
  }
}
