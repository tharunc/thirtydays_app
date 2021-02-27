import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirtydays_app/routes.dart';
import 'login_page.dart';
import 'home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // int days = 30;
    // num temp = 30.5;
    // var day = 'Tuesday';
    // const pi = 3.14;
    // final

    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),


      routes: {
        // "/": (context) => HomePage(),
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),

        MyRoutes.loginRoute :(context) => LoginPage()
      },

    );
  }
}
