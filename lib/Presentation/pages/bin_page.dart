// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/Presentation/pages/drawer_page.dart';
import 'package:todo_app/Presentation/widgets/task_list.dart';

import '../../business_logic/blocs/bloc_exports.dart';

class BinPage extends StatelessWidget {
  static const routeName = 'bin-page';

  const BinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskInitialState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Recycle Bin'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: () =>
                          context.read<TaskBloc>().add(DeleteAllTaskEvent()),
                      icon: Icon(Icons.delete_forever),
                      label: Text('Delete all tasks'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          drawer: Drawerpage(),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Chip(
                    label: Text('${state.removedTask.length}  Tasks  '),
                  ),
                ),
                TasksList(tasksList: state.removedTask)
              ],
            ),
          ),
        );
      },
    );
  }
}
