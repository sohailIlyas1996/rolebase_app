import 'package:flutter/material.dart';
import 'package:rolebase_app/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const List<String> list = <String>['Student', 'Teacher', 'Admin'];

  String dropdownvalue = list.first;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  // final formData = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email')),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'password')),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: const InputDecoration(hintText: 'age')),
          const SizedBox(
            height: 20,
          ),
          DropdownButton<String>(
            value: dropdownvalue,
            icon: const Icon(Icons.person, color: Colors.green),
            elevation: 16,
            style: const TextStyle(color: Colors.green),
            underline: Container(
              height: 2,
              color: Colors.grey,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownvalue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();

                sharedPreferences.setString(
                    'email', emailController.text.toString());

                sharedPreferences.setString(
                    'age', ageController.text.toString());
                sharedPreferences.setString('type', dropdownvalue);

                sharedPreferences.setBool('isLogin', true);
                Navigator.push(
                    context, MaterialPageRoute(builder: ((context) => Home())));

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
                child: const Center(child: Text('Log in')),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future<int> add() async {
    await Future.delayed(const Duration(seconds: 3));
    print('delayed');
    return 0;
  }
}
