import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Search'),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    cubit.getSearchData(value: value);
                  },
                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    cubit=AppCubit.get(context);
                    return defaultList(context: context,list:cubit.searchList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey,
                    );
                  },
                  itemCount: cubit.searchList.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
