import 'package:cure/core/utils/snack_bar.dart';
import 'package:flutter/material.dart';

firebaseAuthError(
  String errorMessage,
  context,
) {
  if (errorMessage.contains('[firebase_auth/invalid-credential]')) {
    customSnackBar(context,
        massage: errorMessage
            .split('[firebase_auth/invalid-credential]')[1]
            .toString(),
        color: Colors.red);
  }
  if (errorMessage.contains('[firebase_auth/invalid-email]')) {
    customSnackBar(context,
        massage:
            errorMessage.split('[firebase_auth/invalid-email]')[1].toString(),
        color: Colors.red);
  }
  if (errorMessage.contains('[firebase_auth/too-many-requests]')) {
    customSnackBar(context,
        massage: errorMessage
            .split('[firebase_auth/too-many-requests]')[1]
            .toString(),
        color: Colors.red);
  }
  if (errorMessage.contains('[firebase_auth/unknown]')) {
    customSnackBar(context,
        massage: errorMessage.split('[firebase_auth/unknown]')[1].toString(),
        color: Colors.red);
  }
  if (errorMessage.contains('[firebase_auth/network-request-failed]')) {
    customSnackBar(context,
        massage: errorMessage
            .split('[firebase_auth/network-request-failed]')[1]
            .toString(),
        color: Colors.red);
  }
  if (errorMessage.contains('[firebase_auth/weak-password]')) {
    customSnackBar(context,
        massage:
            errorMessage.split('[firebase_auth/weak-password]')[1].toString(),
        color: Colors.red);
  }
  if (errorMessage.contains('[firebase_auth/email-already-in-use]')) {
    customSnackBar(context,
        massage:
        errorMessage.split('[firebase_auth/email-already-in-use]')[1].toString(),
        color: Colors.red);
  }
}
