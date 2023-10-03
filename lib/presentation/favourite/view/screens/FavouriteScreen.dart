import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/core/loadingWidget.dart';
import 'package:bookstore/presentation/ProductsScreen/view/widgets/ProductItem.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksCubit.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksStates.dart';
import 'package:bookstore/presentation/favourite/viewmodel/FavouriteCubit.dart';
import 'package:bookstore/presentation/favourite/viewmodel/FavouriteStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit,FavouriteStates>(
      listener: (context, state) {
        if(FavouriteCubit.get(context).favouritemodel?.data?.product?.length!=0)
          print("yessssssssssssssssssssssssssssssss");
      },
      builder:(context, state){
        return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              title: Text('Favourite'),
            ),

          body:



          ( (FavouriteCubit.get(context).favouritemodel!=null)&&(FavouriteCubit.get(context).favouritemodel!.data?.product?.isEmpty==true))?

        Center(child:Text("you have no favouite items yet")):

          ((FavouriteCubit.get(context).favouritemodel!.data!=null)&&(FavouriteCubit.get(context).favouritemodel!.data?.product?.isEmpty==false))?
            Container(
              //height: 500,
              child: ListView.builder(
                itemBuilder:(context,index)=> ProductItem(product: FavouriteCubit.get(context).favouritemodel!.data!.product![index]),
              itemCount: FavouriteCubit.get(context).favouritemodel?.data?.product?.length  ,
          //       itemCount: 3 ,
                  //  itemBuilder:(context,index)=> Text(FavouriteCubit.get(context).favouritemodel!.data!.product![index].name!),

                   //  itemBuilder:(context,index)=> Text('uuuuuu'),

                scrollDirection: Axis.vertical,
                //   shrinkWrap: true,
                physics:ScrollPhysics(),

              ),
            )

                :Text("hi"),
           // CustomLoadingIndicator()

        );
      } ,
    );
  }
}

