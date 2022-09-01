// ignore_for_file: unused_field, unnecessary_import, unused_import
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newskproject/Ads.dart';
import 'package:newskproject/home.dart';
import 'package:video_player/video_player.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'config/OpenNewScreenAnimation.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late DatabaseReference _dbref;
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _playVideo();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff0B0C28),
      ),
      child: Center(
        child: Container(
          height: 160,
          width: 160,
          child: VideoPlayer(
            _controller,
          ),
        ),
      ),
    );
  }

  void _playVideo() async {
    _controller = VideoPlayerController.asset("assets/loading.mp4")
      ..initialize().then((value) {
        setState(() {});
      })
      ..setVolume(0);
    _controller.play();
    await Future.delayed(Duration(seconds: 3));
    GetAds();
  }

  void GetAds() {
    _dbref = FirebaseDatabase.instance.reference().child("ads").child("show");
    _dbref.once().then((DataSnapshot dataSnapshot) {
      if (dataSnapshot.value) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => showAds()),
          (Route<dynamic> route) => false,
        );
      } else {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false,
        );
      }
    });
  }
}
