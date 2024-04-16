import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo_model.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todo;
  final Function(TodoModel todoModel) onRemove;
  final Function(bool isDone) onCheckDone;

  const TodoItem(
      {super.key,
      required this.todo,
      required this.onRemove,
      required this.onCheckDone});

  @override
  Widget build(BuildContext context) {
    final bool isDone = todo.status == TodoStatus.done;
    return ListTile(
      leading: IconButton(
        icon: Icon(isDone
            ? Icons.check_box
            : Icons.check_box_outline_blank),
        onPressed: () {
          onCheckDone.call(todo.status != TodoStatus.done);
        },
      ),
      title: Text(
        todo.content,
        style: TextStyle(decoration: isDone ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text(todo.dateTime.toIso8601String()),
      trailing: IconButton(
        icon: const Icon(Icons.restore_from_trash),
        onPressed: () {
          onRemove.call(todo);
        },
      ),
    );
  }
}
