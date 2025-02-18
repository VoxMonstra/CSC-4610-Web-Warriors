import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String apiUrl = 'https://simplybakery-dev.duckdns.org/api';
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _storage.read(key: 'access_token');
  }

  Future<void> storeToken(String token) async {
    await _storage.write(key: 'access_token', value: token);
  }
  //(Clears Token)
  Future<void> logout() async {
    await _storage.delete(key: 'access_token');
  }
  
  Future<http.Response> authenticatedRequest(
    String endpoint, String method, {Map<String, dynamic>? body}) async {
      String? token = await getToken();
      if (token == null) {
        throw Exception("No token found. please log in.");
      }

      var headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };

      var url = Uri.parse("$apiUrl$endpoint");
      var response;

      if (method == 'GET') {
        response = await http.get(url, headers: headers);
      } else if (method == 'POST') {
        response = await http.post(url, headers: headers, body: jsonEncode(body));
      }

      if (response.header.containsKey("authorization")) {
        String? newToken = response.headers["authorization"];
        if (newToken != null && newToken.startsWith("Bearer ")) {
          await storeToken(newToken.split(" ")[1]);
        }
      }

      if (response.statusCode == 403) {
        await logout();
        throw Exception("Session Expired. Please log in again.");
      }
      return response;
    }

    Future<bool> loginUser(BuildContext context, String email, String password) async {
      try {
        final response = await http.post(
         Uri.parse('$apiUrl/login'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
        );

      if(response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token']; //response should contain a token
        await storeToken(token); //store
        print(token);
        return true;
      } else {
        throw Exception('Login failed: ${response.body}');
      }
    } catch (e) {
      print("Error during login: $e");
      return false;
    } 
  }

  Future<bool> registerUser(BuildContext context, String email, String password, String firstName, String lastName) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/register'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "firstName": firstName,
          "lastName": lastName,
          }),
      );

    print("Backend Response: ${response.body}");
    final Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration successful! Please log in."))
      );

      Navigator.pushReplacementNamed(context, '/login');
      return true;
    } 
 ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text("Registration Failed: ${data["message"] ?? response.body}")),
 );

    return false;
  } catch (e) {
  print("Error during registration: $e");

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("An error occurred. Please try again.")),
  );
    return false;
    }
  } 
}