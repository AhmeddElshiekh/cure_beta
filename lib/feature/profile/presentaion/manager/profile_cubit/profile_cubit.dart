import 'package:bloc/bloc.dart';
import 'package:cure/core/utils/cache_helper.dart';
import 'package:cure/core/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      CacheHelper.removeData(key: 'name');
      emit(ProfileSignOutSuccess());
    });
  }
}
