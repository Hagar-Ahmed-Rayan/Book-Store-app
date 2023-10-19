import 'package:bookstore/core/SharedFunctions.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/core/loadingWidget.dart';
import 'package:bookstore/presentation/LoginScreen/view/SignInScreen.dart';
import 'package:bookstore/presentation/ProfileScreen/viewmodel/cubit/ProfileCubit.dart';
import 'package:bookstore/presentation/home/view/widgets/ArrivalItem.dart';
import 'package:bookstore/presentation/home/view/widgets/BestSellerItem.dart';
import 'package:bookstore/presentation/home/view/widgets/CategoryItem.dart';
import 'package:bookstore/presentation/home/viewmodel/HomeCubit.dart';
import 'package:bookstore/presentation/home/viewmodel/HomeStates.dart';
import 'package:bookstore/presentation/search/view/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController _bestSellerListController = ScrollController();

    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeSuccessState) {

         /* Fluttertoast.showToast(
            msg: "Successfully get slider data",
            backgroundColor: Colors.green,
          );*/
        }
      },
      builder: (context, state) {
        var homeCubit=HomeCubit.get(context);
        final imageUrls = HomeCubit.get(context).sliderModel?.data?.sliders;

        return WillPopScope(
          onWillPop: () async {
             print("yesssssssssssssssssssssssssssssssssssssss");
           //  Navigator.pop(context);
         /*   Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignInScreen()),
            );*/
            return true; // Return true to prevent the default back navigation
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              title:    Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                     /* (BlocProvider.of<ProfileCubit>(context).userprofilemodel!.data==null)?
                      Text(
                        'Hi, ${BlocProvider.of<ProfileCubit>(context).userprofilemodel!.data!.name!}',



                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ),*/
                      (HomeCubit.get(context).userprofilemodel!=null)?

                      Text(
                        'Hi ${HomeCubit.get(context).userprofilemodel!.data!.name!}',


                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ):Text(
                        'Hi',



                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                      child: Text(
                        'What are you reading today ?',
                        style: TextStyle(
                          color: Colors.black,

                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              leading:                  Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage:
                  (HomeCubit.get(context).userprofilemodel!=null)?

                  NetworkImage(
                    HomeCubit.get(context).userprofilemodel!.data!.image!,

                  ): NetworkImage(

                        'https://img.freepik.com/premium-vector/character-working-computer_466450-1489.jpg?w=740',
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
               navto(context,SearchScreen());
                    // Handle search button press
                  },
                ),
              ],


            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  (imageUrls != null && imageUrls.isNotEmpty)?
              /*CarouselSlider(
                options: CarouselOptions(
                  height: 130.h,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  aspectRatio: MediaQuery.of(context).size.aspectRatio,
                  // Set the aspectRatio based on the aspect ratio of the device's screen
                ),
                items: imageUrls.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: double.infinity,
                        child: AspectRatio(
                          aspectRatio: MediaQuery.of(context).size.aspectRatio,
                          child: Image.network(
                            imageUrl.image!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              )*/
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 130.h,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      aspectRatio: MediaQuery.of(context).size.aspectRatio,
                      // Set the aspectRatio based on the aspect ratio of the device's screen
                      scrollPhysics: BouncingScrollPhysics(), // Use BouncingScrollPhysics for a smoother scroll
                    ),
                    items: imageUrls.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: double.infinity,
                            child: AspectRatio(
                              aspectRatio: MediaQuery.of(context).size.aspectRatio,
                              child: Image.network(
                                imageUrl.image!,
                                fit: BoxFit.contain,
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    // You can customize the placeholder or loading state here
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  )




                      :CustomLoadingIndicator(),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text("Best Seller",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,

                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            _bestSellerListController.animateTo(
                              _bestSellerListController.offset + MediaQuery.of(context).size.width,
                              curve: Curves.linear,
                              duration: Duration(milliseconds: 500),
                            );


                          },
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                  ),
                  (homeCubit.bestsellerModel?.data?.products != null && homeCubit.bestsellerModel!.data!.products!.isNotEmpty)?
                    SizedBox(
                      height: 170.h,
                      child: ListView.builder(itemBuilder:(context,index)=> BestSellerItem(product: homeCubit.bestsellerModel!.data!.products![index],),
                        controller: _bestSellerListController, // Add this line

                        itemCount: homeCubit.bestsellerModel?.data?.products?.length??0,
                      scrollDirection: Axis.horizontal,),
                    ):CustomLoadingIndicator(),





                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text("Categories",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,

                          ),),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 130.h,
                    child: ListView.builder(itemBuilder:(context,index)=> CategoryItem(category: homeCubit.cateogriesmodel!.data!.categories![index]),
                      itemCount: homeCubit.cateogriesmodel?.data?.categories?.length??0,
                      scrollDirection: Axis.horizontal,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text("New Arrivals",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,

                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 220.h,
                    child: ListView.builder(itemBuilder:(context,index)=> ArrivalItem(product: homeCubit.arrivalsmodel!.data!.products![index]),
                      itemCount: homeCubit.arrivalsmodel?.data?.products?.length??0,
                      scrollDirection: Axis.horizontal,),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}