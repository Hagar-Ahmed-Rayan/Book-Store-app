
import 'package:bloc/bloc.dart';
import 'package:bookstore/core/Api.dart';
import 'package:bookstore/core/SharedFunctions.dart';
import 'package:bookstore/core/cache_helper.dart';
import 'package:bookstore/core/dio_helper.dart';
import 'package:bookstore/presentation/ProfileScreen/models/userprofileModel/UserProfileModel.dart';
import 'package:bookstore/presentation/ProfileScreen/viewmodel/cubit/ProfileCubit.dart';
import 'package:bookstore/presentation/ProfileScreen/viewmodel/cubit/ProfileStates.dart';
import 'package:bookstore/presentation/ProfileScreen/views/UserProfileScreen.dart';
import 'package:bookstore/presentation/UpdateProfile/models/UpdateprofileModel/UserProfileModel.dart';
import 'package:bookstore/presentation/UpdateProfile/models/governmodel/GovernModel.dart';
import 'package:bookstore/presentation/UpdateProfile/viewmodel/updateprofileStates.dart';
import 'package:bookstore/presentation/register_screen/view_model/cubit/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileStates> {
  UpdateProfileCubit() : super(UpdateProfileInitialState());
  static UpdateProfileCubit get(context) => BlocProvider.of<UpdateProfileCubit>(context);
  String? newcity;
  GovernModel ? governmodel;
  UpdateProfileModel ? userprofilemodel;
  void UpdateUserProfile(String name,String address,String city,String phone){

    print(CacheHelper.getData(key: "token"));
    emit(UpdateProfileLoadingState());
    DioHelper.postData(
      data: {
      'name':name,
        'address':address,
        'city':city,
        'phone':phone,
      },

      url:ApiConst.UPDATEPROFILE,
      token:CacheHelper.getData(key: "token"),

    ).then((response) {
      print("in update profile  sucesssssssssssssssssssssssssss");

      print(response.data);

      userprofilemodel = UpdateProfileModel.fromJson(response.data);


      emit(UpdateProfileSuccessState(userprofilemodel!));

    }).catchError(
            (error){
          print("Error in update profile");
          print(" ${error.toString()}");
          if (error is DioError) {
            if (error.response != null) {
              print(error.response!.data);
              print(error.response!.statusCode);
              print(error.response!.statusMessage);

              Fluttertoast.showToast(
                msg: error.response!.statusMessage!,
                backgroundColor: Colors.red,
              );

              Map<String, dynamic> data = error.response!.data;

              //  print(error.response!.headers);
            } else {
              print(error.requestOptions);
              print(error.message);
            }
          } else {
            print(error);
          }
          emit(UpdateProfileErrorState(error.toString()));




        });

  }
  changeCity(city)
  {
    newcity=city;
    emit(ChangeCitySuccessstate());
  }
  void GetAllGovern(){

    emit(GetGovernLoadingState());
    DioHelper.getData(

      url:ApiConst.GETGOVERN,
      token:CacheHelper.getData(key: "token"),

    ).then((response) {
      print("in get govern  sucesssssssssssssssssssssssssss");
      print(response.data);

      governmodel = GovernModel.fromJson(response.data);

      newcity=governmodel!.data![0].governorateNameEn;
      emit(GetGovernSuccessState(governmodel!));

    }).catchError(
            (error){
          print("Error in get govern");
          print(" ${error.toString()}");
          if (error is DioError) {
            if (error.response != null) {
              print(error.response!.data);
              print(error.response!.statusCode);
              print(error.response!.statusMessage);

              Fluttertoast.showToast(
                msg: error.response!.statusMessage!,
                backgroundColor: Colors.red,
              );

              Map<String, dynamic> data = error.response!.data;

              //  print(error.response!.headers);
            } else {
              print(error.requestOptions);
              print(error.message);
            }
          } else {
            print(error);
          }
          emit(GetGovernErrorState(error.toString()));




        });

  }

}
