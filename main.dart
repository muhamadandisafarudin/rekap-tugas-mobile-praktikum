import 'package:flutter/material.dart';

void main() { 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});git 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'semoga bisa st',
      theme: ThemeData(
      

        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 255, 72, 0)),
      ),
      home: const MyHomePage(title: 'day 1 belajar flutter'),
      debugShowCheckedModeBanner: false,
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

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( 

        backgroundColor: Colors.blue,

        title: Text('Teknik 123 jaya'),
        
      ),
      body: Center( 

        child: Column(

          mainAxisAlignment: .center,
          children: [
            const Text('apa ya:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Icon(Icons.access_alarm)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton( 
        onPressed: _incrementCounter, 
        tooltip: 'Increment', 
        child: const Icon(Icons.add),
      ),
    );
  }
}