// import 'package:cure/core/utils/constant.dart';
// import 'package:cure/feature/home/data/models/message_model.dart';
// import 'package:cure/feature/home/presentation/manager/home_cubit/home_cubit.dart';
// import 'package:cure/feature/home/presentation/manager/message/message_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class NotificationViewBody extends StatelessWidget {
//   const NotificationViewBody({super.key, });
//
//   // final MessageModel messageModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius:
//             const BorderRadiusDirectional.all(Radius.circular(10)),
//             color: Colors.grey[300]),
//         child: Row(
//           children: [
//             const Icon(
//               Icons.notifications_none,
//               size: 40,
//               color: mainColor,
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//              Column(
//               children: [
//                 Text(
//                  'messageModel.senderName '?? 'aggg',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.location_on,
//                       color: mainColor,
//                     ),
//                     Text(
//                      ' messageModel.location!',
//                       style: TextStyle(color: mainColor, fontSize: 16),
//                     )
//                   ],
//                 )
//               ],
//             ),
//             const Spacer(),
//             Column(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style:
//                   ElevatedButton.styleFrom(fixedSize: const Size(100, 0)),
//                   child: const Text('تأكيد'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style:
//                   ElevatedButton.styleFrom(fixedSize: const Size(100, 0)),
//                   child: const Text('رفض'),
//                 )
//               ],
//             ),
//             const SizedBox(
//               width: 20,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
