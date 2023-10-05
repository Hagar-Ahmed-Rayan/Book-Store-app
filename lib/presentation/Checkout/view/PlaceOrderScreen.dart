
import 'package:bookstore/core/SharedFunctions.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/presentation/BotttomNavBar/BottomNavBar.dart';
import 'package:bookstore/presentation/Checkout/viewmodel/CheckoutCubit.dart';
import 'package:bookstore/presentation/Checkout/viewmodel/CheckoutStates.dart';
import 'package:bookstore/presentation/ProfileScreen/viewmodel/cubit/ProfileCubit.dart';
import 'package:bookstore/presentation/ProfileScreen/views/UserProfileScreen.dart';
import 'package:bookstore/presentation/UpdateProfile/viewmodel/UpdateProfileCubit.dart';
import 'package:bookstore/presentation/UpdateProfile/viewmodel/updateprofileStates.dart';
import 'package:bookstore/presentation/cart/viewmodel/Cartcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
class PlaceOrderScreen extends StatelessWidget {
  PlaceOrderScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  num getGovernorateId(String governorateName ,modelData) {
    return modelData[governorateName];



  }
    void showPopupMessage(BuildContext context, String message) {




    }



  String ? cityname;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var profilecubit=BlocProvider.of<ProfileCubit>(context);
    nameController.text= profilecubit.userprofilemodel?.data?.name??'';
    phoneController.text= profilecubit.userprofilemodel?.data?.phone??'';
    emailController.text= profilecubit.userprofilemodel?.data?.email??'';
    addressController.text= profilecubit.userprofilemodel?.data?.address??'';
    return  Scaffold(body: SafeArea(
      child: BlocConsumer<UpdateProfileCubit, UpdateProfileStates>(
        listener: (context,state){


          if(state is PlaceOrderSuccessState) {
            print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
            //showPopupMessage(context, 'Order Placed');
          //  showPopupMessage(context, 'Order Placed');

            BlocProvider.of<CartCubit>(context).GetCart();

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Order Placed'),
                  content: Text('Your order has been placed successfully!'),
                  actions: [
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).pop(); // Navigate back to home screen

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NavBarScreen()),
                        );
                   //     Navigator.of(context).pop(); // Close the dialog
                     //   Navigator.of(context).pop(); // Navigate back to home screen
                      },
                    ),
                  ],
                );
              },
            );



          }

        },
        builder: (context, state) {
         // var cubit=BlocProvider.of<UpdateProfileCubit>(context);

           var cubit=UpdateProfileCubit.get(context);




          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(

                  children: [
                    Stack(alignment: Alignment.center,
                      children: [
                        Container(width: double.infinity,height: MediaQuery.of(context).size.height*0.10,
                          decoration:  const BoxDecoration(
                              color: Color(0xFF05A4A6),


                              /*  gradient: LinearGradient(colors: [
                              Color(0xFF05A4A6),
                            //  AppColors.primaryColor,
                            ]),*/
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(90),
                                  bottomLeft: Radius.circular(90))),),
                        Text('place order',
                            style: TextStyle(
                                fontWeight: FontWeight.bold

                            ))
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(

                        controller: nameController,
                        keyboardType:TextInputType.name,

                        decoration: InputDecoration(

                          labelText: 'name',
                          border: InputBorder.none,


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
                    ),




                    SizedBox(height: 20.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(

                        keyboardType:TextInputType.emailAddress,

                        controller:emailController ,
                        decoration: InputDecoration(
                          labelText: 'email',
                          border: InputBorder.none,

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
                    ),
                    SizedBox(height: 20.h,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(

                        keyboardType:TextInputType.phone,

                        controller:phoneController ,
                        decoration: InputDecoration(
                          labelText: 'phone',
                          border: InputBorder.none,

                          labelStyle: TextStyle(
                            color: AppColors.primaryColor
                            ,
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: AppColors.primaryColor
                            ,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone';
                          }
                          return null;
                        },
                      ),
                    ),



                    SizedBox(height: 20.h,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(

                        keyboardType:TextInputType.text,

                        controller:addressController ,
                        decoration: InputDecoration(
                          labelText: 'address',
                          border: InputBorder.none,

                          labelStyle: TextStyle(
                            color: AppColors.primaryColor
                            ,
                          ),
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: AppColors.primaryColor
                            ,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    (cubit.governmodel!=null)?
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w),
                      child: Container(
                        decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(value: cubit.newcity,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(16),
                            hint: const Text('Select a city'),
                            underline: const SizedBox(),
                            items: cubit.governmodel!.data!.map((e)  {
                              return DropdownMenuItem<String>(
                                value: e.governorateNameEn,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_city,color: Colors.grey[400]!),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(e.governorateNameEn!),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(), onChanged: (value)
                            {
                              cubit.changeCity(value);
                              cityname=value;
                              print("chossen id issssssssssssssssss");
                               print(cityname);

                          //    num id=  getGovernorateId(cityname! ,cubit.governmodel!.data) ;
                           //print("chossen id issssssssssssssssss");
                           //print(id);

                            }),
                      ),
                    ):
                    CircularProgressIndicator(),
                    SizedBox(height: 20.h,),
                    ElevatedButton(
                        onPressed: ()
                        {



                          if(formKey.currentState!.validate()){
                            print("the city isssssssss");

                            print( cubit.newcity);
                            print(cubit.governmodel?.data?[0].id);
                          cubit.PlaceOrder(nameController.text, '10', phoneController.text, addressController.text, emailController.text);

                          }


                        },
                        style: ElevatedButton.styleFrom(backgroundColor:AppColors.primaryColor
                        ),
                        child: const Text('place order'))

                  ],),
              ),
            ),
          );
        },
      ),
    ));
  }
}