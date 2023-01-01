import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/components/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _taskList = [
    Task('Aprender Flutter', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTSrIOorMvDgYd5VunTWbiKuQBz14S417OhQ&usqp=CAU', 3),
    Task('Aprender Beber água', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKygOAHqRCQfNzA7XfRmFQehUWpeF3Lfd3Uw&usqp=CAU', 1),
    Task('Correr', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrobIPJAQLtv4DboaXIfHHShyP17F2T5ueMQ&usqp=CAU', 5),
  ];

  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);

  void newTask(String name, String photo, int difficulty) {
    _taskList.add(Task(name, photo, difficulty));
    notifyListeners();
  }
}
