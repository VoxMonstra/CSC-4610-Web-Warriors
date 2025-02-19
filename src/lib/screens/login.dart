import 'dart:convert'; // Import JSON encoding and decoding
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import '../widgets/drawer.dart';
import 'package:http/http.dart' as http; // Import for making HTP requests
import '../services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({super.key}); // Login widget constructor

  @override
  State<Login> createState() => _LoginState(); // Create the state for the login widget
}

class _LoginState extends State<Login> {
  bool userHasAccount = true; // Preston: determines whether the app will show the 'login' screen or 'register' form
  bool isLoading = false; //track loading state
  String message ='';
  // Controllers for text input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // key for form validation

  final AuthService _authService = AuthService(); //Initialize AuthService

  // API URL
 // final String apiUrl = 'https://simplybakery-dev.duckdns.org/api';

  // function for registering an account
  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) return; // Validates the form fields, and return if they are not valid

      String firstName = firstNameController.text.trim();
      String lastName = lastNameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String confirmPassword = confirmPasswordController.text.trim();

      if(password != confirmPassword) { // Check if password and confirm password match
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match")), // Show snackbar if passwords don't match
        );
        return; // Exit function if passwords don't match
      }

      // Sets loading state to true
      setState(() => isLoading = true);

      // HTTP POST request to register a new user
      try {
        final response = await _authService.registerUser(
          context,
          email,
          password,
          firstName,
          lastName,
        );

        if (response) {
          setState(() => message = "User Registered Successfully!");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Registration successful for $email")),
          );
          setState(() => userHasAccount = true);
        }
      } catch (e) { // Handle exception
        print("Error during registration: $e");
        setState(() => message = e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An error occurred: $message")),
        );
      } finally {
        setState(() => isLoading = false); // Reset loading state
      }
    }

    // function for logging into a registered account
    Future<void> loginUser() async {
      if (!_formKey.currentState!.validate()) return;// Validate the form fields, and return if the form is not valid

      setState(() => isLoading = true); // Sets loading state to true

      try {
        final response = await _authService.loginUser(
          context,
          emailController.text.trim(),
          passwordController.text.trim(),
          );

        if(response != null) {
          await _authService.storeToken(response);
          setState(() => message = "Login Successful");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Login Successful")),
          );
          Navigator.pushReplacementNamed(context, '/home');
        } else{
          setState(() => message = "Login Failed");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Login Failed. Please check your credentials.")),
          );
        }
      } catch(e) {  // Handle exception
        setState(() => message = e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An error occurred: $message")),
        );
      } finally {
        setState(() => isLoading = false); // Reset loading state
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
      backgroundColor: Color(0xFFE3CCB0),
      appBar: AppBar(title: Text('Welcome'),
      iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: AppDrawer(currPage: Text('login')),
      body: Stack(
        children: [
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
                    if (userHasAccount) ...[
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.black),
                        validator: (value) =>
                          value == null || value.isEmpty ? 'Enter Email' : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        obscureText: true,
                        style: const TextStyle(color: Colors.black),
                        validator: (value) =>
                          value == null || value.isEmpty ? 'Enter password' : null,
                      ),
                    ] else ...[
                      TextFormField(
                        controller: firstNameController,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        style: const TextStyle(color: Colors.black),
                        validator: (value) =>
                          value == null || value.isEmpty ? 'Enter your first name' : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        style: const TextStyle(color: Colors.black),
                        validator: (value) =>
                          value == null || value.isEmpty ? 'Enter your last name' : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.black),
                        validator: (value) =>
                          value == null || value.isEmpty ? 'Enter Email' : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        obscureText: true,
                        style: const TextStyle(color: Colors.black),
                        validator: (value) =>
                          value == null || value.isEmpty ? 'Enter password' : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: confirmPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        obscureText: true,
                        style: const TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Confirm your password';
                          if (value != passwordController.text) return 'Passwords do not match';
                          return null;
                        },
                      ),
                    ],
                    const SizedBox(height: 10),
                    isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async {
                            if (userHasAccount) {
                              String? token = await AuthService().loginUser(
                                context, 
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                              print('Token recieved: $token');
                            if (token != null) {
                              Navigator.pushReplacementNamed(context, '/home');

                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Login Failed. Please check your credentials.")),
                              );
                            }
                          }
                            else {
                              await registerUser();
                            } 
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFDC8515),
                            foregroundColor: Colors.white,
                            shadowColor: const Color(0xFF343330),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
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

              /*        }
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFDC8515),
                            foregroundColor: Colors.white,
                            shadowColor: const Color(0xFF343330),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
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
  
     final String apiUrl = 'https://simplybakery-dev.duckdns.org/api/register';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": emailController.text,
        "password": passwordController.text,
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
      }),
    );

    setState(() {
      isLoading = false;
    });

    if(response.statusCode == 201) {
      setState(() {
        message = "User Registered Successfully!";
      });
    } else {
      final errorData = jsonDecode(response.body);
      setState(() {
        message = errorData['message'];
      });
    }

    Future<void> loginUser() async {
      setState(() {
        isLoading = true;
        message = '';
      });

      final String apiUrl = 'https://simplybakery-dev.duckdns.org/api/login';
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
        }),
      );

      setState(() {
        isLoading = false;
      });

      if(response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          message = "Login Successful: Welcome ${data['user']['first_name']}!";
        });
      } else {
        final errorData = jsonDecode(response.body);
        setState(() {
          message = errorData['message'];
        });
      }
    }
  }
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
 // }
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
} */