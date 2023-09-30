
import 'package:bookstore/core/Colors.dart';
import 'package:bookstore/core/SharedFunctions.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/core/fonts.dart';
import 'package:bookstore/presentation/BotttomNavBar/BottomNavBar.dart';
import 'package:bookstore/presentation/LoginScreen/viewmodel/SignIncubit/SignInStates.dart';
import 'package:bookstore/presentation/LoginScreen/viewmodel/SignIncubit/SigninCubit.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksCubit.dart';
import 'package:bookstore/presentation/home/viewmodel/HomeCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../../core/cache_helper.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  bool _keepLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);


    return BlocConsumer<SignInCubit,SignInStates>(
      listener: (BuildContext context, state) {



        if (state is SignInSuccessState  ) {
          print("SIGN in doneeeeeeee");
       //   navto(context,UserProfileScreen());

          print( state.signinmodel.message);
print(CacheHelper.getData(key: "token"));
          BlocProvider.of<HomeCubit>(context).GetSliders();
          BlocProvider.of<BooksCubit>(context).GetAllProducts();


         Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavBarScreen()),
          );
           Fluttertoast.showToast(
             msg: "Successfully sign in",
             backgroundColor: Colors.green,
          );



        }
      },
    builder: (context,state) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(48.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      'Welcome Back!',
                      textAlign: TextAlign.center,
                      style: TextStyle34
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'sign in to access your assigned tasks and personal overview.',
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [

                      /*  TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),*/


                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(

                              color:AppColors.primaryColor
                              ,
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: AppColors.primaryColor
                              ,
                            ),
                        /*    hintText: 'example@example.com',
                            hintStyle: TextStyle(
                              color: Color(0xFF05A4A6),
                            ),*/
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 12.h),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',

                            labelStyle: TextStyle(
                              color: AppColors.primaryColor
                              ,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColors.primaryColor
                              ,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12.h),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),



                  SizedBox(height: 20.h),


                  Row(
                    children: [


                      Text('Do not have an account yet?'),
                      TextButton(onPressed: () {


                      }, child: Text('sign up',
                        style: TextStyle(
                          color: AppColors.primaryColor
                        ),

                      ),),


                    ],
                  ),

                  SizedBox(height: 20.h),
                  Container(
                    width: 312,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          SignInCubit.get(context).SignIn(_emailController.text, _passwordController.text);
                          // Perform login action here
                          // You can access the email and password using _emailController.text and _passwordController.text respectively
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:Colors.white,
                        ),
                      ),
                    ),
                  ),
                /*  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        SignInCubit.get(context).SignIn(_emailController.text, _passwordController.text);
                        // Perform login action here
                        // You can access the email and password using _emailController.text and _passwordController.text respectively
                      }
                    },
                    child: Text('Log in'),
                    style:

                    ElevatedButton.styleFrom(

                      minimumSize: Size(312.w, 48.h),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),

      )
      ;
    }
    );
  }
}
