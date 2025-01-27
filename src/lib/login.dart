import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            const SizedBox(height: 50),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Register'),
            ),
            InkWell(
              onTap: () {},
              child: const Text('Login instead'),
            )
          ],
        ),
      ),
    );
  }
}
