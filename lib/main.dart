import 'package:flutter/material.dart';
import 'package:test/landingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test/screens/homescreen.dart';
import 'package:test/services/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyA8ASUi0kYxa7PEvqcN5KJVHjTnzS7V9ew",
        authDomain: "fireship-1fc8c.firebaseapp.com",
        databaseURL: "https://fireship-1fc8c-default-rtdb.firebaseio.com",
        projectId: "fireship-1fc8c",
        storageBucket: "fireship-1fc8c.appspot.com",
        messagingSenderId: "341462108114",
        appId: "1:341462108114:web:410f4c2c69a30b521aea0b",
        measurementId: "G-VSQQ924K40"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
          stream: AuthService.listenForAuthStateChange(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomseScreen();
            }
            return LandingScreen();
          }),
    );
  }
}
