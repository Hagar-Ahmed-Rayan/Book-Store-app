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
      print("Error in sign in");
      print(" ${error.toString()}");
      if (error is DioError) {
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
      } else {
        print(error);
      }
      emit(SignInErrorState(error.toString()));
    });






  }





}