import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tatware/splash_screen.dart';

import 'homeScreen/presentation/bloc/home_bloc.dart';
import 'homeScreen/presentation/bloc/home_events.dart';
import 'homeScreen/repository/home_repo.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411.42857, 899.42857),
        builder: (context, _) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<HomeBloc>(
                  create: (BuildContext context) =>
                  HomeBloc(ExpertRepository())
                    ..add(LoadExpertListEvent()))
            ],
            child: MaterialApp(
              title: 'Tiba Rose',
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
              theme: ThemeData(primarySwatch: Colors.blue),
              // onGenerateRoute: routes.onGenerateRoute,
            ),
          );
        });
  }
}
