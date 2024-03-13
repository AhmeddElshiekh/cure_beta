import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cure/feature/home/data/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());


  late MessageModel messageModel;
  void sendMessage({
    required String receiverId,
    required String senderName,

  }) {
    messageModel = MessageModel(
        senderName: senderName,
        location: 'الفيوم',
        uId: FirebaseAuth.instance.currentUser!.uid
    );
    FirebaseFirestore.instance
        .collection('patient')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(messageModel.toMap()).then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      log('error when send message ${error.toString()}');
      emit(SendMessageErrorState());
    });
    FirebaseFirestore.instance
        .collection('nurse')
        .doc(receiverId)
        .collection('chats')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('messages')
        .add(messageModel.toMap()).then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      log('error when send message ${error.toString()}');
      emit(SendMessageErrorState());
    });
  }

  List<MessageModel> message = [];

   getMassages({
    required String receiverId,
  }) {
    emit(GetMessageLoadingState());
    print('ahmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmed');
    FirebaseFirestore.instance
        .collection('patient')
        .doc('5Cra0KNOFWbdOq0vUtQyjY3onMX2')
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        message.add(MessageModel.fromJson(element.data()));
      });
      emit(GetMessageSuccessState());
    });
  }

}
