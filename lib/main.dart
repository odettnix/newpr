import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_fl_pr/cubit/auth_cubit.dart';
import 'package:new_fl_pr/screens/SignIn.dart';
import 'package:new_fl_pr/screens/home.dart';
import 'package:new_fl_pr/screens/registration.dart';
import 'package:new_fl_pr/screens/screen.dart';
import 'package:new_fl_pr/user.dart';

import 'locator_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  // await Dio().put('http://127.0.0.1:8888/token',
  //     data:
  //         const User(userName: "userName", email: "email", password: "password")
  //             .toJson());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home: Auth(),
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        initialRoute: '/auth',
        routes: {
          '/auth': (_) => SignIn(),
          '/registration': (_) => BlocProvider(
              create: (context) => sl<AuthCubit>(), child: Registration()),
          '/home': (_) => Home(),
          '/profile': (_) => Screen(),
        });
  }
}
