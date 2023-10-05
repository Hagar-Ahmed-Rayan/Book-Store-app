import 'package:bookstore/presentation/ProfileScreen/models/userprofileModel/UserProfileModel.dart';
import 'package:bookstore/presentation/UpdateProfile/models/UpdateprofileModel/UserProfileModel.dart';
import 'package:bookstore/presentation/UpdateProfile/models/governmodel/GovernModel.dart';

abstract class UpdateProfileStates {}
class UpdateProfileInitialState extends  UpdateProfileStates{}
class UpdateProfileLoadingState extends   UpdateProfileStates{}
class UpdateProfileSuccessState extends   UpdateProfileStates
{  final UpdateProfileModel   userprofilemodel;

UpdateProfileSuccessState(this.userprofilemodel);
}

class UpdateProfileErrorState extends   UpdateProfileStates
{
  final String error;
  UpdateProfileErrorState(this.error);
}
//change city
class ChangeCitySuccessstate extends   UpdateProfileStates{}
/// git govern states
class GetGovernLoadingState extends   UpdateProfileStates{}
class GetGovernSuccessState extends   UpdateProfileStates
{  final GovernModel   governmodel;

GetGovernSuccessState(this.governmodel);
}

class GetGovernErrorState extends   UpdateProfileStates
{
  final String error;
  GetGovernErrorState(this.error);
}

///PLACE ORDER STATES
class PlaceOrdertLoadingState extends   UpdateProfileStates{}
class PlaceOrderSuccessState extends   UpdateProfileStates
{


}
class PlaceOrderErrorState extends   UpdateProfileStates
{
  String error;
  PlaceOrderErrorState(this.error);
}
