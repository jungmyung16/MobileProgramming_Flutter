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
          title: Text('Row Column Stack'),
        ),
        body: SingleChildScrollView(  // 내 핸드폰 보다 Row 그래픽이 더 클경우 스크롤로 넘어갈 수 있다
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 50, height: 100, color: Colors.red,),
                    Container(width: 50, height: 50, color: Colors.green,),
                    Container(width: 50, height: 150, color: Colors.blue,),
                  ],
                )
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 5),
                  color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(width: 50, height: 100, color: Colors.red,),
                      Container(width: 50, height: 50, color: Colors.green,),
                      Container(width: 50, height: 150, color: Colors.blue,),
                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 5),
                  color: Colors.yellow,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(width: 50, height: 100, color: Colors.red,),
                      Container(width: 50, height: 50, color: Colors.green,),
                      Container(width: 50, height: 150, color: Colors.blue,),
                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 5),
                  color: Colors.yellow,
                  height: 200,
                  child: Stack(
                    children: [
                      Container(color: Colors.red,),
                      Container(width: 100, height: 100, color: Colors.green,),
                      Container(width: 50, height: 50, color: Colors.blue,),
                    ],
                  )
              )
            ],
          )
        ),
      )
    );
  }
}