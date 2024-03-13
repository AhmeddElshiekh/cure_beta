import 'package:cure/feature/home/presentation/manager/get_user_cubit/get_users_cubit.dart';
import 'package:cure/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:cure/feature/home/presentation/views/widgets/home_appbar.dart';
import 'package:cure/feature/home/presentation/views/widgets/home_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          HomeCubit()
            ..getServicesData(),
        ),
        BlocProvider(
          create: (context) => GetUsersCubit()..getUsersData(),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var homeCubit = BlocProvider.of<HomeCubit>(context);

          return Scaffold(
              appBar: AppBar(title: const HomeAppBar()),
              body: homeCubit.views[homeCubit.currentIndex],
              bottomNavigationBar: const HomeBottomNavBar());
        },
      ),
    );
  }
}
