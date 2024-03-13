import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cure/core/utils/cache_helper.dart';
import 'package:cure/feature/authentication/presentation/views/log_in_view.dart';
import 'package:cure/feature/home/presentation/views/home_view.dart';
import 'package:cure/feature/home/presentation/views/notification_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'select_field_state.dart';

class SelectFieldCubit extends Cubit<SelectFieldState> {
  SelectFieldCubit() : super(SelectFieldInitial());

  DocumentReference patient = FirebaseFirestore.instance
      .collection('patient')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  DocumentReference nurse = FirebaseFirestore.instance
      .collection('nurse')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  Future<void> selectPatient(
    context, {
    required String name,
  }) {
    return patient.set(
      {
        'text': 'فشل كلوي',
        'name': name,
        'image':
            'https://cdn.vectorstock.com/i/preview-1x/17/61/male-avatar-profile-picture-vector-10211761.jpg',
        'location': 'الفيوم, سنورس',
        'uId': FirebaseAuth.instance.currentUser!.uid,
      },
    ).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ),
          (route) => false);
      emit(SelectPatientSuccess());
    }).catchError((error) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
          (route) => false);
      emit(SelectPatientError());
    });
  }

  Future<void> selectNurse(
    context, {
    required String name,
  }) {
    return nurse.set(
      {
        'text': 'اخصائى فى مستشفى الجامعة',
        'name': name,
        'image':
            'https://cdn.vectorstock.com/i/preview-1x/17/61/male-avatar-profile-picture-vector-10211761.jpg',
        'location': 'الفيوم, سنورس',
        'uId': FirebaseAuth.instance.currentUser!.uid,
      },
    ).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const NotificationView(),
          ),
          (route) => false);

      emit(SelectNurseSuccess());
    }).catchError((error) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
          (route) => false);

      emit(SelectNurseError());
    });
  }

  bool isSelected = true;

  void selected() {
    isSelected = !isSelected;
    emit(Selected());
  }

  late int x = 2;

  void xEqualOne() {
    x = 1;
    CacheHelper.saveData(key: 'field', value: x);
    emit(SelectXEqualOne());
  }

  void xEqualZero() {
    x = 0;
    CacheHelper.saveData(key: 'field', value: x);
    emit(SelectXEqualZero());
  }
}
