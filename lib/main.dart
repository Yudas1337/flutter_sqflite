import 'package:flutter/material.dart';
import 'package:flutter_sqlite/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Item - Yudas | 2041720054',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Home(),
    );
  }
}
