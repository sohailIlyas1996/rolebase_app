import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rolebase_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String email = '', age = '', type = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString('email') ?? '';
    age = sharedPreferences.getString('age') ?? '';
    type = sharedPreferences.getString('type') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('email'), Text(email)]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('age is'), Text(age)]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('age is'), Text(type)]),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();

                  sharedPreferences.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => LoginScreen())));

                  // SharedPreferences sp = await SharedPreferences.getInstance();
                  // sp.setString('name', 'sohail ilyas');
                  // sp.setInt('age', 26);
                  // sp.setBool('isLogin', false);
                  // print(sp.getString('name'));
                  // print(sp.getBool('isLogin').toString());
                  // print(sp.getInt('age').toString());

                  // sp.remove('name');
                  // print(sp.getString('name'));
                },
                child: Container(
                  height: 50,
                  color: const Color.fromARGB(255, 54, 244, 105),
                  width: double.infinity,
                  child: const Center(child: Text('Log Out')),
                ),
              ),
            ]),
      ),
    );
  }
}
