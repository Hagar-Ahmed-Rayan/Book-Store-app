

import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/presentation/ProductsScreen/models/ProductModel/Products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  // ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

 ProductDetailsScreen({super.key, required this.product});
  final Products product;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);
    return  Scaffold(
      body: SafeArea(

          child: SingleChildScrollView(child: Column(
 //  mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width:MediaQuery.of(context).size.width ,
                child: Image.network(
                  product!.image!, // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                  Text(
                    product!.name!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        product!.category!,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,

                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            product!.price!,
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,

                            ),
                          ),

                          Text(
                            product!.priceAfterDiscount.toString(),
                            style: TextStyle(
                                color: AppColors.primaryColor
                            ),
                          ),

                        ],
                      )

                    ],
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Text(
                    product!.description!,
                    style: TextStyle(
                        color: Colors.black38
                    ),
                  ),
                ],),
              ),
              SizedBox(
                height: 10.h,
              ),

              Container(
                width: 312,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Add To Card',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color:Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 16.h,
              ),

            ],
          ))
      ),
    );
  }
}
