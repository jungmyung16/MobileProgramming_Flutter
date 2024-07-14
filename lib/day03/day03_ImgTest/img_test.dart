import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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
            title: Text('Image Widget'),
          ),
          body: Column(
              children: [
                Image(image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
                )),
                Container(
                  color: Colors.red,
                  child: Image.asset(
                    'images/big.jpeg',
                    width: 200,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                )
              ],
          ),
      ),
    );
  }
}
