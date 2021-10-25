import 'package:artistry_appwrite/animations/fade_animation.dart';
import 'package:artistry_appwrite/model/artisty_data.dart';
import 'package:artistry_appwrite/services/api_service.dart';
import 'package:artistry_appwrite/widgets/art_list_item.dart';
import 'package:flutter/material.dart';

class ArtList extends StatefulWidget {
  @override
  State<ArtList> createState() => _ArtListState();
}

class _ArtListState extends State<ArtList> {
  var refreshkey = GlobalKey<RefreshIndicatorState>();
  List<Artisty>? artistydata;
  @override
  void initState() {
    super.initState();
    artistydata = ApiService.instance?.artistys;
  }

  Future<Null> refreshlist() async {
    refreshkey.currentState
        ?.show(); // change atTop to false to show progress indicator at bottom
    await Future.delayed(Duration(seconds: 2)); //wait here for 2 second
    setState(() {
      artistydata = ApiService.instance?.artistys;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: refreshkey,
      onRefresh: refreshlist,
      child: ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: artistydata?.length,
        itemBuilder: (context, index) {
          Artisty artisty = artistydata![index];
          return FadeAnimation(
              (1.0 + index) / 4,
              ArtListItem(
                artisty: artisty,
              ));
        },
      ),
    );
  }
}
