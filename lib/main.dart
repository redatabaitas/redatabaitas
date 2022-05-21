// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nijad_app/auth/login.dart';
import 'package:nijad_app/auth/sinup.dart';
import 'package:nijad_app/constonts.dart';
import 'package:nijad_app/screens/add_produits.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/home_page.dart';

late SharedPreferences sherfPre;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sherfPre = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nijad Patess',
      theme: ThemeData(
        primaryColor: kPrimaryColors,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      initialRoute: sherfPre.getString('id') == null ? 'Login' : "MyHomePage",
      routes: {
        'Login': (context) => Login(),
        'SignUp': (context) => SignUp(),
        'MyHomePage': (context) => MyHomePage(),
        'AddProduits': (context) => AddProduits(),
      },
    );
  }
}
