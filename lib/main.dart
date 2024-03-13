import 'dart:developer';

import 'package:cure/core/cubit/bloc_observer/bloc_observer.dart';
import 'package:cure/core/utils/cache_helper.dart';
import 'package:cure/core/utils/constant.dart';
import 'package:cure/feature/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:cure/feature/home/presentation/manager/message/message_cubit.dart';
import 'package:cure/feature/home/presentation/views/home_view.dart';
import 'package:cure/feature/home/presentation/views/notification_view.dart';
import 'package:cure/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:cure/feature/select_field/presentation/manager/select_field_cubit/select_field_cubit.dart';
import 'package:cure/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  uId = CacheHelper.getSaveData(key: 'uId');
  field = CacheHelper.getSaveData(key: 'field');

  Widget widget;
  if (uId != null && field == 0) {
    widget = const HomeView();
  } else if (uId != null && field == 1) {
    widget = const NotificationView();
  } else {
    widget = const OnboardingView();
  }

  log(FirebaseAuth.instance.currentUser.toString());
  log('UID IS $uId');
  log('x IS $field');


  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});

  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => SelectFieldCubit(),
        ),
        BlocProvider(
          create: (context) => MessageCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}
