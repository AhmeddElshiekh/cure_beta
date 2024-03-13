import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cure/core/utils/constant.dart';
import 'package:cure/feature/authentication/data/models/user_model.dart';
import 'package:cure/feature/home/data/models/doctor_model.dart';
import 'package:cure/feature/home/data/models/message_model.dart';
import 'package:cure/feature/home/presentation/views/doctors_view.dart';
import 'package:cure/feature/home/presentation/views/widgets/home_view_body.dart';
import 'package:cure/feature/profile/views/profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 0;

  void changeBottomNavBar(index) {
    currentIndex = index;
    emit(HomeChangeBottomNavBar());
  }

  List<Widget> views = const [
    HomeViewBody(),
    DoctorsView(),
    DoctorsView(),
    ProfileView(),
  ];

  List<QueryDocumentSnapshot> data = [];

  void getServicesData() {
    emit(HomeServicesLoading());
    FirebaseFirestore.instance
        .collection('services')
        .get()
        .then((QuerySnapshot querySnapshot) {
      data.addAll(querySnapshot.docs);
      emit(HomeServicesSuccess());
    }).catchError((error) {
      log('error when get Services data $error');
      emit(HomeServicesError());
    });
  }

  List<DoctorModel> doctorList = [];

  void getDoctorsData() {
    emit(HomeDoctorLoading());
    FirebaseFirestore.instance
        .collection('nurse')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (int i = 0; i <= doctorList.length; i++) {
        doctorList.add(DoctorModel.fromJson(querySnapshot.docs[i]));
      }
      emit(HomeDoctorSuccess());
    }).catchError((error) {
      log('error when get Doctor data $error');
      emit(HomeDoctorError());
    });
  }

// late MessageModel messageModel;
//   void sendMessage({
//     required String receiverId,
//     required String senderName,
//
//   }) {
//     messageModel = MessageModel(
//       senderName: senderName,
//       location: 'الفيوم',
//       uId: FirebaseAuth.instance.currentUser!.uid
//     );
//     FirebaseFirestore.instance
//         .collection('patient')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection('chats')
//         .doc(receiverId)
//         .collection('messages')
//         .add(messageModel.toMap()).then((value) {
//       emit(SendMessageSuccessState());
//     }).catchError((error) {
//       log('error when send message ${error.toString()}');
//       emit(SendMessageErrorState());
//     });
//     FirebaseFirestore.instance
//         .collection('nurse')
//         .doc(receiverId)
//         .collection('chats')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection('messages')
//         .add(messageModel.toMap()).then((value) {
//       emit(SendMessageSuccessState());
//     }).catchError((error) {
//       log('error when send message ${error.toString()}');
//       emit(SendMessageErrorState());
//     });
//   }
//
//   List<MessageModel> message = [];
//
//   void getMassages({
//     required String receiverId,
//   }) {
//     emit(GetMessageLoadingState());
//     FirebaseFirestore.instance
//         .collection('patient')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection('chats')
//         .doc(receiverId)
//         .collection('messages')
//         .snapshots()
//         .listen((event) {
//       event.docs.forEach((element) {
//         message.add(MessageModel.fromJson(element.data()));
//       });
//       emit(GetMessageSuccessState());
//     });
//   }


// void sendMessage({
//   required String receiver,
// }) {
//   emit(SendMessageLoading());
//   FirebaseFirestore.instance.collection('message').doc(uId).set({
//     'message': 'ahmed hassan badawi',
//     'receiver': receiver
//   }).then((value) {
//     emit(SendMessageSuccess());
//   }).catchError((error) {
//     log('error when Send Message data $error');
//     emit(SendMessageError());
//   });
// }

//
// FirebaseFirestore firestore = FirebaseFirestore.instance;
// CollectionReference users = FirebaseFirestore.instance.collection('users');
//
// Future<void> addUser() {
//   // Call the user's CollectionReference to add a new user
//   return users
//       .add({
//     'full_name': fullName, // John Doe
//     'company': company, // Stokes and Sons
//     'age': age // 42
//   })
//       .then((value) => print("User Added"))
//       .catchError((error) => print("Failed to add user: $error"));
// }
}
