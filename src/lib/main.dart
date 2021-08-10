import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/screens/home_screen.dart';
import 'package:todo/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig().init(constraints);
        return ChangeNotifierProvider<TaskData>(
          create: (context) => TaskData(),
          child: MaterialApp(
            title: 'ToDoApp',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              backgroundColor: Colors.white,
              primaryColor: Colors.purple,
            ),
            home: HomePage(),
          ),
        );
      },
    );
  }
}
