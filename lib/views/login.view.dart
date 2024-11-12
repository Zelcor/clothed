import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import '../controllers/auth.controller.dart';
class LoginPage extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothed'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: loginController,
              decoration: InputDecoration(labelText: 'Login'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String login = loginController.text;
                String password = passwordController.text;

                if (login.isEmpty || password.isEmpty) {
                  print('Login or password is empty');
                  return;
                }
                 // Interroger Firestore pour vérifier les informations d'identification
                try {
                  AuthController authController = AuthController();
                  var user = await authController.login(login, password);

                  if (user != null) {
                    print('Login successful');
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                      content: Text(
                        'Wrong password',
                        style: TextStyle(color: Colors.red),
                      ),
                      backgroundColor: Colors.white,
                      ),
                    );
                  }
                } catch (e) {
                  print('Error occurred while checking login: $e');
                }
              },
              child: Text('Se connecter'),
            ),
          ],
        ),
      ),
    );
  }
}