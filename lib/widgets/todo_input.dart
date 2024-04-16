import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo_model.dart';

class TodoInput extends StatelessWidget {
  final Function(TodoModel todoModel) onAddTodo;
  const TodoInput({super.key, required this.onAddTodo});

  @override
  Widget build(BuildContext context) {
    String content = '';
    DateTime? dateTime;
    final formKey =  GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: TextFormField(
        key: UniqueKey(),
        onChanged: (text){
          content = text;
        },
        validator: (text){
          if(text?.isEmpty == true){
            return "This field is required!";
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "What do you need to do?",
          icon: IconButton(onPressed: () async {
            dateTime = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365 * 6)),
            initialDatePickerMode: DatePickerMode.day,
            builder: (context, child) {
              return Center(
                  child: SizedBox(
                    width: 500.0,
                    height: 500.0,
                    child: child,
                  ));
            });
          }, icon: const Icon(Icons.watch_later_outlined)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueAccent, width: 5.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          suffixIcon: Container(
            margin: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 50),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text("Add"),
              onPressed: () {
                if(formKey.currentState?.validate() == true){
                  onAddTodo.call(TodoModel(
                      id: UniqueKey().toString(),
                      content: content,
                      status: TodoStatus.todo,
                      dateTime: dateTime ?? DateTime.now()));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
