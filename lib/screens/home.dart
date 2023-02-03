
import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
                "Пользователь",
              ),
          ElevatedButton(
            onPressed: () {
            },
            child: const Text("Назад"),
          ),
        ],
      ),
    );
  }
}