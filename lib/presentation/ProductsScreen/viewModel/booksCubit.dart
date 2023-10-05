import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bookstore/core/Api.dart';
import 'package:bookstore/core/dio_helper.dart';
import 'package:bookstore/presentation/ProductsScreen/models/ProductModel/ProductModel.dart';
import 'package:bookstore/presentation/ProductsScreen/models/ProductModel/Products.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksStates.dart';
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





class BooksCubit extends Cubit<BooksStates> {
  BooksCubit() : super(BooksInitialState());

  int page = 1;

 // final Dio dio = Dio();

  static BooksCubit get(context) => BlocProvider.of<BooksCubit>(context);
  //get sliders
  ProductModel? productmodel;
  ScrollController scrollController = ScrollController();
  List<Products>books=[];

  void GetAllProducts(){
    emit(GetProductsLoadingState());
    DioHelper.getData(
    //  url: ApiConst.GETALLPRODUCTS,
      url:'/products?page=$page'

    ).then((response) {

      productmodel = ProductModel.fromJson(response.data);
      print("GET ALL PRODUCTS DONEEEEEEEEEEEEEEEEEEEEEE");

      response.data['data']['products'].map((item){
        books.add(Products.fromJson(item));
      }).toList();
      print(books);
      print(books.length);
       print(response.data);
      emit(GetProductsSuccessState());
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr IN GET ALL PRODUCTS");
      print(error.response);
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(GetProductsErrorState(error.toString()));
    });
  }
  //load more products
  bool isLoadMore = false;
  getMoreData() {
    print("hagrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");

    scrollController.addListener(() async {

      if (page == 4) {
        return;
      }
      else if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        print("asmaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        isLoadMore = true;
        if (page <= 4) {
          page++;
           GetAllProducts();

        }
      }
      isLoadMore = false;
    });
  }



}