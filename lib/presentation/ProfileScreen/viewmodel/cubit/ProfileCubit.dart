import 'package:bloc/bloc.dart';
import 'package:bookstore/core/Api.dart';
import 'package:bookstore/core/cache_helper.dart';
import 'package:bookstore/core/dio_helper.dart';
import 'package:bookstore/presentation/ProfileScreen/models/userprofileModel/UserProfileModel.dart';
import 'package:bookstore/presentation/ProfileScreen/viewmodel/cubit/ProfileStates.dart';
import 'package:bookstore/presentation/register_screen/view_model/cubit/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());
  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);

  UserProfileModel ? userprofilemodel;
void GetUserProfile(){

  print(CacheHelper.getData(key: "token"));
  emit(ProfileLoadingState());
  DioHelper.getData(

      url:ApiConst.GETPROFILE,
      token:CacheHelper.getData(key: "token"),

  ).then((response) {
    print("in profile  sucesssssssssssssssssssssssssss");
    print(response.data);

    userprofilemodel = UserProfileModel.fromJson(response.data);


    emit(ProfileSuccessState(userprofilemodel!));

  }).catchError(
          (error){
            print("Error in get profile");
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
            emit(ProfileErrorState(error.toString()));




  });

}

}
