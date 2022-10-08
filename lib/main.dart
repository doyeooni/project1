import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '앱바 글자 바꾸기'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _str = "터치 전입니다";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("첫번째 플루터 프로젝트"),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home),
                title:Text("홈"),
                trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    print("홈 클릭");
                  },
            ),
            ListTile(
              leading: Icon(Icons.home),
                title: Text("홈"),
                trailing: Icon(Icons.navigate_next),
                  onTap: (){
                    print("홈 클릭");
                  },
            ),
            ListTile(
              leading: Icon(Icons.event, size: 32.0),
                title:Text("이벤트"),
                subtitle: Text("이벤트 내용 입력"),
                trailing: Icon(Icons.navigate_next),
                onTap: (){
                  print("이벤트");
                },
            )
          ],
        )
    );
  }
}
