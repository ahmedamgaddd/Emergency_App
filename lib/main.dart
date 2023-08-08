
import 'package:emergency_app/screens/home_screen.dart';
import 'package:emergency_app/screens/splash_screen.dart';
import 'package:emergency_app/screens/vehivlefuel_screen.dart';
import 'package:emergency_app/sign_up/cubit/signUp_cubit.dart';
import 'package:emergency_app/sign_up/sign_up%20_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_cubit/cubit.dart';
import 'app_cubit/states.dart';
import 'bloc_observe/bloc.dart';
import 'login/Login_Screen.dart';
import 'login/cubit/login_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..getWinch3Data(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            routes: {
              LoginScreen.routeName: (_) => LoginScreen(),
              SignUpScreen.routeName: (_) => SignUpScreen(),
              HomeScreen.routeName: (_) => const HomeScreen(),
              VehivleFuelScreen.routeName: (_) => const VehivleFuelScreen(),
            },
          );
        },
      ),
    );
  }
}
