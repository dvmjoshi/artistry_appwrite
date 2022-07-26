import 'package:appwrite/appwrite.dart';
import 'package:artistry_appwrite/home_page.dart';
import 'package:artistry_appwrite/screens/signin/social_icons.dart';
import 'package:artistry_appwrite/screens/signup/signup_page.dart';
import 'package:artistry_appwrite/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_icons.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  @override
  State<SignInPage> createState() => _MyAppState();
}

class _MyAppState extends State<SignInPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final formkey = GlobalKey<FormState>();
  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    //
    ScreenUtil.init(
      context,
      designSize: const Size(750, 1334),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                    height: 280,
                    child: Image.network(
                        "https://cdn.dribbble.com/users/634508/screenshots/2652214/media/cee172a6db8670b79b5ef42e382025e5.gif")),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: Container(
                  height: 280,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.dribbble.com/users/25438/screenshots/3791427/media/b1634b575c24d778db8e695713ffa442.gif"),
                          fit: BoxFit.fitWidth)),
                ),
              )
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 28.0, right: 28.0, top: 35.0),
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("Your saviour",
                          style: TextStyle(
                              fontFamily: "Poppins-Bold",
                              fontSize: ScreenUtil().setSp(28),
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold)),
                      Text("Appwrite is here",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(28),
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(275),
                  ),
                  Form(
                      key: formkey,
                      child: Container(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(525),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0.0, 15.0),
                                  blurRadius: 15.0),
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0.0, -10.0),
                                  blurRadius: 10.0),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Login",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(45),
                                      letterSpacing: .6)),
                              SizedBox(
                                height: ScreenUtil().setHeight(15),
                              ),
                              Text("Email",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(26))),
                              TextFormField(
                                controller: _email,
                                decoration: const InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12.0)),
                                obscureText: false,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(30),
                              ),
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    fontSize: ScreenUtil().setSp(26)),
                              ),
                              TextFormField(
                                controller: _password,
                                decoration: const InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12.0)),
                                obscureText: true,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(35),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Poppins-Medium",
                                        fontSize: ScreenUtil().setSp(28)),
                                  )
                                ],
                              ),
                              SizedBox(height: ScreenUtil().setHeight(15)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      const SizedBox(
                                        width: 2.0,
                                      ),
                                      GestureDetector(
                                        onTap: _radio,
                                        child: radioButton(_isSelected),
                                      ),
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      const Text("Remember me",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Poppins-Medium"))
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: ScreenUtil().setWidth(300),
                                      height: ScreenUtil().setHeight(90),
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color(0xFF17ead9),
                                                Color(0xFF6078ea)
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: const Color(0xFF6078ea)
                                                    .withOpacity(.3),
                                                offset: const Offset(0.0, 8.0),
                                                blurRadius: 8.0)
                                          ]),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () async {
                                            try {
                                              await ApiService.instance?.login(
                                                  email: _email.text,
                                                  password: _password.text);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          const HomePage()));
                                            } on AppwriteException catch (e) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    e.message ?? "Unkownerror"),
                                              ));
                                            }
                                          },
                                          child: const Center(
                                            child: Text("SIGNIN",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Poppins-Bold",
                                                    fontSize: 18,
                                                    letterSpacing: 1.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: ScreenUtil().setHeight(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine(),
                      const Text("Social Login",
                          style: TextStyle(
                              fontSize: 16.0, fontFamily: "Poppins-Medium")),
                      horizontalLine()
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        colors: const [
                          Color(0xFF102397),
                          Color(0xFF187adf),
                          Color(0xFF00eaf8),
                        ],
                        iconData: CustomIcons.facebook,
                        onPressed: () {},
                      ),
                      InkWell(
                        onTap: () async {
                          try {
                            await ApiService.instance?.oAuthLogin("google");
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text(" Successfully account created")));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          } on AppwriteException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              e.message ?? " Unkown Error",
                            )));
                          }
                        },
                        child: SocialIcon(
                          colors: const [
                            Color(0xFFff4f38),
                            Color(0xFFff355d),
                          ],
                          iconData: CustomIcons.googlePlus,
                          onPressed: () {},
                        ),
                      ),
                      SocialIcon(
                        colors: const [
                          Color(0xFF17ead9),
                          Color(0xFF6078ea),
                        ],
                        iconData: CustomIcons.twitter,
                        onPressed: () {},
                      ),
                      SocialIcon(
                        colors: const [
                          Color(0xFF00c6fb),
                          Color(0xFF005bea),
                        ],
                        iconData: CustomIcons.linkedin,
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "New User? ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()));
                        },
                        child: const Text("SignUp",
                            style: TextStyle(
                                color: Color(0xFF5d74e3),
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
