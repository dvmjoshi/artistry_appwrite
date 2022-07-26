import 'package:artistry_appwrite/screens/art_postpage.dart';
import 'package:artistry_appwrite/screens/signin/signin_page.dart';
import 'package:artistry_appwrite/services/api_service.dart';
import 'package:artistry_appwrite/widgets/letter_spacing.dart';
import 'package:flutter/material.dart';

import 'dart:ui' as ui;

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Container(
      decoration: const BoxDecoration(
        // color: const Color.fromRGBO(45, 45, 45, 1).withOpacity(.99),
        image: DecorationImage(
          image: NetworkImage(
              "https://cdn.dribbble.com/users/559871/screenshots/7147602/media/ca6bf494e7b501e403446d7846f657fb.gif"),
          fit: BoxFit.contain,
        ),
      ),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Artistry for all',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (context, animation, _) {
                            return const ArtPostPage();
                          },
                          opaque: false));
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                  IconButton(
                      onPressed: () {
                        ApiService.instance?.logout();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignInPage()));
                      },
                      icon: const Icon(Icons.logout)),
                ],
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: SpaceLetter(
                    name: 'APPWRITE',
                    fontsize: 14,
                    width: 150,
                    height: 30,
                    opacity: 0.4,
                    iconsize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 6,
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
