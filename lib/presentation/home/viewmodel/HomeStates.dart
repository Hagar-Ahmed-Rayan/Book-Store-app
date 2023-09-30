
abstract class HomeStates {}
class HomeInitialState extends  HomeStates{}
class HomeLoadingState extends   HomeStates{}
class HomeSuccessState extends   HomeStates
{


}
class HomeErrorState extends   HomeStates
{
  String error;
  HomeErrorState(this.error);
}
////////////////////best sellerv states
class BestSellerLoadingState extends   HomeStates{}
class BestSellerSuccessState extends   HomeStates{}
class BestSellerErrorState extends   HomeStates{
  String error;
  BestSellerErrorState(this.error);
}
//get categories states
class CategoriesLoadingState extends   HomeStates{}
class CategoriesSuccessState extends   HomeStates{}
class CategoriesErrorState extends   HomeStates{
  String error;
  CategoriesErrorState(this.error);
}


///get arrivals
class ArrivalsLoadingState extends   HomeStates{}
class ArrivalsSuccessState extends   HomeStates{}
class ArrivalsErrorState extends   HomeStates{
  String error;
  ArrivalsErrorState(this.error);
}