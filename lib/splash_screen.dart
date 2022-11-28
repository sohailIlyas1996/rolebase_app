import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rolebase_app/home.dart';
import 'package:rolebase_app/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), (() {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const LoginScreen())));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Image(
            height: double.infinity,
            fit: BoxFit.fitHeight,
            image: NetworkImage(
                'https://images.pexels.com/photos/12695259/pexels-photo-12695259.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')));
  }
}
