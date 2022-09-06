// ignore_for_file: unused_import, unnecessary_import, unused_field
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newskproject/config/OpenNewScreenAnimation.dart';
import 'package:newskproject/getLocation.dart';
import 'package:newskproject/main.dart';
import 'package:newskproject/Ads.dart';
import 'package:newskproject/userList.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

import 'config/firebase_options.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> body = [
    HHome(),
    getLocation(),
    Icon(Icons.person),
  ];
  List<String> title = [
    "HOME",
    'Location',
    "PROFILE",
  ];
  List<Icon> icon = [
    Icon(Icons.home),
    Icon(Icons.location_on),
    Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    // Text(name), Text(value),
    return Scaffold(
      appBar: AppBar(
        title: Text(title[_currentIndex]),
        centerTitle: true,
        flexibleSpace: Image(
          image: AssetImage('assets/a.png'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Color(0xffCC941F), //BackG AppBar
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(OpenScreen(dataUser()));
            },
            child: Text("GET DATA",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Color(0xff0B0C28),
          elevation: 0,
          selectedItemColor: Color.fromARGB(255, 255, 255, 255),
          unselectedItemColor: Color.fromARGB(255, 110, 110, 110),
          type: BottomNavigationBarType.fixed,
          iconSize: 25,
          selectedFontSize: 16,
          unselectedFontSize: 14,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: title[0],
              icon: icon[0],
            ),
            BottomNavigationBarItem(
              label: title[1],
              icon: icon[1],
            ),
            BottomNavigationBarItem(
              label: title[2],
              icon: icon[2],
            )
          ],
        ),
      ),
    );
  }
}

class HHome extends StatefulWidget {
  const HHome({super.key});

  @override
  State<HHome> createState() => _HHomeState();
}

class _HHomeState extends State<HHome> {
  late DatabaseReference _dbref;
  List<Model> list = [];

  String MAE = "";

  void getMAE() {
    int time = DateTime.now().hour;
    if (5 <= time && 11 >= time) {
      MAE = "Good Morning";
    } else if (12 <= time && 16 >= time) {
      MAE = "Good Afternoon";
    } else {
      MAE = "Good Evening";
    }
  }

  @override
  void initState() {
    super.initState();
    getMAE();

    _dbref = FirebaseDatabase.instance.reference().child("h");

    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () async {
            readData();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  MAE + ", PSeang",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                child: GridView.builder(
                  padding: EdgeInsets.all(20),
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
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
                    return UI(item.name, item.value, item.key, item.p);
                  },
                ),
              ),
            ],
          )),
    );
  }

  Widget UI(String name, String value, String key, bool p) {
    if ((p == true)) {
      return GestureDetector(
        onLongPress: () {},
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffCC941F)),
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
    } else {
      return Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 221, 221, 221),
        highlightColor: Color.fromARGB(255, 248, 248, 248),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffCC941F)),
          ),
        ),
      );
    }
  }

  void readData() {
    list = [];
    for (var i = 0; i < 6; i++) {
      Model model = Model(name: "null", value: "null", key: "null", p: false);
      list.add(model);
    }

    _dbref.onValue.listen((Event event) {
      setState(() {
        _dbref.once().then(
          (DataSnapshot dataSnapshot) {
            var data = dataSnapshot.value;
            list = [];
            list.clear;
            data.forEach((key, value) {
              Model model = Model(
                  name: value['title'], value: value['url'], key: key, p: true);
              list.add(model);
              print(model);
            });
            setState(() {});
          },
        );
      });
    });
  }
}
