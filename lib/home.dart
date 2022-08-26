// ignore_for_file: deprecated_member_use, unnecessary_import, unused_import
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

import 'item/itemHome.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Menu",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.red),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemButton(icon: "assets/s_logo.png", title: "Test1"),
                  SizedBox(
                    width: 20,
                  ),
                  ItemButton(icon: "assets/s_logo.png", title: "Test2"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemButton(icon: "assets/s_logo.png", title: "Test3"),
                  SizedBox(
                    width: 20,
                  ),
                  ItemButton(icon: "assets/s_logo.png", title: "Test4"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemButton(icon: "assets/s_logo.png", title: "Test5"),
                  SizedBox(
                    width: 20,
                  ),
                  ItemButton(icon: "assets/s_logo.png", title: "Test6"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemButton(icon: "assets/s_logo.png", title: "Test7"),
                  SizedBox(
                    width: 20,
                  ),
                  ItemButton(icon: "assets/s_logo.png", title: "Test8"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemButton(icon: "assets/s_logo.png", title: "Test9"),
                  SizedBox(
                    width: 20,
                  ),
                  ItemButton(icon: "assets/s_logo.png", title: "Test10"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemButton(icon: "assets/s_logo.png", title: "Test11"),
                  SizedBox(
                    width: 20,
                  ),
                  ItemButton(icon: "assets/s_logo.png", title: "Test12"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemButton(icon: "assets/s_logo.png", title: "Test13"),
                  SizedBox(
                    width: 20,
                  ),
                  ItemButton(icon: "assets/s_logo.png", title: "Test14"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemButton(icon: "assets/s_logo.png", title: "Test15"),
                  SizedBox(
                    width: 20,
                  ),
                  ItemButton(icon: "assets/s_logo.png", title: "Test16"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemButton(icon: "assets/s_logo.png", title: "Test17"),
                  SizedBox(
                    width: 20,
                  ),
                  ItemButton(icon: "assets/s_logo.png", title: "Test18"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemButton(icon: "assets/s_logo.png", title: "Test19"),
                  SizedBox(
                    width: 20,
                  ),
                  ItemButton(icon: "assets/s_logo.png", title: "Test20"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
