import 'package:cure/feature/select_field/presentation/views/widgets/select_field_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/snack_bar_back.dart';

class SelectFieldView extends StatelessWidget {
  const SelectFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: doubleTap(widget: const SelectFieldViewBody()),
    );
  }
}



