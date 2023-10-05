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
       // BooksCubit.get(context).getMoreData();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text('Books'),
          ),
          body: (BooksCubit.get(context).productmodel?.data?.products!.length!=null)?
          Container(
            //height: 500,
            child: ListView.builder(
              controller: BooksCubit.get(context).scrollController,
              itemBuilder:(context,index) {
            /*    if(index>=BooksCubit.get(context).books!.length-1)//47>=48 true
                {
                  print("yessssssssssssssssssssssss");
                  print(BooksCubit.get(context).page);
                  return Center(child: CircularProgressIndicator(),);
                }*/



                   return ProductItem(product: BooksCubit
                    .get(context)
                    .productmodel!
                    .data!
                    .products![index]);
             /*   return ProductItem(product: BooksCubit
                    .get(context)
                    .books[index]);*/


              },
              itemCount: BooksCubit.get(context).productmodel?.data?.products!.length ,
             /* itemCount: (BooksCubit.get(context).isLoadMore)
                  ? BooksCubit.get(context).books.length + 1
                  : BooksCubit.get(context).books.length,*/


              //   itemCount: 500 ,
             //   itemBuilder:(context,index)=> Text('uuuuuu'),

              scrollDirection: Axis.vertical,
         //   shrinkWrap: true,
              physics:  BouncingScrollPhysics(),

             // physics:ScrollPhysics(),

            ),
          )

              :CustomLoadingIndicator()

        );
      } ,
    );
  }
}

