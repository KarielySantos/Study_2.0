import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/menu.dart';
import 'package:flutter_application_1/pages/pomodoro.dart';
import 'package:flutter_application_1/pages/todolist.page.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> paginas = [
    MenuPage(),
    const Pomodoro(),
    TodoListPage()
  ];
  void _aoPressionar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: paginas.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Pomodoro'),
            BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Lista')
          ],
          selectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _aoPressionar),
    );
  }
}
