import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/presentation/home/model/CategoriesModel/Categories.dart';
import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final Categories category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.network(
                'https://img.freepik.com/free-vector/books-stack-realistic_1284-4735.jpg?w=740&t=st=1696095340~exp=1696095940~hmac=7635fea6d21702533fbcb4a6ab18e77dd1ebb42b3ed0c6e830dd990ebc5639e4',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
                Positioned(
                 left: 0,
                  bottom: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Colors.black12.withOpacity(0.5),
                    child: Center(
                      child: Text(
                          category!.name!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),



          ],
        ),
      ),
    );
  }
}
