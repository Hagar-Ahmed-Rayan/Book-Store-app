import 'package:bookstore/core/errorwidget.dart';
import 'package:bookstore/core/loadingWidget.dart';
import 'package:bookstore/presentation/ProductsScreen/view/widgets/ProductItem.dart';
import 'package:bookstore/presentation/search/viewmodel/SearchStates.dart';
import 'package:bookstore/presentation/search/viewmodel/searchcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);

    return SafeArea(
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (context,state){
          if (state is SearchSuccessState){
            Fluttertoast.showToast(
              msg: "Successfully get search product",
              backgroundColor: Colors.green,
            );

          }

        },
        builder: (context,state){
      return Scaffold(

        body: Padding(
          padding: const EdgeInsets.symmetric( vertical: 20.0,horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(

                key: formKey,

                child: Column(

                  children: [
                    TextFormField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your book';
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                        hintText: 'search for your book',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            print(searchController.text);
                             SearchCubit.get(context).GetSearchItems(searchController.text);

                            if(SearchCubit.get(context).productmodel!.data!.products!.isEmpty== true){
                              print("yesssssssssssssssssssssssssssssssssss");
                            }
                            else if(SearchCubit.get(context).productmodel!.data!.products!.isEmpty== false){
                              print("nooooooooooooooooo");
                              print("length isssssssssssssssssssssssssss");

                              print( SearchCubit.get(context).productmodel!.data!.products!.length);
                            }
                            // Handle search button press
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),









             SizedBox(height: 20),
              if( state is SearchSuccessState && SearchCubit.get(context).productmodel!.data!.products!.isEmpty== false)
                    Expanded(
                      child: SizedBox(
                       height: 170.h,
                        child: ListView.builder(
                          itemBuilder:(context,index)=> ProductItem(product: SearchCubit.get(context).productmodel!.data!.products![index]),
                          itemCount: SearchCubit.get(context).productmodel?.data?.products!.length ,
                          //   itemCount: 500 ,
                          //   itemBuilder:(context,index)=> Text('uuuuuu'),

                          scrollDirection: Axis.vertical,
                          //   shrinkWrap: true,
                          physics:ScrollPhysics(),

                        ),
                      ),
                    )

              else if(state is SearchLoadingState)
                CustomLoadingIndicator()
              else if(state is SearchErrorState)
                  CustomErrorWidget(errorMessage: state.error,)
              else if( state is SearchSuccessState &&SearchCubit.get(context).productmodel!.data!.products!.isEmpty== true)
               Center(
                 child:Text("There is No Items ")
               )

            ],
          ),
        ),
      );


  }
      ),
    );
  }
}

