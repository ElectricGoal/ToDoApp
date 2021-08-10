import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/size_config.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTaskText = '';
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
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newValue) {
              newTaskText = newValue;
            },
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              print(newTaskText);
              //Provider.of<TaskData>(context, listen: true).addTask(newTaskText);
              context.read<TaskData>().addTask(newTaskText);
              Navigator.pop(context);
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
