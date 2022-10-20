import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tatware/splash_screen.dart';

import 'core/services/services_locator.dart';
import 'homeScreen/presentation/bloc/home_bloc.dart';
import 'homeScreen/presentation/bloc/home_events.dart';
import 'homeScreen/repository/home_repo.dart';
import 'network_connectivity_bloc/network_bloc.dart';
import 'network_connectivity_bloc/network_events.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    bool isConnected = true;

    var listener = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          isConnected = true;
          BlocProvider.of<NetworkBloc>(navigatorKey.currentState!.context)
              .add(NetworkStatusChangeEvent(true));
          print('Data connection is available.');
          break;
        case InternetConnectionStatus.disconnected:
          isConnected = false;
          BlocProvider.of<NetworkBloc>(navigatorKey.currentState!.context)
              .add(NetworkStatusChangeEvent(false));
          print('You are disconnected from the internet.');
          break;
      }
    });

    return ScreenUtilInit(
        designSize: const Size(411.42857, 899.42857),
        builder: (context, _) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<HomeBloc>(
                  create: (BuildContext context) =>
                      HomeBloc(ExpertRepository())..add(LoadExpertListEvent())),
              BlocProvider<NetworkBloc>(
                  create: (BuildContext context) => NetworkBloc(isConnected)),
            ],
            child: FutureBuilder(
                future: Future.delayed(const Duration(seconds: 3)),
                builder: (context, AsyncSnapshot snapshot) {
                  return MaterialApp(
                    title: 'Tatware',
                    debugShowCheckedModeBanner: false,
                    home: const SplashScreen(),        navigatorKey: navigatorKey,
                    theme: ThemeData(primarySwatch: Colors.blue),
                    // onGenerateRoute: routes.onGenerateRoute,
                  );
                }),
          );
        });
  }
}
