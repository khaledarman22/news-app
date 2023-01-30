import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/shared_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper/dio_helper.dart';

import 'block_observer.dart';
import 'layout/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await SharedHelper.init();
  bool? isDark = SharedHelper.getBoolean(key: 'isDark');

  BlocOverrides.runZoned(
    () {
      runApp(NewsApp(isDark));
    },
    blocObserver: MyBlocObserver(),
  );
}

class NewsApp extends StatelessWidget {
  final bool? isDark;

  NewsApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getTechnologyData()
        ..changeMode(value: isDark)
        ..getScienceData()
        ..getSportData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              backgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                color: Colors.white,
                elevation: 0.0,
                actionsIconTheme: IconThemeData(
                  color: Colors.black,
                  size: 30.0,
                ),
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                elevation: 2.0,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                //unselectedItemColor: Colors.grey,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                color: HexColor('333739'),
                elevation: 0.0,
                actionsIconTheme: IconThemeData(
                  color: Colors.white,
                  size: 30.0,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                elevation: 2.0,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor('333739'),
                //unselectedItemColor: Colors.grey,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: (AppCubit.get(context).isDark)
                ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
