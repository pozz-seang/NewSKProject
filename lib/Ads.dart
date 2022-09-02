// ignore_for_file: unused_import, unnecessary_import, unused_field, unused_element, deprecated_member_use

import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newskproject/home.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class showAds extends StatefulWidget {
  const showAds({super.key});

  @override
  State<showAds> createState() => _showAdsState();
}

class _showAdsState extends State<showAds> {
  late DatabaseReference _dbref;
  var skip = 5;
  String imgAds = '';
  String urlAds = '';

  @override
  void initState() {
    super.initState();
    GetAds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          _launchUrl(urlAds);
        },
        child: Stack(children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Shimmer.fromColors(
                baseColor: Color.fromARGB(255, 197, 197, 197),
                highlightColor: Color.fromARGB(255, 248, 248, 248),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffCC941F)),
                  ),
                ),
              )),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgAds),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  right: 30,
                  child: ElevatedButton(
                    child: Text(skip.toString() + " Skip",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {
                      skip = 0;
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void GetAds() {
    _dbref = FirebaseDatabase.instance.reference().child("ads");
    _dbref.child("img").once().then((DataSnapshot dataSnapshot) {
      setState(() {
        imgAds = dataSnapshot.value.toString();
      });
    });
    _dbref.child("url").once().then((DataSnapshot dataSnapshot) {
      setState(() {
        urlAds = dataSnapshot.value.toString();
      });
    });
    ads();
  }

  void ads() async {
    await Future.delayed(const Duration(seconds: 3));
    while (skip > 0) {
      setState(() {
        skip--;
      });
      await Future.delayed(const Duration(seconds: 1));
    }

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Home()),
      (Route<dynamic> route) => false,
    );
  }

  Future<void> _launchUrl(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(
        urlString,
        forceWebView: true,
        forceSafariVC: true,
        enableDomStorage: true,
      );
    }
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
}
