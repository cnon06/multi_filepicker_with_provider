import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modeloffilepicker.dart';
import 'myhomepage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ModelOfFilePicker>(
          create: (context) => ModelOfFilePicker(), child:  MyHomePage()),//MyHomePage(),
    );
  }
}

