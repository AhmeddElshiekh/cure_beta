part of 'select_field_cubit.dart';

@immutable
abstract class SelectFieldState {}

class SelectFieldInitial extends SelectFieldState {}

class SelectPatientSuccess extends SelectFieldState {}

class SelectPatientError extends SelectFieldState {}

class SelectNurseSuccess extends SelectFieldState {}

class SelectNurseError extends SelectFieldState {}

class Selected extends SelectFieldState {}


class SelectXEqualOne extends SelectFieldState {}
class SelectXEqualZero extends SelectFieldState {}
