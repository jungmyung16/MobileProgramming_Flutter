import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Intrinsic Constrained Test'),
          ),
          body: Column(
            children: [
              IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(width: 50, height: 50, color: Colors.red,),
                    Container(width: 150, height: 150, color: Colors.green,),
                    Container(width: 100, height: 100, color: Colors.blue,),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 300, maxHeight: 50),
                child: Container(width: 150, height: 150, color: Colors.amber,)
              )
            ],
          )
        )
    );
  }
}