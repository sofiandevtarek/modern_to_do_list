import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/pages/home_page.dart';

void main() {
  runApp(DevicePreview(
    builder: (c) => const ToDoList()
  ));
}

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      home: HomePage(),
    );
  }
}
