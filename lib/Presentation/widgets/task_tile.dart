import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Presentation/pages/edit_task_page.dart';
import 'package:todo_app/Presentation/widgets/popup_menu_button.dart';
import 'package:todo_app/data/model/task_model.dart';

import '../../business_logic/blocs/bloc_exports.dart';

class CustomTaskTile extends StatelessWidget {
  CustomTaskTile({Key? key, required this.task}) : super(key: key);
  var task;

  void removeorDeleteTask(BuildContext context, TaskModel taskModel) {
    taskModel.isdelete!
        ? context.read<TaskBloc>().add(DeleteTaskEvent(taskModel: taskModel))
        : context.read<TaskBloc>().add(RemoveTaskEvent(taskModel: taskModel));
  }

  void editTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: EditTaskBottomPage(
              oldTask: task,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: task.isdone == false
              ? Icon(
                  Icons.star_outline,
                )
              : Icon(Icons.star),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          decoration: task.isdone!
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    //date
                    Text(DateFormat()
                        .add_yMMMEd()
                        .add_Hms()
                        .format(DateTime.parse(task.date))),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(
              onChanged: (value) {
                context.read<TaskBloc>().add(updateTaskEvent(taskModel: task));
              },
              value: task.isdone,
            ),
            cusotmPopUpMenuButton(
      
                restorebtn: () => context
                    .read<TaskBloc>()
                    .add(RestoreTaskEvent(taskModel: task)),
                editbtn: () => editTask(context),
                delete: () => removeorDeleteTask(
                      context,
                      task,
                    ),
                task: task,
                favbtn: () => context
                    .read<TaskBloc>()
                    .add(FavTaskEvent(taskModel: task))),
          ],
        ),
      ],
    );
  }
}
