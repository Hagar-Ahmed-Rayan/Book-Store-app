import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/presentation/home/model/BestSellerModel/Products.dart';
import 'package:bookstore/presentation/home/model/arrivalsModel/Products.dart';
import 'package:flutter/material.dart';


class ArrivalItem extends StatelessWidget {
  const ArrivalItem({super.key, required this.product});
  final ArrivalsProducts product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.network(
                  product?.image??'',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
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
            Text(product!.name!,
              maxLines: 2,
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
            Text((product!.priceAfterDiscount!).toString(),
                style:  TextStyle(
                  color: AppColors.primaryColor,



                )



            ),



          ],
        ),
      ),
    );
  }
}
