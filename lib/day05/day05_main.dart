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
          title: Text('20195238 장정명'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? userId;
  String? password;
  String? confirmPassword;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '회원가입',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.grey,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(labelText: '이름'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return '이름을 입력해주세요';
              }
              return null;
            },
            onSaved: (value) {
              name = value;
            },
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: '아이디'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return '아이디를 입력해주세요';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    userId = value;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // 중복 확인 로직 추가
                },
                child: Text('중복확인'),
              ),
            ],
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: '암호',
              hintText: '영어 대/소문자, 숫자 조합 8글자 이상',
            ),
            obscureText: true,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return '암호를 입력해주세요';
              }
              if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$') // 이메일 주소 유효성 검사 abc@abc.com 형식 검사
                  .hasMatch(value!)) {
                return '영어 대/소문자, 숫자 조합 8글자 이상이어야 합니다';
              }
              return null;
            },
            onSaved: (value) {
              password = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: '암호확인'),
            obscureText: true,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return '암호를 다시 입력해주세요';
              }
              if (value != password) {
                return '암호가 일치하지 않습니다';
              }
              return null;
            },
            onSaved: (value) {
              confirmPassword = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: '이메일'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return '이메일을 입력해주세요';
              }
              if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value!)) {
                return '유효한 이메일 주소를 입력해주세요';
              }
              return null;
            },
            onSaved: (value) {
              email = value;
            },
          ),
          SizedBox(height: 20),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.grey,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                print('이름: $name, 아이디: $userId, 암호: $password, 이메일: $email');
              }
            },
            child: Text('확인'),
          ),
        ],
      ),
    );
  }
}
