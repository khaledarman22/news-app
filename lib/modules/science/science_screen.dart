import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<dynamic> list = AppCubit.get(context).scienceList;
        //return defaultList(list: list,);
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return defaultList(context: context,list:list[index]);
          },
          separatorBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            );
          },
          itemCount: list.length,
        );
      },
    );
  }
}
