import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';


void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedSwitcher Plus demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showFirstChild = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          AnimatedSwitcherPlus.flipY(
            duration: const Duration(milliseconds: 1000),
            child: Container(
              key: ValueKey(_showFirstChild),
              child: Text(
                _showFirstChild ? 'Primary Text' : 'Secondary Text',
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () => setState(() {
                _showFirstChild = !_showFirstChild;
              }),
              child: const Text('Animate'),
            ),
          ),
        ],
      ),
    );
  }
}

