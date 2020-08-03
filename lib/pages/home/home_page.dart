import 'package:flutter/material.dart';
import 'package:tulkit/constant.dart';
import 'package:tulkit/pages/home/applist/menu.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text(kAppName)),
      body: _currentPage,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(kAppName),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {_navigateToPageAndClose(Menu());},
            ),
          ],
        ),
      ),
    );
  }

  _navigateToPageAndClose(Widget page){
    setState(() {
      _currentPage = page;
    });
    Navigator.pop(context);
  }
}
