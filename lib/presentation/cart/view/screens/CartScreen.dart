import 'package:bookstore/core/SharedFunctions.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/core/loadingWidget.dart';
import 'package:bookstore/presentation/Checkout/view/CheckoutScreen.dart';
import 'package:bookstore/presentation/Checkout/viewmodel/CheckoutCubit.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksCubit.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksStates.dart';
import 'package:bookstore/presentation/cart/view/widgets/CartItem.dart';
import 'package:bookstore/presentation/cart/viewmodel/CartStates.dart';
import 'package:bookstore/presentation/cart/viewmodel/Cartcubit.dart';
import 'package:bookstore/presentation/favourite/viewmodel/FavouriteStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit,CartStates>(
      listener: (context, state) {

      },
      builder:(context, state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text('Your Cart'),
          ),

          body:SingleChildScrollView(
            child: Column(
              children:[
            ( (CartCubit.get(context).cartmodel!=null)&&(CartCubit.get(context).cartmodel!.data?.cartItems?.isEmpty==true))?

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 8),
              child: Center(child:Text("you have no cart items yet",

              )),
            ):

            ((CartCubit.get(context).cartmodel!=null)&&(CartCubit.get(context).cartmodel!.data?.cartItems?.isEmpty==false))?
            Column(
              children: [
               Container(
                 child: ListView.builder(
                      itemBuilder:(context,index)=> CartItem(cart: CartCubit.get(context).cartmodel!.data!.cartItems![index]),
                      itemCount: CartCubit.get(context).cartmodel?.data?.cartItems?.length  ,
                      //       itemCount: 3 ,
                      //  itemBuilder:(context,index)=> Text(FavouriteCubit.get(context).favouritemodel!.data!.product![index].name!),

                      //  itemBuilder:(context,index)=> Text('uuuuuu'),

                      scrollDirection: Axis.vertical,
                       shrinkWrap: true,
                      physics:NeverScrollableScrollPhysics(),

                    ),
               ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20.0),
                  child: Row(
                    children:[
        Text('Total is'),
                      Spacer(),
                      Text(CartCubit.get(context).cartmodel!.data!.total!.toString()),


                    ]
                  ),
                ),


                      ElevatedButton(
                        onPressed: () {


                          final checkoutData = {
                            "data": {
                              "id": 107,
                              "user": {
                                "user_id": 14,
                                "user_name": "Ahmed",
                                "user_email": "ahmedabdelsattar28@gmail.com",
                                "address": "c",
                                "phone": "012345678"
                              },
                              "total": "258.30",
                              "cart_items": [
                                {
                                  "item_id": 589,
                                  "item_product_id": 6,
                                  "item_product_name": "Head First Object-Oriented Analysis and Design",
                                  "item_product_price": "369.00",
                                  "item_quantity": 1,
                                  "item_total": "258.30"
                                }
                              ]
                            },
                            "message": "Checkout",
                            "error": [],
                            "status": 200
                          };












                          BlocProvider.of<CheckoutCubit>(context).GetCheckout();


                          navto(context,CheckoutScreen( checkoutData: checkoutData, cartmodel: CartCubit.get(context).cartmodel!,));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          minimumSize: const Size(312, 48),
                        ),
                        child: Text(
                          'Check out',
                          style: GoogleFonts.roboto(fontSize: 14, color: Colors.white),
                        ),
                      ),
               SizedBox(
                 height: 20,
               )


              ],
            )

                :
            CustomLoadingIndicator(),
            ]
        ),
          )
        );
      } ,
    );
  }
}

