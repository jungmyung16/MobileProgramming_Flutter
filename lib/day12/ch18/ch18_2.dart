import 'package:flutter/material.dart';
import 'package:flutter_project_20195238/day12/ch18/ch18_1.dart';

void main() {
  runApp(ParentWidget());
}

class ParentWidget extends StatefulWidget {
  @override
  ParentWidgetState createState() => ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget> {
  bool favorited = false;
  int favoriteCount = 10;

  GlobalKey<ChildWidgetState> childKey = GlobalKey();
  int childCount = 0;

  void toggleFavorite() {
    setState(() {
      if(favorited) {
        favoriteCount -= 1;
        favorited = false;
      } else {
        favoriteCount += 1;
        favorited = true;
      }
    });
  }

  void getChildData() {
    ChildWidgetState? childState = childKey.currentState;
    setState(() {
      childCount = childState?.childCount ?? 0;
    });
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
          title: Text('20195238 장정명'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text('I am Parent, child count : $childCount'),
                ),
                ElevatedButton(onPressed: getChildData, child: Text('get child data')),
              ],
            ),
            ChildWidget(key: childKey),
            IconWidget(),
            ContentWidget()
          ],
        ),
      )
    );
  }
}

class ChildWidget extends StatefulWidget {
  ChildWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChildWidgetState();
  }
}

class ChildWidgetState extends State<ChildWidget> {
  int childCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('I am Child, $childCount'),
        ),
        ElevatedButton(
          child: Text('increment'),
          onPressed: () {
            setState(() {
              childCount++;
            });
          },
        ),
      ],
    );
  }
}

class IconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ParentWidgetState? state = context.findAncestorStateOfType<ParentWidgetState>();
    return Center(
      child: IconButton(
        icon: ((state?.favorited ?? false) ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
        color: Colors.red,
        iconSize: 200,
        onPressed: state?.toggleFavorite,
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ParentWidgetState? state = context.findAncestorStateOfType<ParentWidgetState>();
    return Center(
      child: Text(
        'favoriteCount : ${state?.favoriteCount}',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}