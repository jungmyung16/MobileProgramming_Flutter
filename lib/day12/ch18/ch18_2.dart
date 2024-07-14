import 'package:flutter/material.dart';

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
}