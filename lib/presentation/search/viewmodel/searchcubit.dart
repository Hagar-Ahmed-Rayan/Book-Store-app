

import 'package:bookstore/core/Api.dart';
import 'package:bookstore/core/dio_helper.dart';
import 'package:bookstore/presentation/ProductsScreen/models/ProductModel/ProductModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


import 'package:bookstore/presentation/search/viewmodel/SearchStates.dart';

class SearchCubit extends Cubit<SearchStates> {
SearchCubit() : super(SearchInitialState());
static SearchCubit get(context) => BlocProvider.of<SearchCubit>(context);
ProductModel? productmodel;



void GetSearchItems(String name){
 emit(SearchLoadingState());
DioHelper.getData(

url: ApiConst.BASEURL+'/products-search?name=$name'

).then((response) {
  print(response.data);
productmodel = ProductModel.fromJson(response.data);
print("GET SEARCH PRODUCTS SUCESS");
print(response.data);
emit(SearchSuccessState());
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
emit(SearchErrorState(error.toString()));

}

);

}



}