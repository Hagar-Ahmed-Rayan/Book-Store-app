import 'package:bookstore/core/SharedFunctions.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/presentation/LoginScreen/view/SignInScreen.dart';
import 'package:bookstore/presentation/ProfileScreen/viewmodel/cubit/ProfileCubit.dart';
import 'package:bookstore/presentation/ProfileScreen/viewmodel/cubit/ProfileStates.dart';
import 'package:bookstore/presentation/UpdateProfile/view/UpdateProfileScreen.dart';
import 'package:bookstore/presentation/home/viewmodel/HomeCubit.dart';
import 'package:bookstore/presentation/home/viewmodel/HomeStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);

    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (BuildContext context, state) {

            if (state is LogoutSuccessState){
           //   ProfileCubit.get(context).userprofilemodel=null;
              Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            }

        if (state is ProfileSuccessState  ) {
          print("user profile doneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
          //  navto(context,UserProfileScreen());


        //  BlocProvider.of<HomeCubit>(context).GetSliders();
         // BlocProvider.of<BooksCubit>(context).GetAllProducts();


          Fluttertoast.showToast(
            msg: "Successfully get user data",
            backgroundColor: Colors.green,
          );



        }
        else if (state is ProfileErrorState){


        }
      },
        builder: (context,state) {

      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
     /*   appBar: AppBar(

            title: Text('User Profile'),
            backgroundColor: AppColors.primaryColor,
          ),*/
          body:
          (HomeCubit.get(context).userprofilemodel?.data!=null)?


          Column(
            children: [
              Stack(alignment: Alignment.center,
                children: [
                  Container(width: double.infinity,
                    height: MediaQuery.of(context).size.height/5,
                    decoration:  const BoxDecoration(
                        color: Color(0xFF05A4A6),


                        /*  gradient: LinearGradient(colors: [
                                Color(0xFF05A4A6),
                              //  AppColors.primaryColor,
                              ]),*/
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(120),
                            bottomLeft: Radius.circular(120))),),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Your Profile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                                  fontSize: 30.sp

                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      IconButton(onPressed: (){
                        HomeCubit.get(context).LogOut();
                      },

                        icon: Icon(Icons.logout),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20.h),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            HomeCubit.get(context).userprofilemodel!.data!.image!,
                          //  'https://example.com/profile_image.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      HomeCubit.get(context).userprofilemodel!.data!.name!,

                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      HomeCubit.get(context).userprofilemodel!.data!.email!,

                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10.h),
                    if(HomeCubit.get(context).userprofilemodel!.data!.address!= null)
                    Text(
                      HomeCubit.get(context).userprofilemodel!.data!.address!,

                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10.h),
                    if(HomeCubit.get(context).userprofilemodel!.data!.phone!= null)
                      Text(
                        HomeCubit.get(context).userprofilemodel!.data!.phone!,

                        style: TextStyle(fontSize: 16),
                      ),
                    SizedBox(height: 10.h),

                      if(HomeCubit.get(context).userprofilemodel!.data!.city!= null)
                      Text(
                        HomeCubit.get(context).userprofilemodel!.data!.city!,

                        style: TextStyle(fontSize: 16),
                      ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      onPressed: () {
                        navto(context,UpdateProfileScreen());
                      },

                      child: Text('Edit Profile'),
                    ),
                  ],
                ),
              ),
            ],
          ):Center(child: CircularProgressIndicator()),




        ),
      );
  }
    );
  }
}

