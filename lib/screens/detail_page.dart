import 'package:artistry_appwrite/model/artisty_data.dart';
import 'package:artistry_appwrite/services/api_service.dart';
import 'package:artistry_appwrite/services/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class DetailPage extends StatelessWidget {
  final Artisty? artisty;
  const DetailPage({Key? key, this.artisty}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 450,
            child: Stack(
              children: <Widget>[
                Column(
                  children: [
                    Poster(image: artisty!.artImage),
                    Container(
                      height: 110,
                      color: HexColor("#3A244E"),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        artisty!.name,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const PosterAvatar(
                  image:
                      "https://cdn.dribbble.com/users/498340/screenshots/15255976/media/4b9f7dcdbcd47b9165f2b9ae3b060618.jpg?compress=1&resize=800x600",
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                " Art Description",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              artisty!.description,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey[900],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                child: Row(
                  children: const [
                    Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ],
                ),
                onPressed: () async {
                  bool confirm = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: const Text("Are you sure you want to delete ?"),
                      title: const Text("Confirm Delete"),
                      actions: <Widget>[
                        TextButton(
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () => Navigator.pop(context, false),
                        ),
                        TextButton(
                          child: const Text("Delete"),
                          onPressed: () => Navigator.pop(context, true),
                        ),
                      ],
                    ),
                  );
                  if (confirm) {
                    await ApiService.instance?.deleteArt(artisty!);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Poster extends StatelessWidget {
  final String image;

  const Poster({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween<double>(begin: 0, end: 300),
      builder: (context, child, animation) {
        return Container(
          height: animation,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

class PosterAvatar extends StatelessWidget {
  final String image;

  const PosterAvatar({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomAnimation<double>(
      duration: const Duration(milliseconds: 600),
      delay: Duration(milliseconds: (300 * 2).round()),
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.elasticInOut,
      builder: (context, child, scalevalue) {
        return Positioned(
          top: 255,
          left: 8,
          child: Transform.scale(
            scale: scalevalue,
            alignment: Alignment.center,
            child: Container(
              height: 95,
              width: 95,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.black38, width: 5),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0.5, 1.0),
                    blurRadius: 5,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
