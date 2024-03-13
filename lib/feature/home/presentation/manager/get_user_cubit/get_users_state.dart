part of 'get_users_cubit.dart';

@immutable
abstract class GetUsersState {}

class GetUsersInitial extends GetUsersState {}


class GetUsersLoadingState extends GetUsersState {}
class GetUsersSuccessState extends GetUsersState {}
class GetUsersErrorState extends GetUsersState {}