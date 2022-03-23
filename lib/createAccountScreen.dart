import "package:flutter/material.dart";
import 'package:test/services/auth_service.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Create your account',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'your email',
                  prefixIcon: Icon(Icons.mail),
                ),
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
                child: Text('Create my account'),
                onPressed: () {
                  print('hello world');
                  AuthService.createUserAccount(
                      'sammyagbe', 'hello@samko.com', 'password222');
                },
                style: ElevatedButton.styleFrom(
                  enableFeedback: true,
                  minimumSize: Size.fromHeight(56),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
