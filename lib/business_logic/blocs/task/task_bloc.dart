import 'package:equatable/equatable.dart';
import 'package:todo_app/data/model/task_model.dart';

import '../bloc_exports.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskInitialState>  {
  TaskBloc() : super(TaskInitialState()) {
    on<AddTaskEvent>(_onAddTask);
    on<updateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<RemoveTaskEvent>(_onRemoveTask);
    on<FavTaskEvent>(_onFavTask);
    on<EditTaskEvent>(_onEditTask);
    on<RestoreTaskEvent>(_onRestoreTask);
    on<DeleteAllTaskEvent>(_onDeleteAllTask);
  }

  void _onAddTask(event, emit) {
    final state = this.state;
    emit(TaskInitialState(
        pendingTask: List.from(state.pendingTask)..add(event.taskModel),
        removedTask: state.removedTask,
        completeTask: state.completeTask,
        favoriteTask: state.favoriteTask));
  }

  void _onUpdateTask(updateTaskEvent event, emit) {
    final state = this.state;
    final taskModel = event.taskModel;
    List<TaskModel> pendingTasks = state.pendingTask;
    List<TaskModel> completeTask = state.completeTask;
    taskModel.isdone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(taskModel),
            completeTask = List.from(completeTask)
              ..insert(0, taskModel.copyWith(isdone: true))
          }
        : {
            completeTask = List.from(completeTask)..remove(taskModel),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, taskModel.copyWith(isdone: false)),
          };

    emit(TaskInitialState(
        pendingTask: pendingTasks,
        removedTask: state.removedTask,
        favoriteTask: state.favoriteTask,
        completeTask: completeTask));
  }

  void _onDeleteTask(DeleteTaskEvent event, emit) {
    final state = this.state;

    emit(TaskInitialState(
        pendingTask: state.pendingTask,
        completeTask: state.completeTask,
        favoriteTask: state.favoriteTask,
        removedTask: List.from(state.removedTask)..remove(event.taskModel)));
  }

  void _onRemoveTask(RemoveTaskEvent event, emit) {
    final state = this.state;

    emit(TaskInitialState(
        pendingTask: List.from(state.pendingTask)..remove(event.taskModel),
        completeTask: List.from(state.completeTask)..remove(event.taskModel),
        favoriteTask: List.from(state.favoriteTask)..remove(event.taskModel),
        removedTask: List.from(state.removedTask)
          ..add(event.taskModel.copyWith(isdelete: true))));
  }

  void _onFavTask(FavTaskEvent event, emit) {
    final state = this.state;
    final taskModel = event.taskModel;
    List<TaskModel> pendingTask = state.pendingTask;
    List<TaskModel> completeTask = state.completeTask;
    List<TaskModel> favoriteTask = state.favoriteTask;

    if (taskModel.isdone == false) {
      if (taskModel.isfav == false) {
        var taskIndex = pendingTask.indexOf(taskModel);

        pendingTask = List.from(pendingTask)
          ..remove(taskModel)
          ..insert(taskIndex, taskModel.copyWith(isfav: true));
        favoriteTask = List.from(favoriteTask)
          ..insert(0, taskModel.copyWith(isfav: true));
      } else {
        var taskindex = pendingTask.indexOf(taskModel);
        pendingTask = List.from(pendingTask)
          ..remove(taskModel)
          ..insert(taskindex, taskModel.copyWith(isfav: false));
        favoriteTask = List.from(favoriteTask)..remove(taskModel);
      }
    } else {
      if (taskModel.isfav == false) {
        var taskIndex = completeTask.indexOf(taskModel);

        completeTask = List.from(completeTask)
          ..remove(taskModel)
          ..insert(taskIndex, taskModel.copyWith(isfav: true));
        favoriteTask = List.from(favoriteTask)
          ..insert(0, taskModel.copyWith(isfav: true));
      } else {
        var taskindex = completeTask.indexOf(taskModel);
        completeTask = List.from(completeTask)
          ..remove(taskModel)
          ..insert(taskindex, taskModel.copyWith(isfav: false));
        favoriteTask = List.from(favoriteTask)..remove(taskModel);
      }
    }

    emit(TaskInitialState(
        pendingTask: pendingTask,
        completeTask: completeTask,
        favoriteTask: favoriteTask,
        removedTask: state.removedTask));
  }

  void _onEditTask(EditTaskEvent event, emit) {
    final state = this.state;
    List<TaskModel> favoriteTask = state.favoriteTask;
    if (event.oldTaskModel.isfav == true) {
      favoriteTask
        ..remove(event.oldTaskModel)
        ..insert(0, event.newTaskModel);
    }
    emit(TaskInitialState(
        pendingTask: List.from(state.pendingTask)
          ..remove(event.oldTaskModel)
          ..insert(0, event.newTaskModel),
        completeTask: state.completeTask..remove(event.oldTaskModel),
        favoriteTask: favoriteTask,
        removedTask: state.removedTask));
  }

  void _onRestoreTask(RestoreTaskEvent event, emit) {
    final state = this.state;
    emit(TaskInitialState(
        removedTask: List.from(state.removedTask)..remove(event.taskModel),
        pendingTask: List.from(state.pendingTask)
          ..insert(
              0,
              event.taskModel
                  .copyWith(isdelete: false, isdone: false, isfav: false)),
        completeTask: state.completeTask,
        favoriteTask: state.favoriteTask));
  }

  void _onDeleteAllTask(DeleteAllTaskEvent event, emit) {
    final state = this.state;

    emit(TaskInitialState(
        removedTask: List.from(state.removedTask)..clear(),
        pendingTask: state.pendingTask,
        completeTask: state.completeTask,
        favoriteTask: state.favoriteTask));
  }

  @override
  TaskInitialState? fromJson(Map<String, dynamic> json) {
    return TaskInitialState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskInitialState state) {
    return state.toMap();
  }
}
