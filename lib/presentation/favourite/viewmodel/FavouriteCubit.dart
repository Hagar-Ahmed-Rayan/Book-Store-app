import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bookstore/core/Api.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/core/cache_helper.dart';
import 'package:bookstore/core/dio_helper.dart';
import 'package:bookstore/presentation/ProductsScreen/models/ProductModel/ProductModel.dart';
import 'package:bookstore/presentation/ProductsScreen/models/ProductModel/Products.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksStates.dart';
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





class FavouriteCubit extends Cubit<FavouriteStates> {
  FavouriteCubit() : super(FavouriteInitialState());


  // final Dio dio = Dio();

  static FavouriteCubit get(context) => BlocProvider.of<FavouriteCubit>(context);
  //get favourites
  FavouriteModel? favouritemodel;
  List<Products> favourites=[];
  List<String> favouritesIds=[];
   Color FavColorIcon=Colors.grey;
  void GetFavourites(){
    emit(GetFavouriteLoadingState());
    DioHelper.getData(
      url: ApiConst.GETFAVOURITE,
      token:CacheHelper.getData(key: "token"),


    ).then((response) {
      favouritesIds=[];
      favouritemodel = FavouriteModel.fromJson(response.data);
      print("GET ALL favourites DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
      print(response.data);
      if(favouritemodel!.data!=null) {
        if(favouritemodel!.data!.product?.isEmpty==true) {
          print("trueeeeeeeeee");

        }
        else  if(favouritemodel!.data!.product?.isEmpty==false) {
          print("falseeeeeeeeeeeeeee");
          for (var item in favouritemodel!.data!.product!) {
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
          }
      /*    for(int i=0;i<favouritesIds.length;i++) {
            print("===================get=======================");
            print(favouritesIds[i]);

          }*/




        }
      }

   //   print(favouritemodel!.data);//instance of data
     // print(favouritemodel!.data!.product);//[]
      //print(favouritemodel!.data!.product?.length);//0

      emit(GetFavouriteSuccessState());
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr IN GET FAVOURITE");
   //   print(error.response);
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(GetFavouriteErrorState(error.toString()));
    });
  }

///add item to fav
  void AddToFavourites(String product_id){
    emit(AddToFavouriteLoadingState());
    DioHelper.postData(

      url: ApiConst.ADDTOFAVOURITE,
      data:{
        'product_id':product_id,
      },
      token:CacheHelper.getData(key: "token"),


    ).then((response) {

      favouritemodel = FavouriteModel.fromJson(response.data);
      print("Add to  favourites DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
      print(response.data);
      /*if(favouritemodel!.data!=null) {
        if(favouritemodel!.data!.product?.isEmpty==true) {
          print(
              "trueeeeeeeeee");


        }
        else  if(favouritemodel!.data!.product?.isEmpty==false) {
          print(
              "falseeeeeeeeeeeeeee");


        }
      }*/
      Fluttertoast.showToast(
        msg: "Successfully item added to favourite",
        backgroundColor: Colors.green,
      );

     GetFavourites();
      /*for(int i=0;i<favouritesIds.length;i++) {
        print("====================add======================");
        print(favouritesIds[i]);

      }*/

      //   print(favouritemodel!.data);//instance of data
      // print(favouritemodel!.data!.product);//[]
      //print(favouritemodel!.data!.product?.length);//0

      emit(AddToFavouriteSuccessState(favouritemodel!));
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr IN add to FAVOURITE");
      //   print(error.response);
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(AddToGetFavouriteErrorState(error.toString()));
    });
  }

  //DELETE FROM FAV
  void DeleteFavourites(String product_id){
    emit(RemoveFavouriteLoadingState());
    DioHelper.postData(

      url: ApiConst.DELETEFAVOURITE,
      data:{
        'product_id':product_id,
      },
      token:CacheHelper.getData(key: "token"),


    ).then((response) {

      favouritemodel = FavouriteModel.fromJson(response.data);
      print("remove from  favourites DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
      print(response.data);
      /*if(favouritemodel!.data!=null) {
        if(favouritemodel!.data!.product?.isEmpty==true) {
          print(
              "trueeeeeeeeee");


        }
        else  if(favouritemodel!.data!.product?.isEmpty==false) {
          print(
              "falseeeeeeeeeeeeeee");


        }
      }*/
      Fluttertoast.showToast(
        msg: "Successfully item deleted from favourite",
        backgroundColor: Colors.green,
      );

      //   print(favouritemodel!.data);//instance of data
      // print(favouritemodel!.data!.product);//[]
      //print(favouritemodel!.data!.product?.length);//0
      GetFavourites();

/*for(int i=0;i<favouritesIds.length;i++) {
  print("===================del=======================");
  print(favouritesIds[i]);

}*/

      emit(RemoveFavouriteSuccessState(favouritemodel!));

    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr IN delete FAVOURITE");
      //   print(error.response);
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(RemoveFavouriteErrorState(error.toString()));
    });
  }


  //change icon color
/*  void ChangFavIconColor(String id ){
    for(int i=0;i<favouritesIds.length;i++) {
  print(favouritesIds[i]);

}
print("========================================");
    String idd=id.toString();

    if (favouritesIds.contains(idd)) {
      print('${idd}  existtttttt in the list.');

       FavColorIcon = Color(0xFF05A4A6);
    }
    else {
      print('${idd} does not existttt in the list.');

      FavColorIcon = Colors.grey;
    }
    //emit(ChangFavColorSucessState());

  }*/

}
