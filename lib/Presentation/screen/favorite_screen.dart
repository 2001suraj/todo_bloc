import 'package:flutter/material.dart';
import 'package:todo_app/Presentation/pages/add_task_bottom_page.dart';
import 'package:todo_app/Presentation/widgets/task_list.dart';
import 'package:todo_app/data/model/task_model.dart';

import '../../business_logic/blocs/bloc_exports.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routename = 'tabs-screen';
  const FavoriteScreen({Key? key}) : super(key: key);

  void addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskBottomPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskBloc, TaskInitialState>(
        builder: (context, state) {
          List<TaskModel> tasksList = state.favoriteTask;
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Chip(
                    label: Text('${tasksList.length}  favorite tasks  '),
                  ),
                ),
                TasksList(tasksList: tasksList)
              ],
            ),
          );
        },
      ),
    );
  }
}
