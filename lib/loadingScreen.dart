// ignore_for_file: unused_field, unnecessary_import, unused_import
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newskproject/storedata.dart';
import 'package:video_player/video_player.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/loading.mp4")
      ..initialize().then((value) {
        setState(() {});
      })
      ..setVolume(0);
    _playVideo();
  }

  void _playVideo() async {
    _controller.play();
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SData()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(
                  _controller,
                ),
              )
            : Container());
  }
}
