import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/business/cubit/news_cubit.dart';
import 'package:news/presentation/widgets/custom_text_field.dart';

import '../../business/cubit/news_state.dart';
import '../widgets/article.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context, state){} ,
      builder: (context, state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomTextFiled(

                  onChange: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  hint: 'Search 🔍',

                ),
              ),
              Expanded(child: articleBuilder(list, context,isSearch:true)),
            ],
          ),
        );
      },
    );
  }
}
