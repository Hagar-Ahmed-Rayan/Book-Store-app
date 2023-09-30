abstract class BooksStates {}
class BooksInitialState extends  BooksStates{}
class GetProductsLoadingState extends   BooksStates{}
class GetProductsSuccessState extends   BooksStates
{


}
class GetProductsErrorState extends   BooksStates
{
  String error;
  GetProductsErrorState(this.error);
}