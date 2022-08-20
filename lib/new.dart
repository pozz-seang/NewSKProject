// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'new.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     FlutterNativeSplash.remove();
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: spin(),//SpinningWheel()
//     );
//   }
// }

// class SpinningWheel extends StatefulWidget {
//   const SpinningWheel({super.key});

//   @override
//   State<SpinningWheel> createState() => _SpinningWheelState();
// }

// class _SpinningWheelState extends State<SpinningWheel> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color.fromARGB(255, 255, 0, 0),
//       child: Column(children: [
//         Flexible(
//           flex: 1,
//           child: Container(
//             child: Stack(
//               children: [
//                 Positioned(
//                   top: 111,
//                   left: 45,
//                   child: Image(
//                     image: AssetImage("assets/roulette-8-300.png"),
//                     height: 270,
//                   ),
//                 ),
//                 Positioned(
//                   top: 210,
//                   left: 145,
//                   child: Image(
//                     image: AssetImage("assets/roulette-center-300.png"),
//                     height: 70,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }
