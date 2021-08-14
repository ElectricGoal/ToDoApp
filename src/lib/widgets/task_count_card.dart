import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/size_config.dart';

class TaskCountCard extends StatelessWidget {
  const TaskCountCard({
    Key? key,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    String countTask(int count) {
    if (count == 0) {
      return 'No task to do';
    }
    return count.toString() + ' tasks';
  }
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: SizeConfig.heightMultiplier * 15,
      width: SizeConfig.screenWidth,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            countTask(context.watch<TaskData>().tasks.length),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.textMultiplier * 2,
            ),
          ),
          Icon(
            Icons.sticky_note_2,
            color: Colors.white,
            size: SizeConfig.textMultiplier * 10,
          ),
        ],
      ),
    );
  }
}
