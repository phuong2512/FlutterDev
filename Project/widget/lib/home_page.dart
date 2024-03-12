import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int value = 0;
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_outlined),
        title: const Text('My App'),
        backgroundColor: Colors.lightBlueAccent,
        actions: const [
          Icon(Icons.notifications),
          Icon(Icons.settings),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  value--;
                  setState(() {});
                },
                icon: const Icon(Icons.remove),
            ),
            Text(
              '$value',
              style: const TextStyle(fontSize: 24),
            ),
            IconButton(
              onPressed: () {
                value++;
                setState(() {});
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      )
    );
  }
}