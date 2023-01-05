import 'package:app_orientation/ui/master_detail_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MasterDetailScreen()
    );
  }
}

