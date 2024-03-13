import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cure/core/utils/cache_helper.dart';
import 'package:cure/core/utils/constant.dart';
import 'package:cure/feature/authentication/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit() : super(GetUsersInitial());

  UserModel? userModel;

  void getUsersData() {
    emit(GetUsersLoadingState());
    uId = CacheHelper.getSaveData(key: 'uId');
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      log(value.data().toString());
      emit(GetUsersSuccessState());
    }).catchError((error) {
      log('error when get user data $error');
      emit(GetUsersErrorState());
    });
  }
}
