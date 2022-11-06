import 'package:flutter/material.dart';
import 'package:todo_app/Presentation/widgets/task_tile.dart';
import 'package:todo_app/business_logic/blocs/bloc_exports.dart';
import 'package:todo_app/data/model/task_model.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<TaskModel> tasksList;

  void _removeorDeleteTask(BuildContext context, TaskModel taskModel) {
    taskModel.isdelete!
        ? context.read<TaskBloc>().add(DeleteTaskEvent(taskModel: taskModel))
        : context.read<TaskBloc>().add(RemoveTaskEvent(taskModel: taskModel));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ExpansionPanelList.radio(
              children: tasksList
                  .map(
                    (task) => ExpansionPanelRadio(
                      value: task.id,
                      headerBuilder: (context, isOpned) =>
                          CustomTaskTile(task: task),
                      body: ListTile(
                        title: SelectableText.rich(
                          TextSpan(children: [
                            const TextSpan(
                                text: 'Title \n \n \t',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: task.title),
                            const TextSpan(
                                text: '\n \n Description \n \n \t',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: task.des),
                          ]),
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
