import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/SettingsScreen.dart';

import '../API/dioHelper.dart';
import '../modules/businessScreen.dart';
import '../modules/scienceScreen.dart';
import '../modules/sportsScreen.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;

  List<Widget> screens = [
    const NewsBusiness(),
    const NewsSports(),
    const NewsScience(),
    const NewsSettings(),
  ];

  void changeBottomNav(index){
    currentIndex = index;
    emit(NewsBottomNavStates());
  }

  List<dynamic> business =[];
  void getBusinessData(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'us',
      'category':'business',
      'apiKey':'aa8801ce0b954090be023656db2e098c',
    },).then((value) {
      //print(value?.data.toString());
      business = value?.data['articles'];
      print(value?.data['articles'][0]);
      print(business[0]['articles']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print('Catch Error ${error.toString()}');
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports =[];
  void getSportsData(){
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'us',
      'category':'sports',
      'apiKey':'aa8801ce0b954090be023656db2e098c',
    },).then((value) {
      //print(value?.data.toString());
      sports = value?.data['articles'];
      print(value?.data['articles'][0]);
      print(sports[0]['articles']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print('Catch Error ${error.toString()}');
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science =[];
  void getScienceData(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'us',
      'category':'science',
      'apiKey':'aa8801ce0b954090be023656db2e098c',
    },).then((value) {
      //print(value?.data.toString());
      science = value?.data['articles'];
      print(value?.data['articles'][0]);
      print(science[0]['articles']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print('Catch Error ${error.toString()}');
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }
}