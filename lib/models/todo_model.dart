import 'package:flutter/cupertino.dart';

enum TodoStatus{
  todo,
  inProgress,
  done,
}
class TodoModel{
  final String id;
  final String content;
  TodoStatus status;
  final DateTime dateTime;

  TodoModel({
    required this.id,
    required this.content,
    required this.status,
    required this.dateTime,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          content == other.content &&
          status == other.status &&
          dateTime == other.dateTime);

  @override
  int get hashCode =>
      id.hashCode ^ content.hashCode ^ status.hashCode ^ dateTime.hashCode;

  factory TodoModel.generate(int index){
    return TodoModel(
        id: UniqueKey().toString(),
        content: "Task $index",
        status: TodoStatus.todo,
        dateTime: DateTime.now());
  }
  @override
  String toString() {
    return 'TodoModel{' +
        ' id: $id,' +
        ' content: $content,' +
        ' status: $status,' +
        ' dateTime: $dateTime,' +
        '}';
  }

  TodoModel copyWith({
    String? id,
    String? content,
    TodoStatus? status,
    DateTime? dateTime,
  }) {
    return TodoModel(
      id: id ?? this.id,
      content: content ?? this.content,
      status: status ?? this.status,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'content': this.content,
      'status': this.status,
      'dateTime': this.dateTime,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] as String,
      content: map['content'] as String,
      status: map['status'] as TodoStatus,
      dateTime: map['dateTime'] as DateTime,
    );
  }

//</editor-fold>
}