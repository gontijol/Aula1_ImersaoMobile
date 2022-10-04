import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _pressed = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _restartCounter() {
    setState(() {
      _counter = 0;
      _pressed = !_pressed;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedContainer(
        curve: Curves.bounceInOut,
        duration: const Duration(seconds: 4),
        color: _pressed ? Colors.grey : Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Voce pressionou o botao:',
              ),
              Text(
                _counter.toString(),
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                _counter == 1
                    ? 'vez'
                    : _counter == 0
                        ? ''
                        : 'vezes',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: _restartCounter,
            tooltip: 'Reload',
            child: const Icon(Icons.replay_rounded),
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          TextButton(
            onPressed: _restartCounter,
            child: const Text(
              "Restart",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
