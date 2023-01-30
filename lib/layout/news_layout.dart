import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/cubit/cubit.dart';

import '../modules/business/technology_screen.dart';
import '../modules/science/science_screen.dart';
import '../modules/technology/technology_screen.dart';
import '../shared/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context: context,screen: SearchScreen());
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeMode();
                },
                icon: const Icon(Icons.brightness_4_rounded),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.navBarItems,
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeScreen(value);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
