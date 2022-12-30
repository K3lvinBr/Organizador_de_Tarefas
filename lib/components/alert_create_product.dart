import 'package:flutter/material.dart';

class AlertCreate extends StatefulWidget {
  const AlertCreate({Key? key}) : super(key: key);

  @override
  State<AlertCreate> createState() => _AlertCreateState();
}

class _AlertCreateState extends State<AlertCreate> {
  final controllerImage = TextEditingController();
  final controllerName = TextEditingController();
  final controllerDifficult = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Criar nova tarefa'),
      content: SizedBox(
        height: 230,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: controllerImage,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Url da Imagem',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: controllerName,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: controllerDifficult,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Dificuldade (1 - 5)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Voltar",
              style: TextStyle(fontSize: 20),
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Criar",
              style: TextStyle(fontSize: 20),
            )),
      ],
    );
  }
}
