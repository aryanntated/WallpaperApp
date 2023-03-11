// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wallpapperapp/Pages/home_page.dart';
import 'package:wallpapperapp/Pages/login_page.dart';
import 'package:wallpapperapp/utilities/routes.dart';
import 'package:wallpapperapp/widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: homepage(),
      themeMode: ThemeMode.dark,
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      debugShowCheckedModeBanner: false,
      // initialroute is used to choose default page
      routes: {
        "/": (context) => Homepage(),
        MyRoutes.homeRoute: (context) =>
            const Homepage(), // here myroutes ka funct is made so that we dont need to make a new object.
        MyRoutes.loginRoute: (context) =>
            const Loginpage(), //default page, if default page is there then we cannot use "/"
      },
    );
  }
}
