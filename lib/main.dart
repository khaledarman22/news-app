import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presentation/screens/home_page.dart';

import 'business/bloc_observer.dart';
import 'business/cubit/news_cubit.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  runApp(  const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<NewsCubit>(
          create: (context) => NewsCubit()
          ..getTopHead()
          ..getBusiness()
          ..getSports()
          ..getScience(),

        ),
      ],
      child:  MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme:  AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.blueGrey.shade100,
            titleTextStyle:  TextStyle(
              color:  Colors.blueGrey.shade900,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
            iconTheme: IconThemeData(
              size: 26,
              color: Colors.blueGrey.shade800,
            )
          ),
        ),
        themeMode:ThemeMode.light,
        debugShowCheckedModeBanner: false,
       home: HomeScreen(),
      ),
    );
  }
}
