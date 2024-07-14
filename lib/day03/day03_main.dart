import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 애셋 이용을 위한 rootBundle 제공
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // rootBundle을 이용해 애셋 파일을 읽어 반환하는 함수
  // Future는 비동기 테이터를 의미
  Future<String> useRootBundle() async {
    return await rootBundle.loadString('assets/text/my_text.txt');
  }
  // DefaultAssetBundle을 이용해 애셋 파일을 읽어 반환하는 함수
  Future<String> useDefaultAssetBundle(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('assets/text/my_text.txt');
  }
  //const MyApp({super.key});

  // This widget is the root of your application.

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

        body:
        Container(
          height: Size.infinite.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.yellow,
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0), // 상단 여백 추가
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // 위젯들을 위쪽으로 정렬
                children: [
                  FaIcon(
                   FontAwesomeIcons.trophy, size: 50,
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/icon/block.png'), // 추가하려는 이미지
                        fit: BoxFit.contain,
                      ),
                    ),
                    width: 100,
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/icon/mario.png'), // 추가하려는 이미지
                        fit: BoxFit.contain,
                      ),
                    ),
                    width: 100,
                    height: 150,
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage('images/icon/brick.png'), // 기존 이미지
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 150,
                    height: 150,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'HE',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'L',
                          style: TextStyle(fontStyle: FontStyle.italic),
                          children: [
                            TextSpan(text: 'LO'),
                            TextSpan(
                              text: 'WO',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                        TextSpan(
                          text: 'RLD',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('ElevatedButton click....');
                    },
                    child: Text('Click Me'),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
