import 'package:flutter/material.dart';

class AddTaskPage  extends StatelessWidget{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body : Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Task Name'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Task Description'),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                final task ={
                  'name': nameController.text,
                  'description': descriptionController.text,
                };
                Navigator.pop(context, task);
              },
              child: Text('Add Task'),
            ),
          ],
        )
      ),
    );
  }
}