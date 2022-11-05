import 'package:flutter/material.dart';

import 'alert.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class RouteArguments {
  final String title;
  final String content;

  RouteArguments(this.title, this.content);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '첫번째 플루터 프로젝트'),
      routes: {
        '/alert' : (context) => Alert()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  var val = true;
  final _valueList = ['첫 번째', '두 번째', '세 번째'];
  var _selectedValue = '첫 번째';

  _openPopup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("알림창 타이틀"),
            content: Text("알림창에 들어가는 내용입니다."),
            actions: [
              TextButton(
                child: Text('닫기'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              print("Home");
            },
          ),
          title: Text("첫번째 플루터 프로젝트"),
          actions: [
            IconButton(
              icon: Icon(Icons.login),
              onPressed: () async {
                print("로그인 버튼 클릭");
                var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => Login(txt: "test message")),);
                print("로그인 페이지에서 넘어온 값 : " + result.toString());
                print("로그인 페이지에서 넘어온 값 : ${result.toString()}");
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                print("알림 클릭");
                Navigator.pushNamed(context, '/alert', arguments: RouteArguments("데이터제목", "데이터 콘텐츠"));
              },
            ),
          ],
        ),
        body: TextButton(
          child: Text('팝업 띄우기'),
          onPressed: _openPopup,
        ));
  }
}
