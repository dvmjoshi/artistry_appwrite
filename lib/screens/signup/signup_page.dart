import 'package:appwrite/appwrite.dart';
import 'package:artistry_appwrite/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _MyAppState();
}

class _MyAppState extends State<SignUpPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
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
                        "https://cdn.dribbble.com/users/634508/screenshots/2829739/media/c5c6c9e0c4bd87ccc8bb1f14aa2c88d9.gif")),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                height: 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.dribbble.com/users/25438/screenshots/3791427/media/b1634b575c24d778db8e695713ffa442.gif"),
                        fit: BoxFit.fitWidth)),
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
                      Text("Divyam is here",
                          style: TextStyle(
                              fontFamily: "Poppins-Bold",
                              fontSize: ScreenUtil().setSp(28),
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(350),
                  ),
                  Form(
                      key: formkey,
                      child: Container(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(500),
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
                              Text("Register",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(45),
                                      fontFamily: "Poppins-Bold",
                                      letterSpacing: .6)),
                              SizedBox(
                                height: ScreenUtil().setHeight(30),
                              ),
                              Text("Email",
                                  style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                      fontSize: ScreenUtil().setSp(26))),
                              TextFormField(
                                controller: _email,
                                decoration: const InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12.0)),
                                obscureText: false,
                                // validator: (value)=>
                                // value.isEmpty ? validation: null,
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
                            ],
                          ),
                        ),
                      )),
                  SizedBox(height: ScreenUtil().setHeight(40)),
                  Row(
                    children: const[
                      SizedBox(
                        width: 12.0,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                    ],
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: ScreenUtil().setWidth(330),
                        height: ScreenUtil().setHeight(100),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                            borderRadius: BorderRadius.circular(6.0),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0xFF6078ea).withOpacity(.3),
                                  offset: const Offset(0.0, 8.0),
                                  blurRadius: 8.0)
                            ]),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              try {
                                await ApiService.instance?.signup(
                                    email: _email.text,
                                    password: _password.text);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            " Successfully account created")));
                                Navigator.pop(context);
                              } on AppwriteException catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: Text(
                                  e.message ?? " Unkown Error",
                                )));
                              }
                            },
                            child: const Center(
                              child: Text("SIGNUP",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      letterSpacing: 1.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
