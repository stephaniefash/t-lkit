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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Row(children: [
                  SizedBox(width: 100),
                  Text(
                    kAppName,
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 3,
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(width: 100),
                  TabBar(
                    isScrollable: false,
                    indicatorColor: Colors.pinkAccent,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Home"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Home"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Home"),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Menu(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }

  _singleTab(label){
    return Tab(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(label),
      )
    );
  }
}
