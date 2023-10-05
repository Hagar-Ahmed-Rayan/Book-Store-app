
import 'package:bloc/bloc.dart';
import 'package:bookstore/core/Api.dart';
import 'package:bookstore/core/SharedFunctions.dart';
import 'package:bookstore/core/cache_helper.dart';
import 'package:bookstore/core/dio_helper.dart';
import 'package:bookstore/presentation/Checkout/models/PlaceOrderModel/PlaceOrderModel.dart';
import 'package:bookstore/presentation/Checkout/viewmodel/CheckoutStates.dart';
import 'package:bookstore/presentation/ProfileScreen/models/userprofileModel/UserProfileModel.dart';
import 'package:bookstore/presentation/ProfileScreen/viewmodel/cubit/ProfileCubit.dart';
import 'package:bookstore/presentation/ProfileScreen/viewmodel/cubit/ProfileStates.dart';
import 'package:bookstore/presentation/ProfileScreen/views/UserProfileScreen.dart';
import 'package:bookstore/presentation/UpdateProfile/models/UpdateprofileModel/UserProfileModel.dart';
import 'package:bookstore/presentation/UpdateProfile/models/governmodel/GovernModel.dart';
import 'package:bookstore/presentation/UpdateProfile/viewmodel/updateprofileStates.dart';
import 'package:bookstore/presentation/cart/viewmodel/Cartcubit.dart';
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


  PlaceOrderModel? placeordermodel;

  void PlaceOrder(String name,String id,String phone,String address,String email){
    print("PlaceOrdertLoadingStatesssssssssssssssssssssssss");
    emit(PlaceOrdertLoadingState());
    DioHelper.postData(
      url: ApiConst.PLACEORDER,
      data: {
        'name':name,
        'governorate_id':id,
        'phone':phone,
        'address':address,
        'email':email

      },
      token:CacheHelper.getData(key: "token"),


    ).then((response) {

      placeordermodel = PlaceOrderModel.fromJson(response.data);
      print("place order DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
      print(response.data);
    /* Fluttertoast.showToast(msg: "Order Placed",
          backgroundColor: Colors.green
      );*/
      //   Navigator.pop(context);
      //showPopupMessage(context, 'Done');


      emit(PlaceOrderSuccessState());
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr place order");
      print(error.response);

      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      if (error is DioError && error.response?.statusCode == 404) {
        final responseData = error.response?.data;

        Fluttertoast.showToast(msg: error.response!.statusMessage.toString(),
            backgroundColor: Colors.orange
        );
        ///////get cart items products



      }

      emit(PlaceOrderErrorState(error.toString()));
    });
  }

}
