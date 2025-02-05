import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import '../widgets/drawer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Preston: determines whether the app will show the 'login' screen or 'register' form
  bool userHasAccount = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome'),
      ),
      drawer: AppDrawer(currPage: Text('login')),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gpt-generated-branding.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!userHasAccount) const SizedBox(height: 10),
                    if (!userHasAccount)
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'First Name'),
                      ),
                    if (!userHasAccount) const SizedBox(height: 10),
                    if (!userHasAccount)
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Last Name'),
                      ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    if (!userHasAccount) const SizedBox(height: 10),
                    if (!userHasAccount)
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Confirm Password'),
                        obscureText: true,
                      ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFDC8515),
                        foregroundColor: Colors.white,
                        shadowColor: Color(0xFF343330),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        elevation: 5,
                      ),
                      child: Text(userHasAccount ? 'Login' : 'Register'),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          userHasAccount = !userHasAccount; // Toggle mode
                        });
                      },
                      style: TextButton.styleFrom(
                        elevation: 5,
                      ),
                      child: Text(userHasAccount
                          ? "Create a new account"
                          : "Sign in with existing account"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
