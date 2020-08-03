import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        color: Color.fromRGBO(228, 236, 240, 1),
      ),
      margin: EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      height: double.infinity,
      child: Text("app list"),
    );
  }
}
