import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bookstore/core/Api.dart';
import 'package:bookstore/core/dio_helper.dart';
import 'package:bookstore/presentation/home/model/BestSellerModel/BestSellerModel.dart';
import 'package:bookstore/presentation/home/model/CategoriesModel/CateogriesModel.dart';
import 'package:bookstore/presentation/home/model/SliderModel/SliderModel.dart';
import 'package:bookstore/presentation/home/model/arrivalsModel/ArrivalsModel.dart';
import 'package:bookstore/presentation/register_screen/view_model/cubit/states.dart';
import 'package:dio/dio.dart';
import 'package:bookstore/presentation/home/viewmodel/HomeStates.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookstore/presentation/LoginScreen/model/SignUpModel/SignUpModel.dart';
import 'package:fluttertoast/fluttertoast.dart';





class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());


  final Dio dio = Dio();

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  //get sliders
  SliderModel? sliderModel;
  void GetSliders(){
    emit(HomeLoadingState());
    DioHelper.getData(
      url: ApiConst.SLIDER,

    ).then((response) {
      sliderModel = SliderModel.fromJson(response.data);

      emit(HomeSuccessState());
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr");
      print(error.response);
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(HomeErrorState(error.toString()));
    });
  }
///get best seller
  BestSellerModel? bestsellerModel;
  void GetBestSeller(){
    emit(BestSellerLoadingState());
    DioHelper.getData(
      url: ApiConst.BESTSELLER,

    ).then((response) {
      bestsellerModel = BestSellerModel.fromJson(response.data);
      print("00000000000000000000000000000000000");
print(response.data['data']);
      print(response.data['data']['products']);

      emit(BestSellerSuccessState());
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr");
      print(error.response);
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(BestSellerErrorState(error.toString()));
    });
  }

//get categories
  CateogriesModel? cateogriesmodel;
  void GetCategories(){
    emit(CategoriesLoadingState());
    DioHelper.getData(
      url: ApiConst.CATEGORIES,

    ).then((response) {
      cateogriesmodel = CateogriesModel.fromJson(response.data);
      print("00000000000000000000000000000000000");
      print(response.data['data']);
      print(response.data['data']['products']);

      emit(CategoriesSuccessState());
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr");
      print(error.response);
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(CategoriesErrorState(error.toString()));
    });
  }
  //GET ARRIVALSE
  ArrivalsModel? arrivalsmodel;
  void GetArrivals(){
    emit(ArrivalsLoadingState());
    DioHelper.getData(
      url: ApiConst.ARRIVALS,

    ).then((response) {
      arrivalsmodel = ArrivalsModel.fromJson(response.data);
      print("00000000000000000000000000000000000");
      print(response.data['data']);
      print(response.data['data']['products']);

      emit(ArrivalsSuccessState());
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr");
      print(error.response);
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(ArrivalsErrorState(error.toString()));
    });
  }
}
