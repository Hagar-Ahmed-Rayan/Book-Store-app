import 'package:bookstore/core/SharedFunctions.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/presentation/ProductDetailsScreen/ProductDetailsScreen.dart';
import 'package:bookstore/presentation/ProductsScreen/models/ProductModel/Products.dart';
import 'package:flutter/material.dart';


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
                    Text((product!.priceAfterDiscount!).toString(),
                        style:  TextStyle(
                          color: AppColors.primaryColor,



                        )



                    ),
                  ],),
                ),
                Column(
                  children: [
                    IconButton(onPressed: (){

                    }, icon:Icon(Icons.favorite)),
                    Spacer(),
                    IconButton(onPressed: (){

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
