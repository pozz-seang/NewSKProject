import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newskproject/movie.dart';
import 'package:path_provider/path_provider.dart';

class SData extends StatefulWidget {
  const SData({super.key});

  @override
  State<SData> createState() => _SDataState();
}

class _SDataState extends State<SData> {
  var skip = 5;
  bool op = true;

  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);
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

    if (op) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ABS()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/b.png'),
            // NetworkImage('https://cdn.wallpapersafari.com/21/83/p7NJPD.jpg'),
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
    );
  }
}
