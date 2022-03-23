import "package:flutter/material.dart";
import 'package:test/services/auth_service.dart';
import './createAccountScreen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Text('BrainBatu'),
      //   centerTitle: true,
      // ),
      body: Container(
        color: const Color(0xffffffff),
        child: ListView(
          children: [
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              // ignore: prefer_const_constructors
              child: const Align(
                alignment: Alignment.topCenter,
                child: const Text(
                  'Brainbatu',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.message),
                          hintText: 'Username'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      child: Text('Send me in'),
                      onPressed: () {
                        print('hello world');
                        AuthService.logUserIn(
                            'email@fmail.com', 'something random');
                      },
                      style: ElevatedButton.styleFrom(
                        enableFeedback: true,
                        minimumSize: Size.fromHeight(56),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccountScreen()));
                    },
                    child: Text('Don\'t have an account, create one'),
                  )
                ],
              ),
            ),

            SizedBox(height: 20),
            Container(
              child: StreamBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('Hooray authenticated');
                  }
                  return Text('Oops no we are not');
                },
                stream: AuthService.listenForAuthStateChange(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
