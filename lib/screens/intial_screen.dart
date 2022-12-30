import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/components/alert_create_product.dart';
import 'package:primeiro_projeto_flutter/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  List<Map<String, dynamic>> tarefas = [
    {
      'nome': 'Aprender Flutter',
      'foto': 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      'dificuldade': 1
    },
    {
      'nome': 'Caminhar',
      'foto': 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      'dificuldade': 3
    },
    {
      'nome': 'Trabalhar',
      'foto': 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      'dificuldade': 5
    },
  ];

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
        child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: tarefas.length,
            itemBuilder: (context, index) {
              return Task(
                  tarefas[index]['nome'],
                  tarefas[index]['foto'],
                  tarefas[index]['dificuldade']);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertCreate();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}