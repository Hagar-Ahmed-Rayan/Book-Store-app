import 'package:bookstore/core/SharedFunctions.dart';
import 'package:bookstore/core/appcolors.dart';
import 'package:bookstore/core/loadingWidget.dart';
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
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeSuccessState) {

          Fluttertoast.showToast(
            msg: "Successfully get slider data",
            backgroundColor: Colors.green,
          );
        }
      },
      builder: (context, state) {
        var homeCubit=HomeCubit.get(context);
        final imageUrls = HomeCubit.get(context).sliderModel?.data?.sliders;

        return Scaffold(
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
                    (BlocProvider.of<ProfileCubit>(context).userprofilemodel!=null)?

                    Text(
                      'Hi ${BlocProvider.of<ProfileCubit>(context).userprofilemodel!.data!.name!}',


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
                (BlocProvider.of<ProfileCubit>(context).userprofilemodel!=null)?

                NetworkImage(
                   BlocProvider.of<ProfileCubit>(context).userprofilemodel!.data!.image!,

                ): NetworkImage(

                      'https://img.freepik.com/free-photo/african-american-man-working-open-air-man-suit-sunglasses-with-beard-using-laptop-sitting-terrace-rooftops-working-manager-technology-concept_74855-25538.jpg?w=996&t=st=1696182445~exp=1696183045~hmac=768522bb303b1b3035706095587b868ff76670d50ce07cf5c8c61c22e8a9c5ef',
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
            CarouselSlider(
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
            ):CustomLoadingIndicator(),
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
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ),
                (homeCubit.bestsellerModel?.data?.products != null && homeCubit.bestsellerModel!.data!.products!.isNotEmpty)?
                  SizedBox(
                    height: 170.h,
                    child: ListView.builder(itemBuilder:(context,index)=> BestSellerItem(product: homeCubit.bestsellerModel!.data!.products![index],),
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
        );
      },
    );
  }
}