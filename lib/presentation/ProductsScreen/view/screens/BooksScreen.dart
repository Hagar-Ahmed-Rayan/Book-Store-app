import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/core/loadingWidget.dart';
import 'package:bookstore/presentation/ProductsScreen/view/widgets/ProductItem.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksCubit.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BooksCubit,BooksStates>(
      listener: (context, state) {},
      builder:(context, state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text('Books'),
          ),
          body: (BooksCubit.get(context).productmodel?.data?.products!.length!=null)?
          Container(
            //height: 500,
            child: ListView.builder(
              itemBuilder:(context,index)=> ProductItem(product: BooksCubit.get(context).productmodel!.data!.products![index]),
              itemCount: BooksCubit.get(context).productmodel?.data?.products!.length ,
           //   itemCount: 500 ,
             //   itemBuilder:(context,index)=> Text('uuuuuu'),

              scrollDirection: Axis.vertical,
         //   shrinkWrap: true,
              physics:ScrollPhysics(),

            ),
          )

              :CustomLoadingIndicator()

        );
      } ,
    );
  }
}

