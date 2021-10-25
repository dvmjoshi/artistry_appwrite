import 'package:artistry_appwrite/screens/signin/signin_page.dart';
import 'package:artistry_appwrite/screens/splash_page.dart';
import 'package:artistry_appwrite/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: FutureBuilder(
        future: ApiService.instance?.getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashPage();
          }
          if (snapshot.hasData) {
            return HomePage();
          }
          return const SignInPage();
        },
      ),
    );
  }
}
