import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import '../widgets/drawer.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Preston: determines whether the app will show the 'login' screen or 'register' form
  bool userHasAccount = true;
  bool isLoading = false; //track loading state
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String apiUrl = 'https://simplybakery-dev.duckdns.org/api';

  Future<void> authenticateUser() async {
    if (!_formKey.currentState!.validate()) {
      return; // stops if validation fails
    }

    setState(() => isLoading = true);

    final String endpoint = '/login';
    final String fullUrl = '$apiUrl$endpoint';

    try {
      final response = await http.post(
        Uri.parse(fullUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
          if (!userHasAccount) ...{
            "firstName": firstNameController.text,
            "lastName": lastNameController.text,
          },
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Success
        print('Success: ${responseData['message']}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'])),
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message']), backgroundColor: Colors.red),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.'), backgroundColor: Colors.red),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
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
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!userHasAccount) ... [
                      TextFormField(
                        controller: firstNameController,
                        decoration: const InputDecoration(labelText: 'First Name'),
                        validator: (value) =>
                          value == null || value.isEmpty ? 'Enter your first name' : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: lastNameController,
                        decoration: 
                        const InputDecoration(labelText: 'Last Name'),
                        validator: (value) => 
                          value == null || value.isEmpty ? 'Enter your last name' : null,
                      ),
                      const SizedBox(height: 10),
                    ],
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                        value == null || value.isEmpty ? 'Enter Email' : null,
                      ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) => 
                        value == null || value.isEmpty ? 'Enter password' : null,
                    ),
                    if (!userHasAccount) ...[
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: confirmPasswordController,
                        decoration: const InputDecoration(labelText: 'Confirm Password'),
                        obscureText: true,
                        validator: (value) {
                          if(value == null || value.isEmpty) return 'Confirm your password';
                          if(value != passwordController.text) return 'Passwords do not match';
                          return null;
                        },
                      ),
                    ],
                    const SizedBox(height: 10),
                    isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                        onPressed: authenticateUser,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDC8515),
                          foregroundColor: Colors.white,
                          shadowColor: const Color(0xFF343330),
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
                          setState(() => userHasAccount = !userHasAccount);
                      },
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