import 'package:flutter/material.dart';
import 'package:flutter_project_20195238/day13/ch19/ch19_4.dart';
import 'package:provider/provider.dart';

Stream<int> streamFun() async* {
  for(int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        body: MultiProvider(
          providers: [
            FutureProvider<String>(
              create: (context) =>
                Future.delayed(Duration(seconds: 4), () => "world"),
              initialData: "hello",
            ),
            StreamProvider<int>(
              create: (context) => streamFun(), initialData: 0)
          ],
          child: SubWidget(),
        ),
      ),
    );
  }
}

class SubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var futureState = Provider.of<String>(context);
    var streamState = Provider.of<int>(context);
    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'future : ${futureState}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'stream : ${streamState}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
