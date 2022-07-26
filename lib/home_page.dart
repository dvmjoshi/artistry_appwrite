import 'dart:async';
import 'package:artistry_appwrite/animations/fade_animation.dart';
import 'package:artistry_appwrite/model/artisty_data.dart';
import 'package:artistry_appwrite/services/api_service.dart';
import 'package:artistry_appwrite/widgets/art_list.dart';
import 'package:artistry_appwrite/widgets/art_list_item.dart';
import 'package:artistry_appwrite/widgets/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  var refreshkey = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  List<Artisty>? artisty = ApiService.instance?.searchResults;
  void refreshlist() async {
    refreshkey.currentState
        ?.show(); // change atTop to false to show progress indicator at bottom
    await Future.delayed(const Duration(seconds: 2)); //wait here for 2 second
    setState(() {
      artisty = ApiService.instance?.artistys;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Artisty>? artisty = ApiService.instance?.searchResults;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          const Header(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FadeAnimation(
                1.2,
                SizedBox(
                  height: 40,
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      autofocus: false,
                      cursorColor: Colors.grey,
                      controller: searchController,
                      onChanged: (query) {
                        setState(() {
                          ApiService.instance?.query = query;
                        });
                      },
                      onSubmitted: (s) {
                        setState(() {
                          artisty == null;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none),
                        hintText: "Search art name",
                        hintStyle: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                )),
          ),
          Flexible(
            child: artisty == null
                ? const ArtList()
                : RefreshIndicator(
                    key: refreshkey,
                    onRefresh: () async {
                      refreshkey.currentState
                          ?.show(); // change atTop to false to show progress indicator at bottom
                      await Future.delayed(
                          const Duration(seconds: 2)); //wait here for 2 second
                      setState(() {
                        ApiService.instance?.searchResults;
                      });
                    },
                    child: ListView.builder(
                      itemCount: artisty.length,
                      itemBuilder: (context, index) {
                        return ArtListItem(
                          artisty: artisty[index],
                        );
                      },
                    ),
                  ),
          ),
        ],
      )),
    );
  }
}
