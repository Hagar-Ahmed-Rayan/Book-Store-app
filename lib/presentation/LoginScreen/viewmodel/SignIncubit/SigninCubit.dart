import 'package:bookstore/core/Api.dart';
import 'package:bookstore/core/cache_helper.dart';
import 'package:bookstore/core/dio_helper.dart';
import 'package:bookstore/presentation/LoginScreen/model/SignUpModel/SignUpModel.dart';
import 'package:bookstore/presentation/LoginScreen/viewmodel/SignIncubit/SignInStates.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';




class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());
  static SignInCubit get(context) => BlocProvider.of(context);
  bool iskeepsigninSelected = false;

  void changeGenderSelection(bool value) {
    iskeepsigninSelected = value;
    emit(keepsigninSelectionChangedState(iskeepsigninSelected));
  }

  SignUpModel ? signinModel;

  void SignIn
      (
      String email,
      String password,
          ) {

    emit(SignInLoadingState());

    DioHelper.postData(
      url: ApiConst.SIGNIN,
      token: CacheHelper.getData(key: "token"),
      data: {
        'email': email,
        'password':password,
      },
    ).then((response) {
      print("in sign IN responseeeeeeeeeee");
      signinModel = SignUpModel.fromJson(response.data);
      print("in sign  in sucessssssss");

      print(response.data);
      CacheHelper.saveData(key:"token", value:response.data['data']['token']);

      emit(SignInSuccessState(signinModel!));
    }).catchError((error){
      String ?emailError;

      print("Error in sign in");
      print(" ${error.toString()}");
      if (error is DioError) {
        print(error.response);
        if(error.response?.statusCode == 422) {
          final responseData = error.response?.data;

          if (responseData != null && responseData.containsKey('errors')) {
            final errors = responseData['errors'];
            if (errors is Map && errors.containsKey('email')) {
              emailError = errors['email'][0];
              print("Email Error: $emailError");
              Fluttertoast.showToast(
                msg: emailError!,
                backgroundColor: Colors.red,
              );
            }
          }

          else if (responseData != null && responseData.containsKey('message')){
            final msg = responseData['message'];
            Fluttertoast.showToast(
              msg: msg!,
              backgroundColor: Colors.red,
            );

          }
        }
        if (error.response != null) {
          print(error.response!.data);
          print(error.response!.statusCode);
          print(error.response!.statusMessage);

          Map<String, dynamic> data = error.response!.data;

          /*   if (error.response!.data.containsKey("email")) {
              print("heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeere");

              List<String> emailErrors = List<String>.from(data["email"]);
              // Access the email error messages here
              for (String error in emailErrors) {
                print("Email Error: $error");
              }
            }

            if (data.containsKey("phone")) {
              List<String> phoneErrors = List<String>.from(data["phone"]);
              // Access the phone error messages here
              for (String error in phoneErrors) {
                print("Phone Error: $error");
              }

          }*/
          Fluttertoast.showToast(
            msg: error.response!.statusMessage!,
            backgroundColor: Colors.red,
          );
          //  print(error.response!.headers);
        } else {
          print(error.requestOptions);
          print(error.message);
        }
      }





      else {
        print(error);
      }
      emit(SignInErrorState(error.toString()));
    });






  }





}