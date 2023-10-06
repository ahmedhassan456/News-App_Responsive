import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/API/dioHelper.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/layout/NewsApp.dart';
import 'cubit/BLocObserver.dart';
import 'cubit/cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessData()..getSportsData()..getScienceData(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state){
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.orange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.orange,
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Colors.orange,
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.orange,
                type: BottomNavigationBarType.fixed,
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.orange,
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: ThemeData.dark().primaryColor,
              appBarTheme: AppBarTheme(
                actionsIconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                backgroundColor: ThemeData.dark().primaryColor,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: ThemeData.dark().primaryColor,
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: ThemeData.dark().primaryColor,
                selectedIconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                unselectedIconTheme: const IconThemeData(
                  color: Colors.grey,
                ),
                selectedLabelStyle: const TextStyle(
                  color: Colors.white,
                ),
                unselectedLabelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.white,
              ),
            ),
            themeMode: NewsCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const NewsApp(),
          );
        },
      ),
    );
  }

}

