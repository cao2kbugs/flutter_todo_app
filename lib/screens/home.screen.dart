import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo_model.dart';
import 'package:flutter_todo_app/widgets/todo_list_card.dart';

import '../widgets/todo_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Personal'),
    const Tab(text: 'Professional'),
  ];
  final todos = List.generate(1, (index) => TodoModel.generate(index));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          children: myTabs.map((Tab tab) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TodoInput(
                    onAddTodo: (todoModel) {
                      setState(() {
                        todos.add(todoModel);
                      });
                    },
                  ),
                  Expanded(
                    child: TodoListCard(
                      todos: todos,
                      onClear: () {
                        setState(() {
                          todos.clear();
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
