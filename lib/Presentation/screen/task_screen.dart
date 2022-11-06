// // ignore_for_file: prefer_const_constructors, sort_child_properties_last

// import 'package:flutter/material.dart';
// import 'package:todo_app/Presentation/widgets/task_list.dart';
// import 'package:todo_app/data/model/task_model.dart';

// import '../../business_logic/blocs/bloc_exports.dart';

// class TaskScreen extends StatelessWidget {
//   static const routeName = 'task-screen';
//   TaskScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TaskBloc, TaskInitialState>(
//       builder: (context, state) {å
//         List<TaskModel> tasksList = state.pendingTask;
//         return SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: Chip(
//                   label: Text('${state.pendingTask.length}  Tasks  '),
//                 ),
//               ),
//               TasksList(tasksList: tasksList)
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
