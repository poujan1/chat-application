import 'package:chat_aps/screens/auth_screens.dart';
// import 'package:chat_aps/screens/chat_screens.dart';
// import 'package:chat_aps/screens/chat_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          buttonTheme: ButtonTheme.of(context).copyWith(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )),
      title: 'ChatApp',
      home: AuthScreen(),
    );
  }
}
