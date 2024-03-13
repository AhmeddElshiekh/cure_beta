import 'package:cure/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:cure/feature/profile/presentaion/manager/profile_cubit/profile_cubit.dart';
import 'package:cure/feature/profile/presentaion/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          var profileCubit = BlocProvider.of<ProfileCubit>(context);
          return Scaffold(
              body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 300,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const Stack(
                          alignment: Alignment(-1, .6),
                          children: [
                            // Align(
                            //   alignment: Alignment.topCenter,
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       // Navigator.push(context, MaterialPageRoute(builder: (context) =>CoverImageShow(),));
                            //     },
                            //     child: Container(
                            //       height: 250,
                            //       width: double.infinity,
                            //       decoration: BoxDecoration(
                            //         image: DecorationImage(
                            //             image:
                            //                 NetworkImage('${userModel!.cover}'),
                            //             fit: BoxFit.cover),
                            //         borderRadius: const BorderRadius.only(
                            //             topLeft: Radius.circular(4.0),
                            //             topRight: Radius.circular(4.0)),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        GestureDetector(
                          child: const CircleAvatar(
                            radius: 85,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 80,
                              // backgroundImage: NetworkImage('${userModel.image}'),
                            ),
                          ),
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(
                            //     builder: (context) => ProfileImageShow()));
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'userModel.name',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'userModel.bio',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        child: const Column(
                          children: [
                            Text(
                              '100',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Posts',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Column(
                        children: [
                          Text(
                            '208',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Photos',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        children: [
                          Text(
                            '10k',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Follower',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        children: [
                          Text(
                            '1k',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Following',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => EditProfileScreen(),
                              //     ));
                              profileCubit.signOut().then((value) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const OnboardingView(),
                                    ),
                                    (route) => false);
                              });
                            },
                            child: const Text(
                              'Sign Out',
                              style: TextStyle(fontSize: 18),
                            ))),
                  ),
                  // LikeButton(
                  //   size: 50,
                  //   circleColor:
                  //   CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  //   bubblesColor: BubblesColor(
                  //     dotPrimaryColor: Color(0xff33b5e5),
                  //     dotSecondaryColor: Color(0xff0099cc),
                  //   ),
                  //   likeBuilder: (bool isLiked) {
                  //     return Icon(
                  //       Icons.thumb_up_off_alt_rounded,
                  //       color: isLiked ? Colors.blue : Colors.grey,
                  //       size: 50,
                  //     );
                  //   },
                  //   likeCount: 665,
                  //
                  // ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
