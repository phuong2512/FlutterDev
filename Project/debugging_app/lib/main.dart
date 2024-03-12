import 'package:flutter/material.dart';
import './my_object.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? title;
  MyObject _myObject = MyObject(value: 0);      //Khởi tạo đối tượng
  Widget _buildText(){
    return Text(
      'Gía trị: ${_myObject.value}',
      style: const TextStyle(fontSize: 23),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          title: Text(title ?? 'Debugging App Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildText(),
              OutlinedButton(
                onPressed: () {
                  _myObject.increase();   //Tăng giá trị thêm 1
                  setState(() {});
                },
                child: const Text('Tang gia tri them 1'),
              ),
              OutlinedButton(
                onPressed: () {
                  _myObject.decrease();   //Giảm giá trị xuống 1
                  setState(() {});
                },
                child: const Text('Giam gia tri xuong 1'),
              ),
              OutlinedButton(
                onPressed: () {
                  _myObject.value = 5;    //Đặt giá trị thành 5
                  setState(() {});
                },
                child: const Text('Dat gia tri thanh 5'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
