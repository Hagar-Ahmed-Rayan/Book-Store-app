import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bookstore/core/Api.dart';
import 'package:bookstore/presentation/register_screen/model/SignUpModel/SignUpModel.dart';
import 'package:bookstore/presentation/register_screen/view_model/cubit/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/dio_helper.dart';




class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());


 // final Dio dio = Dio();

  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);
  SignUpModel ? singupModel;
  void addRegister({required String name,required String email,
   required String password,required String ConfirmPassword})
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: ApiConst.SIGNUP,
      data: {
        'name':name,
        'email':email,
        'password':password,
        'password_confirmation':ConfirmPassword
      },

    ).then((value) {
      singupModel = SignUpModel.fromJson(value.data);

      // singupModel=SingupModel.fromJson(value.data);
      print(value.data['data']['token']);
       CacheHelper.saveData(key:"token", value:value.data['data']['token']);
      print(CacheHelper.getData(key: 'token'));
      emit(RegisterSuccessState());
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr");
      print(error.response);
      print("Error: $error");
      String ?emailError;
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
          if (errors is Map && errors.containsKey('email')) {
             emailError = errors['email'][0];
            print("Email Error: $emailError");
          }
        }
        Fluttertoast.showToast(
          msg: emailError!,
          backgroundColor: Colors.red,
        );



      }
      emit(RegisterErrorState());
    });
  }




}
