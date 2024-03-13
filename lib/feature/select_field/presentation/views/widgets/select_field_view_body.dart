import 'package:cure/core/utils/cache_helper.dart';
import 'package:cure/core/utils/constant.dart';
import 'package:cure/feature/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:cure/feature/select_field/presentation/manager/select_field_cubit/select_field_cubit.dart';
import 'package:cure/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectFieldViewBody extends StatelessWidget {
  const SelectFieldViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectFieldCubit, SelectFieldState>(
      builder: (context, state) {
        var selectFieldCubit = BlocProvider.of<SelectFieldCubit>(context);
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            var authCubit = BlocProvider.of<AuthCubit>(context);

            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    Assets.imagesLogo,
                    width: 150,
                    height: 250,
                  ),
                  const Spacer(),
                  const Text(
                    'اختر اى نوع انت ؟',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: selectFieldCubit.isSelected
                                ? mainColor
                                : Colors.grey[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * .6, 90)),
                        onPressed: () {
                          selectFieldCubit.selected();
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('تأكيد'),
                              content: const Text('هل أنت متأكد من اختيارك'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    selectFieldCubit
                                        .selectNurse(
                                      context,
                                      name: authCubit.regNameController.text,
                                    )
                                        .then((value) {
                                      selectFieldCubit.xEqualOne();


                                      print(selectFieldCubit.x);
                                    });
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text(
                          'ممرض',
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: selectFieldCubit.isSelected
                            ? Colors.grey[400]
                            : mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * .6, 90)),
                    onPressed: () {
                      selectFieldCubit.selected();
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('تأكيد'),
                          content: const Text('هل أنت متأكد من اختيارك'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                selectFieldCubit
                                    .selectPatient(
                                  context,
                                  name: authCubit.regNameController.text,
                                )
                                    .then((value) {
                                  selectFieldCubit.xEqualZero();

                                });
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      'مريض',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
