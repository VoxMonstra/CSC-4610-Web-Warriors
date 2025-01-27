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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: const Offset(0,5),
              ),
            ],
          ),
         child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password')
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Register'),
            ),
            InkWell(
              onTap: () {},
              child: const Text('Login instead',
              style: TextStyle(color: Colors.blue)
              ),
            ),
          ],
        ),
      ),
        )
      )
    );
  }
}
