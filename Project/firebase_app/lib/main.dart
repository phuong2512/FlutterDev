import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app/firebase_ui_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'photo_gallery_screen.dart';
import 'user.dart';
import 'firebase_auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FirebaseAuthScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      home: const FirebaseUIScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get label => null;

  bool isBusy = false;

  Future<void> createData() async {
    setState(() {
      isBusy = true;
    });
    CollectionReference users = await FirebaseFirestore.instance.collection('users');
    // ignore: unused_local_variable
    final now = DateTime.now();
    final user = User(
      name: 'Trần Văn Phương',
      age: 20,
      email: 'phuongqv11@gmail.com',
    );
    users.add(user.toMap()).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
    setState(() {
      isBusy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Firebase Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.icon(
                onPressed: createData,
                icon: const Icon(Icons.add),
                label: const Text('Create (Thêm dữ liệu)'))
          ],
        ),
      ),
    );
  }
}