import 'package:flutter/material.dart';
import 'package:tulkit/constants/strings.dart';
import 'package:tulkit/widgets/home/single_menu_option.dart';

import 'menu/menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Widget _currentPage;

  @override
  void initState() {
    _currentPage = Menu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(menuPadding),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: double.infinity,
              child: Text(
                kAppName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w100,
                    fontSize: 20,
                    letterSpacing: 10,
                    fontFamily: kLexFont),
              ),
            ),
          ),
        ),
        body: Menu(),
      ),
    );
  }
}
