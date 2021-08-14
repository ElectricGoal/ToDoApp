import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/size_config.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _textController = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: SizeConfig.heightMultiplier * 60,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          Text(
            'New task',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.textMultiplier * 3,
            ),
          ),
          TextField(
            controller: _textController,
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter your task',
              errorText: _validate ? 'Value cannot be empty' : null,
            ),
            // onChanged: (newValue) {
            //   newTaskText = newValue;
            // },
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              setState(() {
                _textController.text.isEmpty
                    ? _validate = true
                    : _validate = false;
              });
              if (_validate == false){
                context.read<TaskData>().addTask(_textController.text);
                Navigator.pop(context);
              }
            },
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.textMultiplier * 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
