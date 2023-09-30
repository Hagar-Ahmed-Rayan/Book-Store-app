
import 'package:bookstore/core/appcolors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../LoginScreen/view/SignInScreen.dart';
import '../register_screen/view/widget/register_screen_body.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  PageController controller = PageController();
  int  _totalDots = 3;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }
  void _updatePosition(int position) {
    setState(() => _currentPosition = _validPosition(position.toDouble()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: _updatePosition,
            children: [
              OnboardingScreen(
                  SvgPicture.asset(
                    'assets/img/board3.svg',
                    width: 200,
                    height: 200,
               //     color: AppColors.primaryColor,
                  ),

                  [
                     Text("Discover a world of books options ",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight:FontWeight.bold,
                        //  color: Color(0xFF174068).withOpacity(0.8),
                        color: AppColors.primaryColor,

                        letterSpacing: 0.3,
                      ),
                       textAlign: TextAlign.center,
                     ),
                    SizedBox(height: 30,),
                    //const Padding(padding: EdgeInsets.all(12.0)),
                    /*
                    OutlinedButton(onPressed: (

                        ){},child:  const Text(
                        "SKIP",
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                      style: ButtonStyle(

                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),

                      ),
                    )

                     */
                  ]

              ),
              OnboardingScreen(
                  SvgPicture.asset(
                    'assets/img/board1.svg',
                    width: 200,
                    height: 200,
                //    color: AppColors.primaryColor,

                  ),

                  [
                     Text("Access a wide range of books in different fields",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight:FontWeight.bold,
                        color: AppColors.primaryColor,

                      //  color: Color(0xFF174068).withOpacity(0.8),
                        letterSpacing: 0.3,

                      ),
                       textAlign: TextAlign.center,
                     ),
                    const Padding(padding: EdgeInsets.all(12.0)),
                    SizedBox(height: 20,),
                    /*
                    OutlinedButton(onPressed: (

                        ){},child:  const Text(
                        "SKIP",
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),

                      ),
                    )

                     */
                  ]

              ),
              OnboardingScreen(
                SvgPicture.asset(
                  'assets/img/board2.svg',
                  width: 200,
                  height: 200,

                //  color: AppColors.primaryColor,

                ),

                [
                   Text("Take control of your brain with our intuitive app", style: TextStyle(
                      fontSize: 22,
                      fontWeight:FontWeight.bold,
                 //     color: Color(0xFF174068).withOpacity(0.8),
                     color: AppColors.primaryColor,

                     letterSpacing: 0.3,

                   ),
                     textAlign: TextAlign.center,
                   ),
                  const Padding(padding: EdgeInsets.all(12.0)),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>   SignInScreen()),
                        );
                      }
                        , child: Text(
                          "Login",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight:FontWeight.bold,
                          color: AppColors.primaryColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                        style: ButtonStyle(

                          shape: MaterialStateProperty.all(RoundedRectangleBorder
                            (borderRadius: BorderRadius.circular(18.0))),


                        ),),
                      OutlinedButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  RegisterScreenBody()),
                        );

                      }, child: Text(
                          "Sign up",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight:FontWeight.bold,
                          color: AppColors.primaryColor,

                          letterSpacing: 0.5,
                        ),
                      ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),


                        ),),
                    ],
                  )
                ],
              ),

            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,

              child: DotsIndicator(
                dotsCount: 3,
                position: _currentPosition,
                decorator: DotsDecorator(
                  color: Colors.grey, // Set the color of the dots to green
                  activeColor: AppColors.primaryColor,
                  size: const Size.square(8.0),
                  activeSize: const Size.square(12.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onTap: (double page) {
                  setState(() {
                    controller.animateToPage(
                      page.toInt(),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  });
                },
              )


          )
        ],
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final Widget? image;
  final List<Widget> text;

  const OnboardingScreen(this.image, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);

    return Container(
      // color: Colors.tealAccent.shade100,
      child: Column(
        children: [
          if (image != null)
            Expanded(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 10,
                    child: image!,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
              flex: 2,
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: text
              ),
            ),
            // flex: 1
          ),
        ],
      ),
    );
  }
}