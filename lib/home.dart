// ignore_for_file: unused_import, unnecessary_import
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newskproject/main.dart';
import 'package:newskproject/Ads.dart';
import 'package:newskproject/userList.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseReference _dbref;
  List<Model> list = [];
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    _dbref = FirebaseDatabase.instance.reference().child("h");
    readData();
  }

  @override
  Widget build(BuildContext context) {
    // Text(name), Text(value),
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        flexibleSpace: Image(
          image: AssetImage('assets/a.png'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Color(0xffCC941F), //BackG AppBar
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => dataUser()));
            },
            child: Text("GET DATA",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: Container(
        child: GridView.builder(
          padding: EdgeInsets.all(20),
          shrinkWrap: false,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 250,
          ),
          itemCount: list.length,
          itemBuilder: (_, index) {
            final item = list[index];
            return UI(item.name, item.value, item.key);
          },
        ),
      ),
    );
  }

  Scaffold get Test => Scaffold();

  Widget UI(String name, String value, String key) {
    return GestureDetector(
      onLongPress: () {},
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.red),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Stack(children: [
              Image.asset("assets/s_logo_item.png",
                  width: double.infinity, height: 190, fit: BoxFit.cover),
              Image.network(value,
                  width: double.infinity, height: 190, fit: BoxFit.cover)
            ]),
          ),
          Text(name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }

  void readData() {
    _dbref.onValue.listen((Event event) {
      setState(() {
        _dbref.once().then(
          (DataSnapshot dataSnapshot) {
            var data = dataSnapshot.value;
            list = [];
            list.clear;
            data.forEach((key, value) {
              Model model =
                  Model(name: value['title'], value: value['url'], key: key);
              list.add(model);
            });
            setState(() {});
          },
        );
      });
    });
  }
}

class Model {
  String name, value, key;
  Model({required this.name, required this.value, required this.key});
}
