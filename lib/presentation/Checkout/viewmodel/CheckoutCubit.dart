import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bookstore/core/Api.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/core/cache_helper.dart';
import 'package:bookstore/core/dio_helper.dart';
import 'package:bookstore/presentation/Checkout/models/CheckoutModel/CheckOutModel.dart';
import 'package:bookstore/presentation/Checkout/models/PlaceOrderModel/PlaceOrderModel.dart';
import 'package:bookstore/presentation/Checkout/viewmodel/CheckoutStates.dart';
import 'package:bookstore/presentation/ProductsScreen/models/ProductModel/ProductModel.dart';
import 'package:bookstore/presentation/ProductsScreen/models/ProductModel/Products.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksStates.dart';
import 'package:bookstore/presentation/cart/models/cartmodel/CartModel.dart';
import 'package:bookstore/presentation/cart/viewmodel/CartStates.dart';
import 'package:bookstore/presentation/favourite/models/FavouriteModel/FavouriteModel.dart';
import 'package:bookstore/presentation/favourite/viewmodel/FavouriteStates.dart';
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





class CheckoutCubit extends Cubit<CheckoutStates> {
  CheckoutCubit() : super(CheckoutInitialState());


  // final Dio dio = Dio();

  static CheckoutCubit get(context) => BlocProvider.of<CheckoutCubit>(context);

  CheckOutModel? checkoutmodel;
  void GetCheckout(){
    emit(CheckoutLoadingState());
    DioHelper.getData(
      url: ApiConst.CHECKOUT,
      token:CacheHelper.getData(key: "token"),


    ).then((response) {

      checkoutmodel = CheckOutModel.fromJson(response.data);
      print("GET checkout DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
      print(response.data);
      if(checkoutmodel!.data!=null) {
        if(checkoutmodel!.data!.cartItems?.isEmpty==true) {
          print("Cart is empty");

        }
        else  if(checkoutmodel!.data!.cartItems?.isEmpty==false) {
          print("cart is full");
          /*for (var item in favouritemodel!.data!.product!) {
            try {
              favourites.add((item));
            } catch (e) {
              favourites.add((item));
            }
          }

          for (var item in favouritemodel!.data!.product!) {
            try {
              favouritesIds.add((item.id).toString());
            } catch (e) {
              favouritesIds.add((item.id).toString());
            }
          }*/




        }
      }



      emit(CheckoutSuccessState());
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr checkout");
      //   print(error.response);
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(CheckoutErrorState(error.toString()));
    });
  }



}
