import 'package:bookstore/core/SharedFunctions.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/core/loadingWidget.dart';
import 'package:bookstore/presentation/Checkout/models/CheckoutModel/CheckOutModel.dart';
import 'package:bookstore/presentation/Checkout/view/PlaceOrderScreen.dart';
import 'package:bookstore/presentation/Checkout/viewmodel/CheckoutCubit.dart';
import 'package:bookstore/presentation/Checkout/viewmodel/CheckoutStates.dart';
import 'package:bookstore/presentation/UpdateProfile/viewmodel/UpdateProfileCubit.dart';
import 'package:bookstore/presentation/cart/models/cartmodel/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatelessWidget {
  final Map<String, dynamic> checkoutData;
  CartModel  cartmodel;

  CheckoutScreen({required this.checkoutData,required this.cartmodel});

  @override
  Widget build(BuildContext context) {
    final data = checkoutData['data'];

    return BlocConsumer<CheckoutCubit,CheckoutStates>(
      listener: (context, state) {

      },
builder:(context, state)  {
  var cubit=CheckoutCubit.get(context).checkoutmodel;

  return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,

          title: Text('Checkout'),

        ),

        body: (CheckoutCubit.get(context).checkoutmodel!=null)?
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     'User:',
                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                   ),
                   SizedBox(height: 8),
                   Row(
                     children: [
                       Text('Name :'),
                       SizedBox(width: 15,),
                       Text('${cubit?.data!.user!.userName}'),

                     ],

                   ),
                   SizedBox(height: 10,),
                   Row(
                     children: [
                       Text('Email: '),

                       SizedBox(width: 15,),
                       Text('${cubit?.data!.user!.userEmail}'),
                     ],

                   ),
                   SizedBox(height: 10,),
                   Row(
                     children: [
                       Text('Address: '),

                       SizedBox(width: 5,),
                       Text('${cubit?.data!.user!.address}'),
                     ],

                   ),
                   SizedBox(height: 10,),
                   Row(
                     children: [
                       Text('phone: '),

                       SizedBox(width: 15,),
                       Text('${cubit!.data!.user!.phone}'),
                     ],

                   ),
                   SizedBox(height: 10,),

                 ],

               ),
             ),



                Text(
                  'Order Summary:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Total :    ${cubit.data!.total}'),
                SizedBox(height: 16),
                Text(
                  'Cart Items:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ((cubit.data!=null)&&(cubit.data!.cartItems?.isEmpty==false))?
             Column(children: [

                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cubit.data!.cartItems!.length,
                  itemBuilder: (context, index) {
                   final item = cubit.data!.cartItems![index];
                    return ListTile(
                      title: Text(item!.itemProductName!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price: \$${item!.itemProductPrice}'),
                          Text('Quantity: ${item!.itemQuantity}'),
                          Text('Total: \$${item.itemTotal}'),
                          Divider()
                        ],
                      ),
                    );;
                  },
                ),

               ElevatedButton(
                 onPressed: () {
                   BlocProvider.of<UpdateProfileCubit>(context).GetAllGovern();


                   navto(context,PlaceOrderScreen());
                 },
                 style: ElevatedButton.styleFrom(
                   primary: AppColors.primaryColor,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(0),
                   ),
                   minimumSize: const Size(312, 48),
                 ),
                 child: Text(
                   'Place Order',
                   style: GoogleFonts.roboto(fontSize: 14, color: Colors.white),
                 ),
               ),

             ],)

                    :
                    Center(child: Text("there is no items"),),
              ],
            ),
          ),
        ):CustomLoadingIndicator()
      ,
      );
  }
    );
  }
}


