// ignore_for_file: unused_element

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:newskproject/loadingScreen.dart';
import 'package:newskproject/storedata.dart';
import 'addnote.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'home.dart';
import 'item/itemHome.dart';
import 'movie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // No rotate
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //initialization();
  // firebase
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // main app
  runApp(const MyApp());
}

// void initialization() async {
//   await Future.delayed(const Duration(seconds: 3));
//   FlutterNativeSplash.remove();
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SData(), //HomePage() FBase() ABS()
    );
  }
}

class FBase extends StatefulWidget {
  const FBase({super.key});
  @override
  State<FBase> createState() => _FBaseState();
}

class _FBaseState extends State<FBase> {
  late DatabaseReference _dbref;
  String databasejson = "";
  var newAge = "";
  var newAge2 = "";
  var status = "";

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.reference().child("item");
    //_readdb_onechild();
    //_realdb_once();
    //readData();
    // readMap();
    //_createDB();
    //_delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffCC941F),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => addnote(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'SEHacker',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        flexibleSpace: Image(
          image: AssetImage('assets/a.png'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Color(0xffCC941F),
      ),
      body: Column(children: <Widget>[
        Flexible(
          child: FirebaseAnimatedList(
              padding: EdgeInsets.all(10),
              query: _dbref,
              shrinkWrap: false,
              itemBuilder: (context, snapshot, animation, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Color(0xffCC941F),
                        content: buildText("Name : " +
                            snapshot.value["name"].toString() +
                            "\n" +
                            "Amount : " +
                            snapshot.value["value"].toString() +
                            " ៛")));
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tileColor: Color(0xffCC941F),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          onPressed: () {
                            _dbref.child(snapshot.key!).remove();
                          },
                        ),
                        title: buildText(
                            "Name : " + snapshot.value["name"].toString()),
                        subtitle: buildText("Amount : " +
                            snapshot.value["value"].toString() +
                            " ៛"),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ]),
    );
  }

  Text buildText(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  // _createDB() {
  //   _dbref.child("item").set({
  //     'item1': "item1",
  //     'item2': "item2",
  //     'item3': "item3",
  //     'item4': "item4"
  //   });
  // }

  // _readdb_onechild() {
  //   _dbref.child("item").once().then((DataSnapshot dataSnapshot) {
  //     setState(() {
  //       databasejson = dataSnapshot.value.toString();
  //     });
  //   });
  // }

  // _delete() {
  //   _dbref.child("item").remove();
  // }

  // void readData() {
  //   _dbref.child('item').child('item1').onValue.listen((Event event) {
  //     String data = event.snapshot.value;
  //     setState(() {
  //       newAge = data;
  //     });
  //   });
  // }

  void readMap() {
    _dbref.child("item").onValue.listen((event) {
      Map data = event.snapshot.value;
      data.forEach((key, value) {
        setState(() {
          newAge2 = data['item1'];
          status = data['item2'];
          _realdb_once();
        });
      });
    });
  }

  _realdb_once() {
    _dbref.child("item").once().then((DataSnapshot dataSnapshot) {
      setState(() {
        databasejson = dataSnapshot.value.toString();
      });
    });
  }
}
