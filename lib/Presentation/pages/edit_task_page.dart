// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:todo_app/data/model/task_model.dart';
import 'package:todo_app/data/services/id_generator.dart';

import '../../business_logic/blocs/bloc_exports.dart';

class EditTaskBottomPage extends StatelessWidget {
  static const routeName = 'edit-task-bottom-page';

  EditTaskBottomPage({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  final TaskModel oldTask;
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController desController =
        TextEditingController(text: oldTask.des);

    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Edit Task',
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
                    var editedtask = TaskModel(
                        date: DateTime.now().toString(),
                        title: titleController.text,
                        des: desController.text,
                        isdone: false,
                        isfav: oldTask.isfav,
                        id: oldTask.id);
                    context.read<TaskBloc>().add(EditTaskEvent(
                        oldTaskModel: oldTask,
                        newTaskModel: editedtask));
                    Navigator.pop(context);
                  },
                  child: Text('Save')),
            ],
          ),
        ],
      ),
    );
  }
}
