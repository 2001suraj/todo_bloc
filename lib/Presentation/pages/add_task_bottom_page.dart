// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/data/model/task_model.dart';
import 'package:todo_app/data/services/id_generator.dart';

import '../../business_logic/blocs/bloc_exports.dart';

class AddTaskBottomPage extends StatefulWidget {
  static const routeName = 'add-task-bottom-page';

  AddTaskBottomPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskBottomPage> createState() => _AddTaskBottomPageState();
}

class _AddTaskBottomPageState extends State<AddTaskBottomPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController desController = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Add Task',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              autofocus: true,
              controller: titleController,
              decoration: InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              autofocus: true,
              minLines: 3,
              maxLines: 5,
              controller: desController,
              decoration: InputDecoration(
                label: Text('Description'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    var task = TaskModel(
                      date: DateTime.now().toString(),
                        title: titleController.text,
                        des: desController.text,
                        id: GUIDGen.generate());
                    context.read<TaskBloc>().add(AddTaskEvent(taskModel: task));
                    Navigator.pop(context);
                  },
                  child: Text('Add')),
            ],
          ),
        ],
      ),
    );
  }
}
