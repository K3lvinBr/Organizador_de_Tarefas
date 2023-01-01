import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/data/task_provider.dart';
import 'package:primeiro_projeto_flutter/screens/form_screen.dart';
import 'package:provider/provider.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(' Tarefas'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  opacidade = !opacidade;
                });
              },
              icon: const Icon(Icons.remove_red_eye))
        ],
      ),
      body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: const Duration(milliseconds: 1000),
          child: ListView(
              padding: const EdgeInsets.only(top: 8, bottom: 70),
              children: Provider.of<TaskProvider>(context).taskList)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreen(
                        taskContext: context,
                      )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
