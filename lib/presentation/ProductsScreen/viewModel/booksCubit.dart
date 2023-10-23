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
  static BooksCubit get(context) => BlocProvider.of<BooksCubit>(context);

  int page = 1;
  int total=0;
  int lastPage=1;
bool nomoredate=false;
 // final Dio dio = Dio();

  //get sliders
  ProductModel? productmodel;
  ScrollController scrollController = ScrollController();
  List<Products>books=[];

    GetAllProducts() async{
    emit(GetProductsLoadingState());
    DioHelper.getData(
      url:'/products?page=$page'

    ).then((response) {

      productmodel = ProductModel.fromJson(response.data);
      if(productmodel?.data?.products?.isEmpty==true)
        nomoredate=true;

      response.data['data']['products'].map((item){
        books.add(Products.fromJson(item));
      }).toList();
      print(books.length);//15
       print(response.data);
      print(response.data['data']['meta']['total']);//46
      total=response.data['data']['meta']['total'];
      lastPage=response.data['data']['meta']['last_page'];//4
      print(lastPage);

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

  getMoreData() {  //page=1,lastpage=4,total=64

    scrollController.addListener(() async {
      if (page == lastPage) {
        return;
      }
      else if (scrollController.position.pixels == scrollController.position.maxScrollExtent)
      {

        isLoadMore = true;
        if (page <= lastPage) {
          page++;//2
print(page);
        //  await getAllBooks();

         await GetAllProducts();


        }
       //   });

      }

      isLoadMore = false;
    });
  }



}




/*import 'dart:convert';

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
  static BooksCubit get(context) => BlocProvider.of<BooksCubit>(context);

  int page = 1;
  int total=0;
  int lastPage=1;
  bool nomoredate=false;
  // final Dio dio = Dio();

  //get sliders
  ProductModel? productmodel;
  ScrollController scrollController = ScrollController();
  List<Products>books=[];

  GetAllProducts() async{
    emit(GetProductsLoadingState());
    DioHelper.getData(
        url:'/products?page=$page'

    ).then((response) {

      productmodel = ProductModel.fromJson(response.data);
      if(productmodel?.data?.products?.isEmpty==true) {
        print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
        nomoredate = true;
      }

      response.data['data']['products'].map((item){
        books.add(Products.fromJson(item));
      }).toList();
      print("boookes lengthtttttttttttttttttttttttttttttttttttttttttttttttt");
      print(books.length);//15
      print(response.data);
      print(response.data['data']['meta']['total']);//46
      total=response.data['data']['meta']['total'];
      lastPage=response.data['data']['meta']['last_page'];//4
      print(lastPage);

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

  /*getAllBooks() async {
    emit(GetProductsLoadingState());
    try {
      print("i am in trrrrrrrrrrrrrrrrrryyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
      Response response =
      await DioHelper.getData(url: '/products?page=$page');
      response.data['data']['products'].map((item) {
        books.add(Products.fromJson(item));
      }).toList();
      print(response.data['data']['meta']['total']);
      total=response.data['data']['meta']['total'];
      lastPage=response.data['data']['meta']['last_page'];
      print("kemooooooooooooooooooooooooooooooooooooooooooooooo");
      print(books.length);
      print(lastPage);
      print(response.data);
      // booksModel = BookModel.fromJson(response.data);
      // print(model?.message);

      emit(GetProductsSuccessState());
    } on Exception catch (e) {
      if (e is DioException) {
        print(e.response?.data);
      }
      print(e.toString());
      emit(GetProductsErrorState(e.toString()));
    }
  }*/
  bool isLoadMore = false;

  getMoreData() {  //page=1,lastpage=4,total=64

    scrollController.addListener(() async {
      if (page == lastPage) {
        return;
      }
      else if (scrollController.position.pixels == scrollController.position.maxScrollExtent)
      {

        isLoadMore = true;
        if (page <= lastPage) {
          page++;//2
          print('pageeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
          print(page);
          //  await getAllBooks();

          await GetAllProducts();


        }
        //   });

      }

      isLoadMore = false;
    });
  }



}*/




