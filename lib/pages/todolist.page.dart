import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  
  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textEditingController = TextEditingController();

  List<String> list = [
    'Trabalho de História',
    'Exercícios de Matemática',
    'Seminário de ENSO',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: ListView.separated(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(list[index]));
                },
                separatorBuilder: (context, index) => Divider(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_textEditingController.text.isNotEmpty) {
            setState(() {
              list.add(_textEditingController.text);
            });
            _textEditingController.clear();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}