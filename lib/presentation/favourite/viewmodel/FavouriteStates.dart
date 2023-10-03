import 'package:bookstore/presentation/favourite/models/FavouriteModel/FavouriteModel.dart';

abstract class FavouriteStates {}
class FavouriteInitialState extends  FavouriteStates{}



//GetALLFavourites
class GetFavouriteLoadingState extends   FavouriteStates{}
class GetFavouriteSuccessState extends   FavouriteStates
{


}
class GetFavouriteErrorState extends   FavouriteStates
{
  String error;
  GetFavouriteErrorState(this.error);
}
///add to favourite
class AddToFavouriteLoadingState extends   FavouriteStates{}
class AddToFavouriteSuccessState extends   FavouriteStates
{
  final FavouriteModel favouriteModel;
  AddToFavouriteSuccessState(this.favouriteModel);
}
class AddToGetFavouriteErrorState extends   FavouriteStates
{
  String error;
  AddToGetFavouriteErrorState(this.error);
}
/////remove from fav
class RemoveFavouriteLoadingState extends   FavouriteStates{}
class RemoveFavouriteSuccessState extends   FavouriteStates
{
  final FavouriteModel favouriteModel;
  RemoveFavouriteSuccessState(this.favouriteModel);
}
class RemoveFavouriteErrorState extends   FavouriteStates
{
  String error;
  RemoveFavouriteErrorState(this.error);
}

//change icon color
class ChangFavColorSucessState extends   FavouriteStates{}
class FillFavIdsState extends   FavouriteStates{}