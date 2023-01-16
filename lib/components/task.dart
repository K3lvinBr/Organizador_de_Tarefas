import 'package:flutter/material.dart';

import '../data/task_dao.dart';
import 'difficulty.dart';

// ignore: must_be_immutable
class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  int nivel;
  int novoNivel;

  Task(this.nome, this.foto, this.dificuldade, this.nivel, this.novoNivel,
      {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetsOrNetwok() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  changeColor(nivel) {
    switch (nivel) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.green;
      case 2:
        return Colors.yellow;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: changeColor(widget.novoNivel)),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: assetsOrNetwok()
                              ? const Icon(Icons.no_photography_outlined)
                              : Image.network(
                                  widget.foto,
                                  fit: BoxFit.cover,
                                )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Difficulty(dificultyLevel: widget.dificuldade)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Row(
                                        children: const [
                                          Text('Deletar'),
                                          Icon(Icons.delete)
                                        ],
                                      ),
                                      content: const Text(
                                          'Tem certeza que deseja deletar essa Tarefa?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Não')),
                                        TextButton(
                                            onPressed: () {
                                              TaskDao().delete(widget.nome);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Sim'))
                                      ],
                                    );
                                  });
                            },
                            onPressed: () {
                              setState(() {
                                widget.nivel++;
                                if (widget.nivel / widget.dificuldade / 10 >
                                        1 &&
                                    widget.novoNivel < 3) {
                                  widget.nivel = 1;
                                  widget.novoNivel++;
                                }
                              });
                              TaskDao().save(Task(
                                  widget.nome,
                                  widget.foto,
                                  widget.dificuldade,
                                  widget.nivel,
                                  widget.novoNivel));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  'UP',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificuldade > 0)
                            ? (widget.nivel / widget.dificuldade / 10)
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nível: ${widget.nivel}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
