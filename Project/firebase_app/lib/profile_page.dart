import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Column(
        children: [
          Text(
            auth.currentUser?.email ?? 'N/A',
            style: Theme.of(context).textTheme.titleLarge
          ,),
          FilledButton.tonalIcon(
                onPressed: signOut,
                icon: Icon(Icons.logout),
                label:Text('Sign Out'),
              )
        ],
    ),
    );
  }
  Future<void> signOut() async{
    await auth.signOut();
  }
}
