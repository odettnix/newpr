import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_fl_pr/screens/registration.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => AuthStates();
}

class AuthStates extends State<SignIn> {
  TextEditingController controllerLogin = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Center(
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controllerLogin,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Логин не должен быть пустым";
                          }
                          if (value.length < 3) {
                            return "Логин должен быть от 3 символов";
                          }
                          if (value.length >= 15) {
                            return "Логин должен быть до 15 символов";
                          }
                          if (!(value.contains(RegExp(r'[A-Z]')) || value.contains(RegExp(r'[a-z]')))) {
                            return "Логин должен содержать минимум одну латинскую букву";
                          }
                          if (!value.contains(RegExp(r'[0-9]'))) {
                            return "Логин должен иметь хотя бы одну цифру";
                          }
                          return null;
                        }),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Логин",
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      ),
                      TextFormField(
                        controller: controllerPassword,
                        obscureText: true,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Пароль не должен быть пустым";
                          }
                          if (value.length < 3) {
                            return "Пароль должен быть от 3 символов";
                          }
                          if (value.length >= 15) {
                            return "Пароль должен быть до 15 символов";
                          }
                          if (!(value.contains(RegExp(r'[A-Z]')) || value.contains(RegExp(r'[a-z]')))) {
                            return "Пароль должен содержать минимум одну латинскую букву";
                          }
                          if (!value.contains(RegExp(r'[0-9]'))) {
                            return "Пароль должен иметь хотя бы одну цифру";
                          }
                          return null;
                        }),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Пароль",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (!key.currentState!.validate()) return;
                        const snackBar = SnackBar(
                          content: Text('Ошибка'),
                        );
                      },
                      child: const Text("Вход"),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Registration(),
                          ),
                        );
                      },
                      child: const Text("Регистрация"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}