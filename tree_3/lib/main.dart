import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  bool change = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          change ? _buildWorld() : _buildFlutter(),
          GestureDetector(
            onTap: () {
              setState(() {
                change = !change;
              });
            },
            child: const Text('Tap to change'),
          ),
        ],
      ),
    );
  }

  Widget _buildWorld() {
    return Row(
      children: const <Widget>[Text('Hello World')],
    );
  }

  Widget _buildFlutter() {
    return Row(
      children: const <Widget>[Text('Hello Flutter')],
    );
  }
}
