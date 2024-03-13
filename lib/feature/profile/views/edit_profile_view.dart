// import 'package:cure/feature/profile/presentaion/manager/profile_cubit/profile_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class EditProfileView extends StatelessWidget {
//   EditProfileView({super.key});
//
//   var nameController = TextEditingController();
//   var bioController = TextEditingController();
//   var phoneController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProfileCubit(),
//       child: BlocConsumer<ProfileCubit, ProfileState>(
//         listener: (context, state) {
//           // if (state is SocialCoverImagePickedSuccessfulState) {
//           //   SocialAppCubit.get(context).uploadCoverImage(
//           //       name: nameController.text,
//           //       phone: phoneController.text,
//           //       bio: bioController.text);
//           // } else if (state is SocialProfileImagePickedSuccessfulState) {
//           //   SocialAppCubit.get(context).uploadProfileImage(
//           //       name: nameController.text,
//           //       phone: phoneController.text,
//           //       bio: bioController.text);
//           // } else if (state is SocialProfileImageCameraPickedSuccessfulState) {
//           //   SocialAppCubit.get(context).uploadProfileImageCamera(
//           //       name: nameController.text,
//           //       phone: phoneController.text,
//           //       bio: bioController.text);
//           // }else if (state is SocialCoverImageCameraPickedSuccessfulState){
//           //
//           //   SocialAppCubit.get(context).uploadCoverImageCamera(
//           //       name: nameController.text,
//           //       phone: phoneController.text,
//           //       bio: bioController.text);
//           // }
//         },
//         builder: (context, state) {
//           // var userModel = SocialAppCubit.get(context).model;
//           // var profileImage = SocialAppCubit.get(context).profileImage;
//           // var profileImageCamera = SocialAppCubit.get(context).profileImageCamera;
//           // var coverImage = SocialAppCubit.get(context).coverImage;
//           // nameController.text = userModel!.name!;
//           // bioController.text = userModel.bio!;
//           // phoneController.text = userModel.phone!;
//
//           return Scaffold(
//               appBar: AppBar(
//                 title: const Text('Edit profile'),
//                 actions: [
//                   TextButton(
//                       onPressed: () {
//                         if (formKey.currentState!.validate()) {
//                           // SocialAppCubit.get(context).updateUserData(
//                           //     name: nameController.text,
//                           //     phone: phoneController.text,
//                           //     bio: bioController.text);
//                         }
//                       },
//                       child: const Text(
//                         'UPDATE   ',
//                         style: TextStyle(
//                           fontSize: 18,
//                         ),
//                       ))
//                 ],
//               ),
//               body: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                 child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       children: [
//                         // if (state is SocialUpdateUserDataLoadingState ||
//                         //     state is SocialProfileImagePickedSuccessfulState ||
//                         //     state is SocialCoverImagePickedSuccessfulState ||
//                         //     state is SocialProfileImageCameraPickedSuccessfulState ||
//                         //     state is SocialCoverImageCameraPickedSuccessfulState
//                         // )
//                         const LinearProgressIndicator(),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           height: 300,
//                           child: Stack(
//                             alignment: Alignment.bottomCenter,
//                             children: [
//                               Stack(
//                                 alignment: const Alignment(-1, .6),
//                                 children: [
//                                   // Align(
//                                   //   alignment: Alignment.topCenter,
//                                   //   child: GestureDetector(
//                                   //       onTap: () {
//                                   //         Navigator.push(
//                                   //             context,
//                                   //             MaterialPageRoute(
//                                   //               builder: (context) =>
//                                   //                   CoverImageShow(),
//                                   //             ));
//                                   //       },
//                                   //       child:cover(context)
//                                   //   ),
//                                   // ),
//                                   GestureDetector(
//                                     child: const CircleAvatar(
//                                       radius: 25.0,
//                                       backgroundColor: Colors.white,
//                                       child: Icon(
//                                         Icons.camera_alt_outlined,
//                                         size: 30,
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                     onTap: () {
//                                       showDialog<String>(
//                                         context: context,
//                                         builder: (BuildContext context) =>
//                                             Dialog(
//                                           child: Column(
//                                             mainAxisSize: MainAxisSize.min,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: <Widget>[
//                                               const SizedBox(height: 15),
//                                               TextButton(
//                                                   onPressed: () {
//                                                     // SocialAppCubit.get(context)
//                                                     //     .getCoverImage();
//                                                     // Navigator.pop(context);
//                                                   },
//                                                   child: const Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       Text(
//                                                           'Image from gallery'),
//                                                       SizedBox(
//                                                         width: 5,
//                                                       ),
//                                                       Icon(Icons.photo_library)
//                                                     ],
//                                                   )),
//                                               const SizedBox(height: 5),
//                                               TextButton(
//                                                   onPressed: () {
//                                                     // SocialAppCubit.get(context)
//                                                     //     .getCoverImageCamera();
//                                                     // Navigator.pop(context);
//                                                   },
//                                                   child: const Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       Text('Take a photo'),
//                                                       SizedBox(
//                                                         width: 5,
//                                                       ),
//                                                       Icon(Icons.camera)
//                                                     ],
//                                                   )),
//                                               const SizedBox(height: 15),
//                                             ],
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   )
//                                 ],
//                               ),
//                               Stack(
//                                 alignment: const Alignment(-.9, .8),
//                                 children: [
//                                   // GestureDetector(
//                                   //   child: CircleAvatar(
//                                   //       radius: 85,
//                                   //       backgroundColor: Colors.white,
//                                   //       child: profile(context)),
//                                   //   onTap: () {
//                                   //     // Navigator.push(
//                                   //     //     context,
//                                   //     //     MaterialPageRoute(
//                                   //     //       builder: (context) =>
//                                   //     //           ProfileImageShow(),
//                                   //     //     ));
//                                   //     print('ahmed');
//                                   //   },
//                                   // ),
//                                   GestureDetector(
//                                     child: const CircleAvatar(
//                                       backgroundColor: Colors.white,
//                                       child: Icon(
//                                         Icons.camera_alt_outlined,
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                     onTap: () {
//                                       showDialog<String>(
//                                         context: context,
//                                         builder: (BuildContext context) =>
//                                             Dialog(
//                                           child: Column(
//                                             mainAxisSize: MainAxisSize.min,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: <Widget>[
//                                               const SizedBox(height: 15),
//                                               TextButton(
//                                                   onPressed: () {
//                                                     // SocialAppCubit.get(context)
//                                                     //     .getProfileImage();
//                                                     // Navigator.pop(context);
//                                                   },
//                                                   child: const Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       Text(
//                                                           'Image from gallery'),
//                                                       SizedBox(
//                                                         width: 5,
//                                                       ),
//                                                       Icon(Icons.photo_library)
//                                                     ],
//                                                   )),
//                                               const SizedBox(height: 5),
//                                               TextButton(
//                                                   onPressed: () {
//                                                     // SocialAppCubit.get(context)
//                                                     //     .getProfileImageCamera();
//                                                     // Navigator.pop(context);
//                                                   },
//                                                   child: const Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       Text('Take a photo'),
//                                                       SizedBox(
//                                                         width: 5,
//                                                       ),
//                                                       Icon(Icons.camera)
//                                                     ],
//                                                   )),
//                                               const SizedBox(height: 15),
//                                             ],
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         defaultTextFormField(
//                             controll: nameController,
//                             type: TextInputType.name,
//                             labelText: 'Name',
//                             prefixIcon: Icons.person,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Name must not be empty';
//                               } else if (value.length > 30) {
//                                 return 'Your name could n\'t be more than 30 characters';
//                               }
//                               return null;
//                             },
//                             onSubmit: (value) {
//                               if (formKey.currentState!.validate()) {
//                                 // SocialAppCubit.get(context).updateUserData(
//                                 //     name: nameController.text,
//                                 //     phone: phoneController.text,
//                                 //     bio: bioController.text);
//                               }
//                             }),
//                         const SizedBox(
//                           height: 10.0,
//                         ),
//                         defaultTextFormField(
//                             controll: phoneController,
//                             type: TextInputType.phone,
//                             labelText: 'Phone',
//                             prefixIcon: Icons.phone,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'phone number must not be empty';
//                               }
//                               return null;
//                             },
//                             onSubmit: (value) {
//                               if (formKey.currentState!.validate()) {
//                                 // SocialAppCubit.get(context).updateUserData(
//                                 //     name: nameController.text,
//                                 //     phone: phoneController.text,
//                                 //     bio: bioController.text);
//                               }
//                             }),
//                         const SizedBox(
//                           height: 10.0,
//                         ),
//                         defaultTextFormField(
//                             controll: bioController,
//                             type: TextInputType.text,
//                             labelText: 'Bio',
//                             prefixIcon: Icons.info,
//                             onSubmit: (value) {
//                               // SocialAppCubit.get(context).updateUserData(
//                               //     name: nameController.text,
//                               //     phone: phoneController.text,
//                               //     bio: bioController.text);
//                             }),
//                         const SizedBox(
//                           height: 50,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius:
//                                 BorderRadiusDirectional.circular(20.0),
//                           ),
//                           clipBehavior: Clip.antiAlias,
//                           height: 50.0,
//                           width: double.infinity,
//                           child: TextButton(
//                             onPressed: () {
//                               // CacheHelper.removeData(key: 'uId').then((value) {
//                               //   if(value){
//                               //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SocialLogin(),), (route) => false);
//                               //   }
//                               // });
//                             },
//                             child: const Text(
//                               'Log Out',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ));
//         },
//       ),
//     );
//   }
//
// // Widget profile(context) {
// //   if (SocialAppCubit.get(context).profileImageCamera != null) {
// //     return CircleAvatar(
// //       radius: 80,
// //       backgroundImage: FileImage(SocialAppCubit.get(context).profileImageCamera!),
// //     );
// //
// //   } else if (SocialAppCubit.get(context).profileImage != null) {
// //     return CircleAvatar(
// //       radius: 80,
// //       backgroundImage: FileImage(SocialAppCubit.get(context).profileImage!),
// //     );
// //   } else {
// //     return CircleAvatar(
// //       radius: 80,
// //       backgroundImage: NetworkImage('${SocialAppCubit.get(context).model!.image}'),
// //     );
// //   }
// // }
// //
// //
// // Widget cover(context) {
// //
// //   if (SocialAppCubit.get(context).coverImageCamera != null) {
// //     return Container(
// //       height: 250,
// //       width: double.infinity,
// //       decoration: BoxDecoration(
// //         image: DecorationImage(
// //             image: FileImage(SocialAppCubit.get(context).coverImageCamera!),
// //             fit: BoxFit.cover),
// //         borderRadius: BorderRadius.only(
// //             topLeft: Radius.circular(4.0),
// //             topRight:
// //             Radius.circular(4.0)),
// //       ),
// //     );
// //
// //   } else if (SocialAppCubit.get(context).coverImage != null) {
// //     return Container(
// //       height: 250,
// //       width: double.infinity,
// //       decoration: BoxDecoration(
// //         image: DecorationImage(
// //             image: FileImage(SocialAppCubit.get(context).coverImage!),
// //             fit: BoxFit.cover),
// //         borderRadius: BorderRadius.only(
// //             topLeft: Radius.circular(4.0),
// //             topRight:
// //             Radius.circular(4.0)),
// //       ),
// //     );
// //
// //   } else {
// //     return Container(
// //       height: 250,
// //       width: double.infinity,
// //       decoration: BoxDecoration(
// //         image: DecorationImage(
// //             image: NetworkImage(
// //                 '${SocialAppCubit.get(context).model!.cover}'),
// //             fit: BoxFit.cover),
// //         borderRadius: BorderRadius.only(
// //             topLeft: Radius.circular(4.0),
// //             topRight:
// //             Radius.circular(4.0)),
// //       ),
// //     );
// //   }
// // }
// }
// //
// // class CoverImageShow extends StatelessWidget {
// //   const CoverImageShow({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocConsumer<SocialAppCubit, SocialAppStates>(
// //       listener: (context, state) {},
// //       builder: (context, state) {
// //         return PhotoView(
// //           imageProvider:
// //           NetworkImage('${SocialAppCubit.get(context).model!.cover}'),
// //         );
// //       },
// //     );
// //   }
// // }
// //
// // class ProfileImageShow extends StatelessWidget {
// //   const ProfileImageShow({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocConsumer<SocialAppCubit, SocialAppStates>(
// //       listener: (context, state) {},
// //       builder: (context, state) {
// //         return PhotoView(
// //           imageProvider:
// //           NetworkImage('${SocialAppCubit.get(context).model!.image}'),
// //         );
// //       },
// //     );
// //   }
// // }
// //
// // class PostImageShow extends StatelessWidget {
// //   const PostImageShow({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocConsumer<SocialAppCubit, SocialAppStates>(
// //       listener: (context, state) {},
// //       builder: (context, state) {
// //         return PhotoView(
// //           imageProvider: FileImage(SocialAppCubit.get(context).postImage!),
// //         );
// //       },
// //     );
// //   }
// // }
// //
// // class PostImageCameraShow extends StatelessWidget {
// //   const PostImageCameraShow({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocConsumer<SocialAppCubit, SocialAppStates>(
// //       listener: (context, state) {},
// //       builder: (context, state) {
// //         return PhotoView(
// //           imageProvider:
// //           FileImage(SocialAppCubit.get(context).postImageCamera!),
// //         );
// //       },
// //     );
// //   }
// // }
// //
//
// Widget defaultTextFormField({
//   required TextEditingController controll,
//   required TextInputType type,
//   String? Function(String?)? validator,
//   String? Function(String?)? onSubmit,
//   required String labelText,
//   required IconData prefixIcon,
//   IconData? suffixIcon,
//   VoidCallback? onpress,
//   VoidCallback? onTap,
//   String? Function(String?)? onchange,
//   bool scure = false,
// }) =>
//     TextFormField(
//       controller: controll,
//       keyboardType: type,
//       obscureText: scure,
//       onChanged: onchange,
//       onFieldSubmitted: onSubmit != null
//           ? (value) => onSubmit(value)
//           : (value) {
//               return;
//             },
//       validator: validator != null
//           ? (value) => validator(value)
//           : (value) {
//               return null;
//             },
//       onTap: onTap,
//       decoration: InputDecoration(
//         labelText: labelText,
//         prefixIcon: Icon(prefixIcon),
//         suffixIcon: suffixIcon != null
//             ? IconButton(
//                 onPressed: onpress,
//                 icon: Icon(suffixIcon),
//               )
//             : null,
//         border: const OutlineInputBorder(),
//       ),
//     );
