import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class addnote extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController value = TextEditingController();

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.reference().child("item");

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todos"),
        flexibleSpace: Image(
          image: AssetImage('assets/a.png'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Color(0xffCC941F),
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
              child: Column(
                children: [
                  TextField(
                    controller: name,
                    decoration: InputDecoration(
                      hintText: 'Name',
                    ),
                  ),
                  TextField(
                    controller: value,
                    decoration: InputDecoration(
                      hintText: 'Value',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Color(0xffCC941F),
              onPressed: () {
                ref
                    .push()
                    .set({"name": name.text, "value": value.text}
                    )
                    .asStream();
                Navigator.pop(context,true);
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
