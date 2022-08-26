import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.reference().child("item");

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todos"),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(right: 5, left: 5),
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: 'title',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Color.fromARGB(255, 255, 0, 0),
              onPressed: () {
                ref
                    .push()
                    .set(
                      title.text,
                    )
                    .asStream();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => FBase()));
              },
              child: Text(
                "save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
