import 'dart:async';

import 'package:artistry_appwrite/animations/siwpe_button.dart';
import 'package:artistry_appwrite/model/artisty_data.dart';
import 'package:artistry_appwrite/services/api_service.dart';
import 'package:flutter/material.dart';

class ArtPostPage extends StatefulWidget {
  final Artisty? artisty;

  const ArtPostPage({Key? key, this.artisty}) : super(key: key);

  @override
  _ArtPostPageState createState() => _ArtPostPageState();
}

class _ArtPostPageState extends State<ArtPostPage> {
  TextEditingController saveName = TextEditingController();
  TextEditingController saveImage = TextEditingController();
  TextEditingController saveDescription = TextEditingController();
  late bool _isEdit;
  late int _transactionType;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    _isEdit = widget.artisty != null;
    saveName =
        TextEditingController(text: _isEdit ? widget.artisty?.name : null);
    saveImage =
        TextEditingController(text: _isEdit ? widget.artisty?.artImage : null);
    saveDescription = TextEditingController(
        text: _isEdit ? widget.artisty?.description : null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Post Your Art",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(milliseconds: 1500),
                  builder: (context, value, child) {
                    var v;
                    if (value != null) {
                      v = value;
                    }
                    return ShaderMask(
                        shaderCallback: (rect) {
                          return RadialGradient(
                                  radius: v * 5,
                                  colors: [
                                    Colors.white,
                                    Colors.white,
                                    Colors.transparent,
                                    Colors.transparent
                                  ],
                                  stops: [0.0, 0.55, 0.6, 1.0],
                                  center: FractionalOffset(0.95, 0.0))
                              .createShader(rect);
                        },
                        child: SingleChildScrollView(
                          child: Stack(children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 90, 20, 20),
                              child: Image.network(
                                  "https://cdn.dribbble.com/users/1068771/screenshots/8714646/media/ef9757747e1c7f4058cf70f8e259b37e.jpg"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 50, 20, 20),
                              child: Container(
                                width: double.infinity,
                                //  height: ScreenUtil.getInstance().setHeight(520),
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                        255, 250, 250, 100),
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
                                  padding: const EdgeInsets.all(18.0),
                                  child: Form(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            maxLength: 15,
                                            controller: saveName,
                                            decoration: InputDecoration(
                                              labelText: "Name",
                                              hintText: "Enter name",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            maxLength: 120,
                                            controller: saveDescription,
                                            keyboardType:
                                                TextInputType.multiline,
                                            decoration: InputDecoration(
                                              labelText: "Art Description",
                                              hintText: "Less than 120 words",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: saveImage,
                                            keyboardType:
                                                TextInputType.multiline,
                                            decoration: InputDecoration(
                                              labelText: "Image",
                                              hintText: "Enter your image url",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: SwipeButton(
                                              initialPosition:
                                                  SwipePosition.SwipeLeft,
                                              thumb: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Image.network(
                                                    "https://i.pinimg.com/originals/7c/43/0b/7c430ba6fb3cd7058aec52cb84a080e6.png"),
                                              ),
                                              content: Center(
                                                child: Row(
                                                  children: const [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Swipe to Post",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                        Icons.arrow_circle_up,
                                                        size: 40,
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              onChanged: (result) async {
                                                Artisty artisty = Artisty(
                                                  id: _isEdit
                                                      ? widget.artisty?.id
                                                      : null,
                                                  name: saveName.text,
                                                  description:
                                                      saveDescription.text,
                                                  artImage: saveImage.text,
                                                );
                                                if (_isEdit) {
                                                  ApiService.instance
                                                      ?.updateArt(artisty);
                                                } else {
                                                  ApiService.instance
                                                      ?.addArt(artisty);
                                                }
                                                Navigator.of(context).pop();
                                                //    _controllerCenter.play();
                                                //     Timer(Duration(seconds:1), (){
                                                //       Navigator.of(context).pop();
                                                //     });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ));
                  }),
            );
          },
        ));
  }
}
