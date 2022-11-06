// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'task_bloc.dart';

class TaskInitialState extends Equatable {
  final List<TaskModel> pendingTask;
  final List<TaskModel> completeTask;
  final List<TaskModel> favoriteTask;
  final List<TaskModel> removedTask;

  const TaskInitialState({
    this.pendingTask = const <TaskModel>[],
    this.completeTask = const <TaskModel>[],
    this.favoriteTask = const <TaskModel>[],
    this.removedTask = const <TaskModel>[],
  });

  @override
  List<Object?> get props => [pendingTask, completeTask, favoriteTask,removedTask];

 

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTask': pendingTask.map((x) => x.toMap()).toList(),
      'completeTask': completeTask.map((x) => x.toMap()).toList(),
      'favoriteTask': favoriteTask.map((x) => x.toMap()).toList(),
      'removedTask': removedTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskInitialState.fromMap(Map<String, dynamic> map) {
    return TaskInitialState(
      pendingTask: List<TaskModel>.from((map['pendingTask'] as List<int>).map<TaskModel>((x) => TaskModel.fromMap(x as Map<String,dynamic>),),),
      completeTask: List<TaskModel>.from((map['completeTask'] as List<int>).map<TaskModel>((x) => TaskModel.fromMap(x as Map<String,dynamic>),),),
      favoriteTask: List<TaskModel>.from((map['favoriteTask'] as List<int>).map<TaskModel>((x) => TaskModel.fromMap(x as Map<String,dynamic>),),),
      removedTask: List<TaskModel>.from((map['removedTask'] as List<int>).map<TaskModel>((x) => TaskModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

}
