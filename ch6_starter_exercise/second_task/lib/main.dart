import 'package:flutter/material.dart';

void main() {
  runApp(const TaskTrackerApp());
}

class TaskTrackerApp extends StatelessWidget {
  const TaskTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TaskTrackerHome(title: 'Task Tracker'),
    );
  }
}

class Task {
  Task({required this.title, this.isCompleted = false});
  final String title;
  bool isCompleted;
}

class TaskTrackerHome extends StatefulWidget {
  const TaskTrackerHome({super.key, required this.title});
  final String title;

  @override
  State<TaskTrackerHome> createState() => _TaskTrackerHomeState();
}

class _TaskTrackerHomeState extends State<TaskTrackerHome> {
  final List<Task> _tasks = [
    Task(title: 'chapter4'),
    Task(title: 'chapter5'),
    Task(title: 'Plan team meeting'),
  ];

  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add(Task(title: _taskController.text));
      });
      _taskController.clear();
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _taskController,
                decoration: InputDecoration(
                  labelText: 'New Task',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addTask,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    final task = _tasks[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: task.isCompleted,
                          onChanged: (value) => _toggleTaskCompletion(index),
                        ),
                        title: Text(
                          task.title,
                          style: TextStyle(
                            decoration: task.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: task.isCompleted
                                ? Colors.grey
                                : Colors.black,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeTask(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
