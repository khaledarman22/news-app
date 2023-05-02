import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:news/constants/images.dart';
import 'package:news/presentation/screens/search_screen.dart';

import '../../business/cubit/news_cubit.dart';
import '../../business/cubit/news_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  Widget buildNoInternetWidget(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Image.asset(
            MyImages.noInternetImg,
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
          ),
          Text(
            ' Can\'t connect.. check your internet',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if (connected) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('News App'),
                    actions: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.search)),
                    ],
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    selectedItemColor: Colors.blueGrey.shade600,
                    unselectedItemColor: Colors.blueGrey.shade400,
                    items: cubit.bottomItems,
                    currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      cubit.changeBottomNavBar(index);
                    },
                  ),
                  body: cubit.screens[cubit.currentIndex],
                );
              } else {
                return Scaffold(
                  body: buildNoInternetWidget(context),
                );
              }
            },
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            ),
          );
        });
  }
}
