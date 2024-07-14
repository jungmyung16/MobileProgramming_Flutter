import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class User{
  String name;
  String phone;
  String email;
  User(this.name, this.phone, this.email);
}

class MyApp extends StatelessWidget {
  List<User> users = [
    User('홍길동', '0100001', 'a@a.com'), User('김길동', '0100001', 'b@b.com'),
    User('이길동', '0100001', 'c@c.com'), User('박길동', '0100001', 'd@d.com'),
    User('최길동', '0100001', 'e@e.com'), User('강길동', '0100001', 'f@f.com'),
    User('송길동', '0100001', 'g@g.com'), User('한길동', '0100001', 'h@h.com'),
  ];

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
            title: Text('ListView'),
          ),
          body: ListView.separated(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('images/big.jpeg'),
                ),
                title: Text(users[index].name),
                subtitle: Text(users[index].phone),
                trailing: Icon(Icons.more_vert),
                onTap: () {
                  print(users[index].name);
                },
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: 2, color: Colors.black,);
            },
          )
      ),
    );
  }
}

