import 'package:bookstore/presentation/ProfileScreen/models/userprofileModel/UserProfileModel.dart';

abstract class ProfileStates {}
class ProfileInitialState extends  ProfileStates{}
class ProfileLoadingState extends   ProfileStates{}
class ProfileSuccessState extends   ProfileStates
{  final UserProfileModel   userprofilemodel;

  ProfileSuccessState(this.userprofilemodel);
}

class ProfileErrorState extends   ProfileStates
{
  final String error;
  ProfileErrorState(this.error);
}
