import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bookstore/core/Api.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/core/cache_helper.dart';
import 'package:bookstore/core/dio_helper.dart';
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





class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());


  // final Dio dio = Dio();

  static CartCubit get(context) => BlocProvider.of<CartCubit>(context);
  //get cart items
  CartModel? cartmodel;

  void GetCart(){
    emit(GetCartLoadingState());
    DioHelper.getData(
      url: ApiConst.SHOWCART,
      token:CacheHelper.getData(key: "token"),


    ).then((response) {

      cartmodel = CartModel.fromJson(response.data);
      print("GET ALL cart DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
      print(response.data);
      if(cartmodel!.data!=null) {
        if(cartmodel!.data!.cartItems?.isEmpty==true) {
          print("Cart is empty");

        }
        else  if(cartmodel!.data!.cartItems?.isEmpty==false) {
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



      emit(GetCartSuccessState());
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr IN GET cart");
      //   print(error.response);
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(GetCartErrorState(error.toString()));
    });
  }
  //ADD TO CART
  void AddToCart(String productId){
    emit(AddToCartLoadingState());
    DioHelper.postData(
      url: ApiConst.ADDTOCART,
      data: {
        'product_id':productId,
      },

      token:CacheHelper.getData(key: "token"),


    ).then((response) {

      cartmodel = CartModel.fromJson(response.data);
      print("add to  cart DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
      print(response.data);
Fluttertoast.showToast(

    msg: 'item sucessfully added to cart',
  backgroundColor: Colors.green,
);
      GetCart();

      emit(AddToCartSuccessState(cartmodel!));
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr IN GET cart");
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(AddToCartErrorState(error.toString()));
    });
  }
  //DELETE CART



  void RemoveFromCart(
      int? productId
      ){
    print( productId);
    emit(RemoveCartLoadingState());
    DioHelper.postData(
      url: ApiConst.DELETECART,

      data: {
        'cart_item_id' : productId,
      },

      token:CacheHelper.getData(key: "token"),


    ).then((response) {

      cartmodel = CartModel.fromJson(response.data);
      print("delete from  cart DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
      print(response.data);
      Fluttertoast.showToast(

        msg: 'item sucessfully deleted fromcart',
        backgroundColor: Colors.green,
      );
      GetCart();

      emit(RemoveCartSuccessState(cartmodel!));
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr delete from cart");
    //  GetCart();

      print("Error: $error");
      print(error.toString());
      if (error is DioError && error.response?.statusCode == 422) {
        print(error.response);
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }

      emit(RemoveCartErrorState(error.toString()));
    });
  }
//update cart
  void UpdateCart(
     String productId,
      String quantity
      ){
    print("this is update idddddddddddddd");
    GetCart();

    print(productId);
    emit(UpdateCartLoadingState());
    DioHelper.postData(
      url: ApiConst.UPDATECART,

      data: {
        'cart_item_id' : productId,
        'quantity':quantity
      },

      token:CacheHelper.getData(key: "token"),


    ).then((response) {

      cartmodel = CartModel.fromJson(response.data);
      print("update  cart DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
      print(response.data);
      Fluttertoast.showToast(

        msg: 'item sucessfully updated',
        backgroundColor: Colors.green,
      );
      GetCart();

      emit(UpdateCartSuccessState(cartmodel!));
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr update from cart");
      print("Error: $error");
      print(error.toString());
      if (error is DioError && error.response?.statusCode == 422) {
        print(error.response);
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      else if (error is DioError && error.response?.statusCode == 404) {
        print(error.response);
        Fluttertoast.showToast(
            msg: error.response!.statusMessage!,
          backgroundColor: Colors.red

        );
      }

      emit(UdateCartErrorState(error.toString()));
    });
  }
}
