import 'package:cure/core/utils/constant.dart';
import 'package:cure/feature/home/data/models/doctor_model.dart';
import 'package:cure/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:cure/feature/home/presentation/manager/message/message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorViewBody extends StatelessWidget {
  const DoctorViewBody({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageCubit, MessageState>(
      builder: (context, state) {
        var messageCubit = BlocProvider.of<MessageCubit>(context);
        return Padding(
          padding:
              const EdgeInsetsDirectional.only(start: 20, end: 20, top: 10),
          child: Container(
            height: 210,
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
              color: mainColor,
            ),
            child: Row(
              children: [
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    '${doctorModel.image}',
                    width: 140,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${doctorModel.name}',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child: Text(
                          '${doctorModel.text}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            '${doctorModel.location}',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fixedSize: const Size(100, 50)),
                        onPressed: () {
                          messageCubit.sendMessage(
                            receiverId: doctorModel.uId!, senderName: doctorModel.name!,
                          );
                        },
                        child: const Text(
                          'اطلب',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
