import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 애셋 이용을 위한 rootBundle 제공


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
            title: Text('asset_test'),
          ),
          body: Column(


              children: [
                Image.asset('images/icon.jpg'),
                Image.asset('images/icon/user.png'),
                // FutureBuilder는 비동기 데이터를 이용해 화면을 구성하는 위젯
                FutureBuilder(
                    future: useRootBundle(),
                    builder: (context, snapshot) {
                      return Text('rootBundle: ${snapshot.data}');
                    }
                ),
                FutureBuilder(
                    future: useDefaultAssetBundle(context),
                    builder: (context, snapshot) {
                      return Text('DefaultAssetBundle: ${snapshot.data}');
                    }
                )
              ]
          )
      ),
    );
  }
}
