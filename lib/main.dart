// ignore_for_file: unused_element, unused_import, unused_local_variable, deprecated_member_use

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:newskproject/loadingScreen.dart';
import 'package:newskproject/Ads.dart';
import 'package:newskproject/userList.dart';
import 'addnote.dart';
import 'config/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'home.dart';
import 'item/itemHome.dart';

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
  //Test no bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xffffff),
  ));
  // main app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backwardsCompatibility: false, // 1
            systemOverlayStyle: SystemUiOverlayStyle.light),
      ),
      home: Home(), //LoadingScreen()
    );
  }
}



// https://raw.githubusercontent.com/pozz-seang/NewSKProject/main/data.json