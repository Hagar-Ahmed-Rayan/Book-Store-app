

import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
       //     Spacer(flex: 3),
            Lottie.asset('assets/img/booksanimation.json'),

          /*  SvgPicture.asset(
              'assets/img/newsplash.svg',
              width: 200,
              height: 200,
            ),*/
            Text(
              'Welocome to Book store',
              textAlign: TextAlign.center, // Center-align the text

              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color:AppColors.primaryColor,


              ),
            ),
          ],
        ),
      ),
    );
  }
}
