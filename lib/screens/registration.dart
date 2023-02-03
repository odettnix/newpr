import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_fl_pr/cubit/auth_cubit.dart';
import 'package:new_fl_pr/user.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => RegistrationState();
}

class RegistrationState extends State<Registration> {
  TextEditingController controllerLogin = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Center(
                child: Form(
                  key: key,
                  child: BlocConsumer<AuthCubit, AuthState>(

                    listener: (context, state) {
                      if(state is ErrorState){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));

                      }
                    },
                    builder: (context, state) {
                      return Column(
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
                              if (!(value.contains(RegExp(r'[A-Z]')) ||
                                  value.contains(RegExp(r'[a-z]')))) {
                                return "Логин должен содержать минимум латинскую букву";
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
                              if (!(value.contains(RegExp(r'[A-Z]')) ||
                                  value.contains(RegExp(r'[a-z]')))) {
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
                      );
                    },
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
                      },
                      child: const Text("Зарегистрироваться"),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if(_key.currentState!.validate()){
                          context.read<AuthCubit>.Registration(User(userName: nameController.text, password: passwordController.text));

                        }
                      },
                      child: const Text("Назад"),
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
