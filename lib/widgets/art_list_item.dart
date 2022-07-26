import 'package:artistry_appwrite/animations/fade_animation.dart';
import 'package:artistry_appwrite/animations/fader_route.dart';
import 'package:artistry_appwrite/model/artisty_data.dart';
import 'package:artistry_appwrite/screens/art_postpage.dart';
import 'package:artistry_appwrite/screens/detail_page.dart';
import 'package:flutter/material.dart';

import 'nemorphic_container.dart';

class ArtListItem extends StatelessWidget {
  final Artisty? artisty;
  const ArtListItem({Key? key, this.artisty}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [Color(0xff323232), Color(0xff000000)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: const Offset(0, 1))
          ],
        ),
        child: FadeAnimation(
          1,
          Container(
            padding: const EdgeInsets.all(18),
            child: Stack(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          FadeRoute(
                              page: DetailPage(
                            artisty: artisty,
                          )));
                    },
                    onLongPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ArtPostPage(
                                    artisty: artisty,
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset: const Offset(0, 1))
                          ]),
                      height: 170,
                      width: 170,
                      child: NeumorphicContainer(
                        color: Colors.black12,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300.0),
                          child: Image.network(
                            artisty!.artImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          artisty!.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        const Text(
                          '|',
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 10,
                            fontSize: 10,
                          ),
                        ),
                        const Text(
                          "Thinker",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ArtPostPage(
                                      artisty: artisty,
                                    )));
                      },
                      child: NeumorphicContainer(
                        color: Colors.black12,
                        child: const Text(
                          "Update",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
