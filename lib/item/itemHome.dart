import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemButton extends StatelessWidget {
  const ItemButton({super.key, required this.icon, required this.title});

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                        onPressed: () {
                          
                        },
                        child: Text("YES")),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("CLOSE"))
                  ],
                  title: Image(
                    image: AssetImage(icon),
                    height: 90,
                  ),
                  content: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ));
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 7, color: Color.fromARGB(122, 0, 0, 0)),
        ], borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(icon),
                height: 90,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
