import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:newskproject/addnote.dart';

import 'config/OpenNewScreenAnimation.dart';

class dataUser extends StatefulWidget {
  const dataUser({super.key});
  @override
  State<dataUser> createState() => _dataUserState();
}

class _dataUserState extends State<dataUser> {
  late DatabaseReference _dbref;
  String databasejson = "";
  var newAge = "";
  var newAge2 = "";
  var status = "";

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.reference().child("item");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffCC941F),
        onPressed: () {
          Navigator.of(context).push(OpenScreen(addnote()));
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
                              " ???")));
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
                              " ???"),
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

}
