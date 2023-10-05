import 'package:bookstore/presentation/cart/models/cartmodel/CartModel.dart';
import 'package:bookstore/presentation/favourite/models/FavouriteModel/FavouriteModel.dart';

abstract class CheckoutStates {}
class CheckoutInitialState extends  CheckoutStates{}




class CheckoutLoadingState extends   CheckoutStates{}
class CheckoutSuccessState extends   CheckoutStates
{


}
class CheckoutErrorState extends   CheckoutStates
{
  String error;
  CheckoutErrorState(this.error);
}
