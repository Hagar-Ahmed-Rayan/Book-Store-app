import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/core/loadingWidget.dart';
import 'package:bookstore/presentation/ProductsScreen/view/widgets/ProductItem.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksCubit.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksScreen extends StatelessWidget {
  bool finalpage=false;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<BooksCubit,BooksStates>(
      listener: (context, state) {},
      builder:(context, state){
        //var cubit = BlocProvider.of<BooksCubit>(context);
        var cubit=BooksCubit.get(context);
        cubit.getMoreData();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text('Books'),
          ),
          body:(cubit.books.length!=null)?
         // (BooksCubit.get(context).productmodel?.data?.products!.length!=null)?
          Container(
            //height: 500,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              controller: BooksCubit.get(context).scrollController,

              itemBuilder:(context,index) {
                if (index >= cubit.books.length )//length of the books until the current page ==>if page 1-==>the should be 15|2-30|3-45
                {
                      return const Center(child: CircularProgressIndicator());
                }
                if (index ==cubit.total-1)    //total numbers of the books in all pages
                {
                  finalpage=true;

                  return Center(
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: 10),
                      child: Text(
                        'No more data to load',
                        style:TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                  );
                }


                   return ProductItem(product:
                 /*  BooksCubit
                    .get(context)
                    .productmodel!
                    .data!
                    .products![index]*/

                   cubit.books[index],
                   );


              },
            itemCount:
           // (finalpage==true)?cubit.books.length: cubit.books.length + 1,
              cubit.isLoadMore ? cubit.books.length + 1 : cubit.books.length,

          //   BooksCubit.get(context).productmodel?.data?.products!.length ,






             // physics:ScrollPhysics(),

            ),
          )

              :CustomLoadingIndicator()

        );
      } ,
    );
  }
}

