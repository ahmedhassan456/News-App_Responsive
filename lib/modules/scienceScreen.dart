import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'ArticleItem.dart';

class NewsScience extends StatelessWidget {
  const NewsScience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).science;
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (context,state) => ConditionalBuilder(
        condition: state is !NewsGetScienceLoadingState,
        builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: list.length,
          separatorBuilder: (context,index) => Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20.0),
            child: Container(
              height: 1.0,
              color: Colors.red,
            ),
          ),
          itemBuilder: (context,index) => buildArticleItem(list[index],context),
        ),
        fallback: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      ),
      listener: (context,state) => {},
    );
  }
}
