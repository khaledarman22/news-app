abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}

class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{
  final String error;
  NewsGetSearchErrorState(this.error);
}

class NewsLoadingState extends NewsStates{}
class TopNewsSuccessState extends NewsStates{}
class TopNewsFailureState extends NewsStates{
  final String error;
  TopNewsFailureState(this.error);
}
class BusinessNewsSuccessState extends NewsStates{}
class BusinessNewsFailureState extends NewsStates{
  final String error;
  BusinessNewsFailureState(this.error);
}
class SportsNewsSuccessState extends NewsStates{}
class SportsNewsFailureState extends NewsStates{
  final String error;
  SportsNewsFailureState(this.error);
}
class SciencesNewsSuccessState extends NewsStates{}
class SciencesNewsFailureState extends NewsStates{
  final String error;
  SciencesNewsFailureState(this.error);
}