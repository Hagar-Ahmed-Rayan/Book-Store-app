import 'package:bookstore/core/SharedFunctions.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/presentation/BotttomNavBar/BottomNavBar.dart';
import 'package:bookstore/presentation/Otp/view/screens/OTPScreen.dart';
import 'package:bookstore/presentation/ProductsScreen/viewModel/booksCubit.dart';
import 'package:bookstore/presentation/ProfileScreen/viewmodel/cubit/ProfileCubit.dart';
import 'package:bookstore/presentation/home/viewmodel/HomeCubit.dart';
import 'package:bookstore/presentation/register_screen/view_model/cubit/cubit.dart';
import 'package:bookstore/presentation/register_screen/view_model/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/cache_helper.dart';
import '../../../../core/component.dart';

class RegisterScreenBody extends StatefulWidget {
  RegisterScreenBody({Key? key}) : super(key: key);

  @override
  _RegisterScreenBodyState createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  bool isvisible = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String selectedGender = '1';

  Future<void> storeTokenInSharedPreferences(String token) async {
    CacheHelper.saveData(key: "token", value: token);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (BuildContext context, RegisterStates state) {
        if(state is RegisterSuccessState){
           Fluttertoast.showToast(
             msg: "Successfully sign up",
            backgroundColor: Colors.green,
           );
           BlocProvider.of<ProfileCubit>(context).GetUserProfile();

      //     BlocProvider.of<HomeCubit>(context).GetSliders();
        //   BlocProvider.of<BooksCubit>(context).GetAllProducts();
           navto(context,NavBarScreen());
        }

      },

      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor:AppColors.primaryColor
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                 /*   Text(
                      'Let’s get started!',
                      style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
                    ),*/
                    SizedBox(height: 20.h),
                    Text(
                      'Create an account and start reading now',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                    //    color: HexColor('#7C808A'),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: nameController,
                      keyboardType:TextInputType.name,

                      decoration: InputDecoration(
                        labelText: 'name',

                        labelStyle: TextStyle(
                          color: AppColors.primaryColor
                          ,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.primaryColor
                          ,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),




                    SizedBox(height: 20.h),
                    TextFormField(

                      keyboardType:TextInputType.emailAddress,

                      controller:emailController ,
                      decoration: InputDecoration(
                        labelText: 'email',

                        labelStyle: TextStyle(
                          color: AppColors.primaryColor
                          ,
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.primaryColor
                          ,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),



                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,

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


                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,

                      decoration: InputDecoration(
                        labelText: 'confirm Password',

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
                          return 'Please enter your password again';
                        }
                        else if(passwordController.text!=confirmPasswordController.text){
                          return 'confirm password doesn\'t match password';
                        }

                        return null;

                      },
                    ),



                    // Radio buttons for gender selection

                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text('Already have an account?', style: TextStyle(fontSize: 16)),
                        TextButton(onPressed: () {


                        }, child: Text('log in here',
                          style: TextStyle(
                              color: AppColors.primaryColor
                          ),

                        ),),
                        SizedBox(height: 5,),
                       // TextButton('Login here', onPressed: (){}, child: ,)


                      ],
                    ),
SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          isvisible = true;
                          RegisterCubit.get(context).addRegister(
                            name: nameController.text,
                            email: emailController.text,

                            password: passwordController.text,
                            ConfirmPassword: confirmPasswordController.text,
                          );
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        minimumSize: const Size(312, 48),
                      ),
                      child: Text(
                        'Register',
                        style: GoogleFonts.roboto(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
