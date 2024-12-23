
import 'package:flutter/material.dart';
import 'add_task_page.dart';

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Map<String, dynamic>> tasks = [];

  void addTask(String name, String description) {
    setState(() {
      tasks.add({
        'name': name,
        'description': description,
        'completed': false,
      });
    });
  }

  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: tasks.isEmpty
          ? Center(child: Text('No tasks added yet!'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    tasks[index]['name'],
                    style: TextStyle(
                      decoration: tasks[index]['completed']
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(tasks[index]['description']),
                  leading: Checkbox(
                    value: tasks[index]['completed'],
                    onChanged: (value) {
                      toggleTaskCompletion(index);
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      deleteTask(index);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskPage(),
            ),
          );
          if (newTask != null) {
            addTask(newTask['name'], newTask['description']);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
