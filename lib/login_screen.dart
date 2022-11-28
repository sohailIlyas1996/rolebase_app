import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.setString('name', 'sohail ilyas');
              sp.setInt('age', 26);
              print(sp.getString('name'));
            },
            child: Container(
              height: 50,
              color: const Color.fromARGB(255, 54, 244, 105),
              width: double.infinity,
              child: const Center(child: Text('Log in')),
            ),
          ),
        ),
      ]),
    );
  }

  Future<int> add() async {
    await Future.delayed(const Duration(seconds: 3));
    print('delayed');
    return 0;
  }
}
