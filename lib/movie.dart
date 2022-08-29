// ignore_for_file: unused_import, unnecessary_import
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newskproject/main.dart';
import 'package:newskproject/storedata.dart';

class ABS extends StatefulWidget {
  const ABS({super.key});

  @override
  State<ABS> createState() => _ABSState();
}

class _ABSState extends State<ABS> {
  late DatabaseReference _dbref;
  List<Model> list = [];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    _dbref = FirebaseDatabase.instance.reference().child("h");
    readData();
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
              Model model = new Model(
                  name: value['title'], value: value['url'], key: key);
              list.add(model);
            });
            setState(() {});
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                Image.asset(
                  "assets/s_logo_bg.png",
                  width: double.infinity,
                  height: 190,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  value,
                  width: double.infinity,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ]),
            ),
            Text(name,style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),)
          ]),
        ),
      );
    }

    // Text(name), Text(value),
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(
          image: AssetImage('assets/a.png'),
          fit: BoxFit.cover,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FBase()),
              );
            },
            child: Text(
              "GET DATA",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
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
}

class Model {
  String name, value, key;
  Model({required this.name, required this.value, required this.key});
}
