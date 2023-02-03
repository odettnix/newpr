import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_fl_pr/screens/auth.dart';
import 'package:new_fl_pr/user.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Dio().put('http://127.0.0.1:8888/token', 
  data: const User(
    userName: "userName", 
    email: "email", 
    password: "password").toJson());

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Auth(),
      debugShowCheckedModeBanner: false,
    );
  }
}
