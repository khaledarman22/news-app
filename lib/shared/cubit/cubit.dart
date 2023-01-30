import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sport/sport_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/shared_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper/dio_helper.dart';

import '../../modules/technology/technology_screen.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.adb),
      label: 'Technology',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_rounded),
      label: 'Science',
    ),
  ];

  List<Widget> screens = [
    TecnologyScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  void changeScreen(int index) {
    currentIndex = index;
    emit(AppChangeScreenState());
  }

  bool isDark = false;

  void changeMode({value}) {
    if (value == null) {
      isDark = !isDark;
      SharedHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    } else {
      isDark = value;
      emit(AppChangeModeState());
    }
  }

  List<dynamic> techList = [];

  void getTechnologyData() {
    emit(AppGetTechnologyLoadingState());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'technology',
        'apiKey': '6154cd308a9e4cc59e1c8613f793fccc',
      },
    ).then((value) {
      //print('value : ${value}'); work
      techList = value.data['articles'];
      emit(AppGetTechnologySuccessState());
    }).catchError(
      (error) {
        emit(AppGetTechnologyErrorState(error));
      },
    );
  }

  List<dynamic> sportList = [];

  void getSportData() {
    emit(AppGetSportLoadingState());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sport',
        'apiKey': '6154cd308a9e4cc59e1c8613f793fccc',
      },
    ).then((value) {
      //print('value : ${value}'); work
      sportList = value.data['articles'];
      emit(AppGetSportSuccessState());
    }).catchError(
      (error) {
        emit(AppGetSportErrorState(error));
      },
    );
  }

  List<dynamic> scienceList = [];

  void getScienceData() {
    emit(AppGetScienceLoadingState());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '6154cd308a9e4cc59e1c8613f793fccc',
      },
    ).then((value) {
      scienceList = value.data['articles'];
      emit(AppGetScienceSuccessState());
    }).catchError(
          (error) {
        emit(AppGetScienceErrorState(error));
      },
    );
  }

  List<dynamic> searchList = [];

  void getSearchData({required String value}) {
    emit(AppGetSearchLoadingState());
    DioHelper.getData(
      path: 'v2/everything',
      query: {
        'q': value,
        'apiKey': '6154cd308a9e4cc59e1c8613f793fccc',
      },
    ).then((value) {
      searchList = value.data['articles'];
      emit(AppGetSearchSuccessState());
    }).catchError(
          (error) {
            print('error is:${error.toString()}');
        emit(AppGetSearchErrorState(error));
      },
    );
  }

}
