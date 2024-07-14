import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<MyApp>
    with SingleTickerProviderStateMixin {

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue, // AppBar의 배경 색상을 설정
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tab Bar'),
          bottom: TabBar(
            controller: controller,
            tabs: [
              Tab(text: 'One',),
              Tab(text: 'Two',),
              Tab(text: 'Three',),
            ]
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            Center(
              child: Text(
                'One Screen',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
            ),
            Center(
                child: Text(
                  'Two Screen',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
            ),
            Center(
                child: Text(
                  'Three Screen',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
            ),
          ],
        )
      ),
    );
  }
}