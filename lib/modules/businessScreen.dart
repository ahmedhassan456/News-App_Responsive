import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:capped_progress_indicator/capped_progress_indicator.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/WebView.dart';
import 'ArticleItem.dart';

class NewsBusiness extends StatelessWidget {
  const NewsBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).business;
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => {},
      builder: (context, state) => ConditionalBuilder(
        condition: state is! NewsGetBusinessSuccessState,
        builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: list.length,
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 1.0,
              color: Colors.red,
            ),
          ),
          itemBuilder: (context, index) => buildArticleItem(list[index],context),
        ),
        fallback: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
