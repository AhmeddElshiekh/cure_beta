import 'package:cure/core/utils/constant.dart';
import 'package:cure/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:cure/feature/home/presentation/views/doctors_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var data = BlocProvider.of<HomeCubit>(context).data;

        return ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorsView(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 20, end: 20, top: 10),
                child: Container(
                  height: 170,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(10)),
                    color: mainColor,
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: 180,
                              child: Text(
                                '${data[index]['text']}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade100,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  fixedSize: const Size(100, 50)),
                              onPressed: () {},
                              child: Text(
                                '${data[index]['price']}',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Card(
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          '${data[index]['image']}',
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: data.length,
        );
      },
    );
  }
}
