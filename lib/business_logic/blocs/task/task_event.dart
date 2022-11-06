// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types
part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  const AddTaskEvent({
    required this.taskModel,
  });
  @override
  List<Object> get props => [taskModel];
}

class updateTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  const updateTaskEvent({
    required this.taskModel,
  });
  @override
  List<Object> get props => [taskModel];
}

class DeleteTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  const DeleteTaskEvent({
    required this.taskModel,
  });
  @override
  List<Object> get props => [taskModel];
}

class RemoveTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  const RemoveTaskEvent({
    required this.taskModel,
  });
  @override
  List<Object> get props => [taskModel];
}
class RestoreTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  const RestoreTaskEvent({
    required this.taskModel,
  });
  @override
  List<Object> get props => [taskModel];
}

class FavTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  const FavTaskEvent({
    required this.taskModel,
  });
  @override
  List<Object> get props => [taskModel];
}

class EditTaskEvent extends TaskEvent {
  final TaskModel oldTaskModel;
  final TaskModel newTaskModel;
  const EditTaskEvent({
    required this.oldTaskModel,
    required this.newTaskModel,
  });
  @override
  List<Object> get props => [oldTaskModel, newTaskModel];
}
class DeleteAllTaskEvent extends TaskEvent{
  
}