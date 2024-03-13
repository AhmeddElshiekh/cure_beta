import 'package:cure/core/utils/constant.dart';
import 'package:cure/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        return BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time_filled),
              label: 'Time',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_3),
              label: 'Profile',
            ),
          ],
          currentIndex: cubit.currentIndex,
          selectedItemColor: mainColor,
          onTap: (index) => cubit.changeBottomNavBar(index),
        );
      },
    );
  }
}
