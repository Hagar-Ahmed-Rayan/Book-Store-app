
import 'dart:io';

import 'package:bookstore/presentation/ProfileScreen/models/Logoutmodel/LogoutModel.dart';
import 'package:bookstore/presentation/ProfileScreen/models/userprofileModel/UserProfileModel.dart';

abstract class HomeStates {}
class HomeInitialState extends  HomeStates{}
class HomeLoadingState extends   HomeStates{}
class HomeSuccessState extends   HomeStates
{


}
class HomeErrorState extends   HomeStates
{
  String error;
  HomeErrorState(this.error);
}
////////////////////best sellerv states
class BestSellerLoadingState extends   HomeStates{}
class BestSellerSuccessState extends   HomeStates{}
class BestSellerErrorState extends   HomeStates{
  String error;
  BestSellerErrorState(this.error);
}
//get categories states
class CategoriesLoadingState extends   HomeStates{}
class CategoriesSuccessState extends   HomeStates{}
class CategoriesErrorState extends   HomeStates{
  String error;
  CategoriesErrorState(this.error);
}


///get arrivals
class ArrivalsLoadingState extends   HomeStates{}
class ArrivalsSuccessState extends   HomeStates{}
class ArrivalsErrorState extends   HomeStates{
  String error;
  ArrivalsErrorState(this.error);
}


////profile
class ProfileLoadingState extends   HomeStates{}
class ProfileSuccessState extends   HomeStates
{  final UserProfileModel   userprofilemodel;

ProfileSuccessState(this.userprofilemodel);
}

class ProfileErrorState extends   HomeStates
{
  final String error;
  ProfileErrorState(this.error);
}
///LOG OUT


class LogoutLoadingState extends   HomeStates{}
class LogoutSuccessState extends   HomeStates
{  final LogoutModel   logoutmodel;

LogoutSuccessState(this.logoutmodel);
}

class LogoutErrorState extends   HomeStates
{
  final String error;
  LogoutErrorState(this.error);}


///change image
class ProfileImagePickedState extends HomeStates {
  final File image;

  ProfileImagePickedState(this.image);
}