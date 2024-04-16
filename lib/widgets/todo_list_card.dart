import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widgets/todo_item.dart';

import '../models/todo_model.dart';

class TodoListCard extends StatefulWidget {
  final List<TodoModel> todos;
  final Function() onClear;
  const TodoListCard({super.key, required this.todos, required this.onClear});

  @override
  State<TodoListCard> createState() => _TodoListCardState();
}

class _TodoListCardState extends State<TodoListCard> {
  late final List<TodoModel> _todos = widget.todos;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0x0ff1ece6)),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return TodoItem(todo: _todos.elementAt(index), onRemove: (TodoModel todoModel) {
                    setState(() {
                      _todos.remove(todoModel);
                    });
                  }, onCheckDone: (isCheckDone) {
                    setState(() {
                      _todos.elementAt(index).status = isCheckDone ? TodoStatus.done : TodoStatus.todo;
                    });
                  },);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                itemCount: _todos.length),
          ),
          ElevatedButton.icon(
              onPressed: widget.onClear,
              icon: Icon(Icons.clear),
              label: Text("Clear completed"))
        ],
      ),
    );
  }
}
