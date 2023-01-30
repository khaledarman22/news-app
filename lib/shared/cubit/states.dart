abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppChangeScreenState extends AppStates{}
class AppChangeModeState extends AppStates{}

class AppGetTechnologySuccessState extends AppStates{}
class AppGetTechnologyLoadingState extends AppStates{}
class AppGetTechnologyErrorState extends AppStates{
  String error;
  AppGetTechnologyErrorState(this.error);
}
//sport
class AppGetSportSuccessState extends AppStates{}
class AppGetSportLoadingState extends AppStates{}
class AppGetSportErrorState extends AppStates{
  String error;
  AppGetSportErrorState(this.error);
}
//science
class AppGetScienceSuccessState extends AppStates{}
class AppGetScienceLoadingState extends AppStates{}
class AppGetScienceErrorState extends AppStates{
  String error;
  AppGetScienceErrorState(this.error);
}
//search
class AppGetSearchSuccessState extends AppStates{}
class AppGetSearchLoadingState extends AppStates{}
class AppGetSearchErrorState extends AppStates{
  String error;
  AppGetSearchErrorState(this.error);
}