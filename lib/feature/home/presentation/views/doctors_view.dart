import 'package:cure/core/utils/constant.dart';
import 'package:cure/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:cure/feature/home/presentation/views/widgets/doctor_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getDoctorsData(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'All Cures',
            style: TextStyle(color: mainColor, fontSize: 28),
          ),
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var list = BlocProvider.of<HomeCubit>(context).doctorList;
            var homeCubit = BlocProvider.of<HomeCubit>(context);
            return ListView.separated(
                itemBuilder: (context, index) {
                  return DoctorViewBody(doctorModel: list[index],);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: list.length);
          },
        ),
      ),
    );
  }
}

