import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro();

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  TextEditingController minutos = TextEditingController();
  int _segundos = 0;
  int _minutos = 1;
  Timer _timer = Timer(Duration(milliseconds: 1), () {});

  var f = NumberFormat("00");

  void _pausar() {
    _timer.cancel();
  }

  void _startTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
    if (_minutos > 60) {
      _minutos = _segundos * 60;
    }
    if (_segundos > 60) {
      _minutos = (_segundos / 60).floor();
      _segundos = _segundos - (_minutos + 60);
    }
    if (_minutos == 0 && _segundos == 0) {
      _minutos = 25;
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_segundos > 0) {
          _segundos--;
        } else if (_minutos > 0) {
          _segundos = 59;
          _minutos--;
        } else {
          _timer.cancel();
          print("finalizou");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(),
    );
  }

  buildBody() {
    return Column(children: [
      SizedBox(height: 100),
      Center(
        child: Text(
          'Pomodoro',
          style: TextStyle(fontSize: 40, color: Colors.pink),
        ),
      ),
      SizedBox(
        height: 60,
      ),
      Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextButton(
          onPressed: () {
            showModal();
          },
          child: Text("${f.format(_minutos)}",
              style: const TextStyle(fontSize: 80, color: Colors.pink)),
        ),
        TextButton(
            onPressed: () {},
            child: Text(": ${f.format(_segundos)}",
                style: const TextStyle(fontSize: 80, color: Colors.pink)))
        // Text(
        //   "${f.format(_minutos)}",
        //   style: const TextStyle(fontSize: 80, color: Colors.black),
        // ),
        // Text(" : ${f.format(_segundos)}",
        //     style: const TextStyle(fontSize: 80, color: Colors.black))
      ])),
      SizedBox(
        height: 60,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FloatingActionButton.extended(
          onPressed: () {
            _startTimer();
          },
          icon: Icon(Icons.timer),
          label: Text('Iniciar'),
          backgroundColor: Colors.pink,
        ),
        SizedBox(
          width: 40,
        ),
        TextButton(
          onPressed: () {
            _pausar();
          },
          child: Text(
            'Pausar',
            style: TextStyle(color: Colors.pink, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 30,
        )
      ])
    ]);
  }

  showModal() async {
    return await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      controller: minutos,
                      decoration: const InputDecoration(labelText: 'Minutos'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: const Text('Alterar'),
                      onPressed: () {
                        _minutos = int.parse(minutos.text);
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                    )
                  ]));
        });
  }
}
