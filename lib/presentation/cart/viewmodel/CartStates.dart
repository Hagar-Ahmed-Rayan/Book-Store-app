import 'package:bookstore/presentation/cart/models/cartmodel/CartModel.dart';
import 'package:bookstore/presentation/favourite/models/FavouriteModel/FavouriteModel.dart';

abstract class CartStates {}
class CartInitialState extends  CartStates{}



//GetALL cart
class GetCartLoadingState extends   CartStates{}
class GetCartSuccessState extends   CartStates
{


}
class GetCartErrorState extends   CartStates
{
  String error;
  GetCartErrorState(this.error);
}




///add to favourite
class AddToCartLoadingState extends   CartStates{}
class AddToCartSuccessState extends   CartStates
{
  final CartModel cartmodel;
  AddToCartSuccessState(this.cartmodel);
}
class AddToCartErrorState extends   CartStates
{
  String error;
  AddToCartErrorState(this.error);
}
/////remove from cart
class RemoveCartLoadingState extends   CartStates{}
class RemoveCartSuccessState extends   CartStates
{
  final CartModel cartmodel;
  RemoveCartSuccessState(this.cartmodel);
}
class RemoveCartErrorState extends   CartStates
{
  String error;
  RemoveCartErrorState(this.error);
}
//update cart
class UpdateCartLoadingState extends   CartStates{}
class UpdateCartSuccessState extends   CartStates
{
  final CartModel cartmodel;
  UpdateCartSuccessState(this.cartmodel);
}
class UdateCartErrorState extends   CartStates
{
  String error;
  UdateCartErrorState(this.error);
}
// //change icon color
// class ChangFavColorSucessState extends   FavouriteStates{}