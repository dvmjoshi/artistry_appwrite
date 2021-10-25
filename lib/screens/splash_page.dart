import 'package:artistry_appwrite/widgets/nemorphic_container.dart';
import 'package:flutter/material.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Scaffold(body: Center(
      child:  Text(
        'Appwrite for all',
        style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = linearGradient),
      ),
    ));
  }
}
