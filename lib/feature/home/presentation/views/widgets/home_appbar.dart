import 'package:cure/core/utils/cache_helper.dart';
import 'package:cure/core/utils/constant.dart';
import 'package:cure/feature/authentication/data/models/user_model.dart';
import 'package:cure/feature/home/presentation/manager/get_user_cubit/get_users_cubit.dart';
import 'package:cure/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:cure/feature/home/presentation/views/notification_view.dart';
import 'package:cure/feature/select_field/presentation/manager/select_field_cubit/select_field_cubit.dart';
import 'package:cure/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectFieldCubit, SelectFieldState>(
      builder: (context, state) {
        var selectFieldCubit = BlocProvider.of<SelectFieldCubit>(context);

        return BlocBuilder<GetUsersCubit, GetUsersState>(
          builder: (context, state) {
            var userModel = BlocProvider.of<GetUsersCubit>(context).userModel;
            selectFieldCubit.x = CacheHelper.getSaveData(key: 'field');
            return Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Image.asset(Assets.imagesFacebook),
                ),
                const SizedBox(
                  width: 8,
                ),
                if (state is GetUsersLoadingState)
                  const Center(child: CircularProgressIndicator()),
                if (state is GetUsersSuccessState)
                  Column(
                    children: [
                      if (selectFieldCubit.x == 0)
                        const Text(
                          'Hi, Patient',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      if (selectFieldCubit.x == 1)
                        const Text(
                          'Hi, nurse',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      Text(
                        userModel?.name ?? 'ayman',
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  NotificationView(),
                          ));
                    },
                    icon: const Icon(
                      Icons.notifications_none,
                      color: mainColor,
                    ))
              ],
            );
          },
        );
      },
    );
  }
}
