
import 'package:flutter/material.dart';



class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => ScreenState();
}

class ScreenState extends State<Screen> {
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