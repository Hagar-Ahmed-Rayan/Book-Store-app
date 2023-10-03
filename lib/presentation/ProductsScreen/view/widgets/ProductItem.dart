import 'package:bookstore/core/SharedFunctions.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/presentation/ProductDetailsScreen/ProductDetailsScreen.dart';
import 'package:bookstore/presentation/ProductsScreen/models/ProductModel/Products.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksCubit.dart';
import 'package:bookstore/presentation/ProfileScreen/viewmodel/cubit/ProfileCubit.dart';
import 'package:bookstore/presentation/cart/viewmodel/Cartcubit.dart';
import 'package:bookstore/presentation/favourite/viewmodel/FavouriteCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Products product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          print("product is issss");
          print(product.id);
          navto(context, ProductDetailsScreen( product: product,));
        },
        child: Container(
     //   width: 100,
          height: 150,
          decoration: BoxDecoration(
        //    color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),

          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //  mainAxisAlignment: MainAxisAlignment.center,
        //    crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Image.network(
                      product?.image??'',
                      fit: BoxFit.cover,
                     // width: 100,
                      //height: 100,
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(

                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,

                         // color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            product!.discount!.toString()+'%',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                    Text(product!.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,

                      ),

                    ),
                    Text(product!.category!,
                        textAlign: TextAlign.center,

                        style:  TextStyle(
                          color: Colors.grey,



                        )


                    ),
                    Text(product!.price!,
                      style:  TextStyle(
                        color: Colors.black12,
                        decoration: TextDecoration.lineThrough,

                      ),




                    ),


                      (product!.priceAfterDiscount!=null)?
                    Text((product!.priceAfterDiscount!).toString(),
                        style:  TextStyle(
                          color: AppColors.primaryColor,



                        )



                    ):
                      Text((product!.discount!).toString(),
                          style:  TextStyle(
                            color: AppColors.primaryColor,



                          )



                      )

                  ],),
                ),
                Column(
                  children: [
                    IconButton(onPressed: (){


print("iddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
                              print(product.id);

                       /*    bool isidExists=false;

                              for(int i=0;i<BlocProvider.of<FavouriteCubit>(context).favouritesIds.length;i++) {
                                print("========================================");
                                if((BlocProvider.of<FavouriteCubit>(context).favouritesIds[i]).toString()==(product.id).toString())
                                 isidExists=true;
                                print(BlocProvider.of<FavouriteCubit>(context).favouritesIds[i]);

                              }

                       //       bool isidExists = BlocProvider.of<FavouriteCubit>(context).favouritesIds.contains(product.id);
                              if (isidExists) {
                                BlocProvider.of<FavouriteCubit>(context).DeleteFavourites((product.id).toString());

                                print('The id exists in the list.');
                              } else {
                                BlocProvider.of<FavouriteCubit>(context).AddToFavourites((product.id).toString()); //add

                                print('The id does not exist in the list.');
                              }*/
/*for(int i=0;i<BlocProvider.of<FavouriteCubit>(context).favouritesIds.length;i++) {
  print(BlocProvider.of<FavouriteCubit>(context).favouritesIds[i]);

}*/
//print("========================================");
String id=(product.id).toString();
if (BlocProvider.of<FavouriteCubit>(context).favouritesIds.contains(id)) {
  print('${product.id} exists in the list.');
  BlocProvider.of<FavouriteCubit>(context).DeleteFavourites((product.id).toString());


  /*  BlocProvider.of<FavouriteCubit>(context).favouritesIds.remove(id);

  // BlocProvider.of<FavouriteCubit>(context).ChangFavIconColor(id);
  for(int i=0;i<BlocProvider.of<FavouriteCubit>(context).favouritesIds.length;i++) {
    print("===================del=======================");
    print(BlocProvider.of<FavouriteCubit>(context).favouritesIds[i]);

  }*/

} else {
  print('${product.id} does not exist in the list.');
  BlocProvider.of<FavouriteCubit>(context).AddToFavourites((product.id).toString()); //add
 /* BlocProvider.of<FavouriteCubit>(context).favouritesIds.add(id);

  for(int i=0;i<BlocProvider.of<FavouriteCubit>(context).favouritesIds.length;i++) {
    print("===================add=======================");
    print(BlocProvider.of<FavouriteCubit>(context).favouritesIds[i]);

  }*/

  // BlocProvider.of<FavouriteCubit>(context).ChangFavIconColor(id);


}







                    }, icon:Icon(Icons.favorite,

                   //   color: BlocProvider.of<FavouriteCubit>(context).FavColorIcon
                    color: (BlocProvider.of<FavouriteCubit>(context).favouritesIds.contains((product.id).toString()))
                         ?AppColors.primaryColor: Colors.grey,


                    )


                    ),
                    Spacer(),
                    IconButton(onPressed: (){

                      BlocProvider.of<CartCubit>(context).AddToCart((product.id).toString());


                    }, icon:Icon(Icons.shopping_basket_outlined)),

                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
