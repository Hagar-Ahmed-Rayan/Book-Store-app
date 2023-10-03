import 'package:bookstore/core/SharedFunctions.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/presentation/ProductDetailsScreen/ProductDetailsScreen.dart';
import 'package:bookstore/presentation/ProductsScreen/models/ProductModel/Products.dart';
import 'package:bookstore/presentation/ProfileScreen/viewmodel/cubit/ProfileCubit.dart';
import 'package:bookstore/presentation/cart/models/cartmodel/CartItems.dart';
import 'package:bookstore/presentation/cart/viewmodel/Cartcubit.dart';
import 'package:bookstore/presentation/favourite/viewmodel/FavouriteCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cart});
  final CartItems cart;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
       /*   print("product is issss");
          print(product.id);
          navto(context, ProductDetailsScreen( product: product,));*/
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
                Image.network(
                  cart?.itemProductImage??'',
                  fit: BoxFit.cover,
                  // width: 100,
                  //height: 100,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Text(cart!.itemProductName!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,

                        ),

                      ),


                      Row(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                 num quantity= cart.itemQuantity??0;
                                 quantity=quantity+1;
                                    print(quantity);
                                 BlocProvider.of <CartCubit>(context).UpdateCart(cart.itemId.toString(), quantity.toString());

                                },
                              ),
                              Text(
                                cart!.itemQuantity.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  num quantity= cart.itemQuantity??0;
                                  quantity=quantity-1;
                                  print(quantity);
                                  BlocProvider.of <CartCubit>(context).UpdateCart(cart.itemId.toString(), quantity.toString());
                                  // Handle decrement logic using cubit
                                },
                              ),
                            ],
                          )                        ],
                      ),



                    ],),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      IconButton(

                          onPressed: (){
                            print("in button delete from cartttttttttttttttttttttttttttt");
                            print(cart.itemId);
                          //  int id = int.parse(cart.itemId);//if string to int
                        //    int id = cart.itemId!.toInt();

                     //       print(id);
                     //       print(id.runtimeType);
                         BlocProvider.of<CartCubit>(context).RemoveFromCart(cart.itemId);






                      },

                          icon:Icon(Icons.delete,

                        // color: BlocProvider.of<FavouriteCubit>(context).FavColorIcon
                        color:AppColors.primaryColor,


                      )


                      ),
                      Text(cart!.itemProductPrice!,

                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
color: Colors.grey,
                          decoration: TextDecoration.lineThrough,

                        ),

                      ),
                      Text(cart!.itemProductPriceAfterDiscount.toString(),
                          textAlign: TextAlign.center,

                          style:  TextStyle(
                            color: AppColors.primaryColor,



                          )


                      ),
                    ],
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
