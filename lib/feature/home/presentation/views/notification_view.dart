import 'package:cure/core/utils/constant.dart';
import 'package:cure/feature/home/presentation/manager/message/message_cubit.dart';
import 'package:cure/feature/home/presentation/views/widgets/notification_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageCubit()..getMassages(receiverId: '6FcHZ7B5TSXviIHdzghioqvaI2j1'),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notification',
            style: TextStyle(color: mainColor),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<MessageCubit, MessageState>(
          builder: (context, state) {
            var messageList = BlocProvider.of<MessageCubit>(context).message;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(10)),
                        color: Colors.grey[300]),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.notifications_none,
                          size: 40,
                          color: mainColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              messageList[index].senderName ?? 'aggg',
                              style: TextStyle(fontSize: 18),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: mainColor,
                                ),
                                Text(
                                  messageList[index].location!,
                                  style:
                                      TextStyle(color: mainColor, fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(100, 0)),
                              child: const Text('تأكيد'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(100, 0)),
                              child: const Text('رفض'),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: messageList.length,
            );
          },
        ),
      ),
    );
  }
}
