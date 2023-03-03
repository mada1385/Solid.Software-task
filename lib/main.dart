import 'package:flutter/material.dart';
import 'package:testapp/UI/Screens/my_Home_page.dart';

void main() {
  runApp(const MyApp());
}

///this widget is the root of the app
class MyApp extends StatelessWidget {
  ///
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
