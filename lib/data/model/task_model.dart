// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final String des;
  final String id;
  final String date;
  bool? isdone;
  bool? isdelete;
  bool? isfav;
  TaskModel({
    required this.title,
    required this.id,
    required this.des,
    required this.date,
    this.isdone,
    this.isfav,
    this.isdelete,
  }) {
    isdone = isdone ?? false;
    isdelete = isdelete ?? false;
    isfav = isfav ?? false;
  }

  TaskModel copyWith({
    String? title,
    String? id,
  String? des,
  String? date,
    bool? isdone,
    bool? isfav,
    bool? isdelete,
  }) {
    return TaskModel(
      title: title ?? this.title,
      des: des ?? this.des,
      date: date ?? this.date,

      id: id ?? this.id,
      isdone: isdone ?? this.isdone,
      isfav: isfav ?? this.isfav,
      isdelete: isdelete ?? this.isdelete,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'des': des,

      'id': id,
      'date': date,
      'isfav': isfav,

      'isdone': isdone,
      'isdelete': isdelete,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      des: map['des'] as String,
      id: map['id'] as String,
      date: map['date'] as String,

      isdone: map['isdone'] != null ? map['isdone'] as bool : null,
      isfav: map['isfav'] != null ? map['isfav'] as bool : null,
      isdelete: map['isdelete'] != null ? map['isdelete'] as bool : null,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, isdelete, isdone, id, des, date, isfav];
}
