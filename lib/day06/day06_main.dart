import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: MyApp(),
      )
    )
  );
}

class User {
  String name;
  String phone;
  String email;
  User(this.name, this.phone, this.email);
}

class MyApp extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController controller;

  List<User> users = [
    User('홍길동', '0100001', 'a@a.com'), User('김길동', '0100001', 'b@b.com'),
    User('이길동', '0100001', 'c@c.com'), User('박길동', '0100001', 'd@d.com'),
    User('최길동', '0100001', 'e@e.com'), User('강길동', '0100001', 'f@f.com'),
    User('송길동', '0100001', 'g@g.com'), User('한길동', '0100001', 'h@h.com'),
  ];

  List<String> cities = ['서울시', '인천시', '부산시', '대구시', '대전시', '광주시', '울산시', '춘천시'];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
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
          bottom: TabBar(
            controller: controller,
            tabs: [
              Tab(text: 'One'),
              Tab(text: 'Two'),
              Tab(text: 'Three'),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            // One Tab: ListView
            ListView.separated(
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
                return Divider(height: 2, color: Colors.black);
              },
            ),
            // Two Tab: GridView
            GridView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [Text(cities[index]), Image.asset('images/big.jpeg')],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            ),
            // Three Tab: Dialog
            TestScreen(),
          ],
        ),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  TestState createState() => TestState();
}

class TestState extends State<TestScreen> {
  DateTime dateValue = DateTime.now();
  TimeOfDay timeValue = TimeOfDay.now();

  _dialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dialog Title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(decoration: InputDecoration(border: OutlineInputBorder())),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text('수신동의'),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  _bottomSheet() {
    showBottomSheet(
      context: context,
      backgroundColor: Colors.yellow,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.add),
              title: Text('ADD'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.remove),
              title: Text('REMOVE'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _modalBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.yellow,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.add),
                title: Text('ADD'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.remove),
                title: Text('REMOVE'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future datePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2016),
      lastDate: DateTime(2030),
    );
    if (picked != null) setState(() => dateValue = picked);
  }

  Future timePicker() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) setState(() => timeValue = selectedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _dialog,
            child: Text('dialog'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
          ElevatedButton(
            onPressed: _bottomSheet,
            child: Text('bottomSheet'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
          ElevatedButton(
            onPressed: _modalBottomSheet,
            child: Text('modal bottom sheet'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
          ElevatedButton(
            onPressed: datePicker,
            child: Text('date picker'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
          ElevatedButton(
            onPressed: timePicker,
            child: Text('time picker'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
          Text('time: ${timeValue.hour}:${timeValue.minute}'),
        ],
      ),
    );
  }
}
