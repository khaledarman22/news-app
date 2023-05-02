import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/constants/strings.dart';
import 'package:news/presentation/screens/business.dart';
import 'package:news/presentation/screens/science.dart';
import 'package:news/presentation/screens/sports.dart';
import 'package:news/presentation/screens/top_news.dart';

import '../../data/services/dio.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of<NewsCubit>(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems =
  [
    const BottomNavigationBarItem(
      icon: Icon(
       FontAwesomeIcons.house,
      ),
      label: 'Top news',
    ),
   const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.briefcase,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.futbol,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.vial,
      ),
      label: 'Science',
    ),
  ];

  List<Widget> screens =
  [
    const TopHeadScreen(),
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeBottomNavBar(int index)
  {
    currentIndex = index;
    if(index == 1) {
      getBusiness();
    }
    if(index == 2) {
      getSports();
    }
    if(index == 3) {
      getScience();
    }
    emit(NewsBottomNavState());
  }


  List<dynamic> topHead = [];

  void getTopHead()
  {
    emit(NewsLoadingState());

    DioHelper().getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'apiKey':MyStrings.apiKey,
      },
    ).then((value)
    {
      topHead = value.data['articles'];
      emit(TopNewsSuccessState());
    }).catchError((error){
      emit(TopNewsFailureState(error.toString()));
    });
  }
  List<dynamic> business = [];

  void getBusiness()
  {
    emit(NewsLoadingState());

    DioHelper().getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'business',
        'apiKey':MyStrings.apiKey,
      },
    ).then((value)
    {
      business = value.data['articles'];


      emit(BusinessNewsSuccessState());
    }).catchError((error){
      emit(BusinessNewsFailureState(error.toString()));
    });
  }
  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsLoadingState());

    DioHelper().getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'sports',
        'apiKey':MyStrings.apiKey,
      },
    ).then((value)
    {
      sports = value.data['articles'];
      emit(SportsNewsSuccessState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(SportsNewsFailureState(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience()
  {
    emit(NewsLoadingState());

    DioHelper().getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'science',
        'apiKey':MyStrings.apiKey,
      },
    ).then((value)
    {
      science = value.data['articles'];

      emit(SciencesNewsSuccessState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(SciencesNewsFailureState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelper().getData(
      url: 'v2/everything',
      query:
      {
        'q':value,
        'apiKey':MyStrings.apiKey,
      },
    ).then((value)
    {

      search = value.data['articles'];


      emit(NewsGetSearchSuccessState());
    }).catchError((error){

      emit(NewsGetSearchErrorState(error.toString()));
    });
  }



}