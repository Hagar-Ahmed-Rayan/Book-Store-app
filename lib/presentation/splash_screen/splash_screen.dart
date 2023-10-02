
import 'dart:async';
import 'package:bookstore/core/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../onboarding_screen/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    MyHome()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 20),
            borderRadius: BorderRadius.circular(20),
            ),
            child:Column(
              children: [
                Spacer(flex: 3,),
                SvgPicture.asset(
                  'assets/img/newsplash.svg',
                  width: 200,
                  height: 200,
               //   color: AppColors.primaryColor,

                ),
             /*   Image.asset(
                    'assets/img/splash_book.svg',
                ),*/
                Text(
                  'book store',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color:AppColors.primaryColor,
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
