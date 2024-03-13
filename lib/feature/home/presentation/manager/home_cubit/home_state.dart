part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangeBottomNavBar extends HomeState {}


class HomeServicesSuccess extends HomeState {}
class HomeServicesError extends HomeState {}
class HomeServicesLoading extends HomeState {}


class HomeDoctorSuccess extends HomeState {}
class HomeDoctorError extends HomeState {}
class HomeDoctorLoading extends HomeState {}
//
// class SendMessageLoadingState extends HomeState {}
// class SendMessageSuccessState extends HomeState {}
// class SendMessageErrorState extends HomeState {}
//
//
// class GetMessageLoadingState extends HomeState {}
// class GetMessageSuccessState extends HomeState {}
// class GetMessageErrorState extends HomeState {}


