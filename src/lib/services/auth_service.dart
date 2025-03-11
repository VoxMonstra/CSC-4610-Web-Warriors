import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService {
  static const String apiUrl = 'https://simplybakery-dev.duckdns.org/api';
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _storage.read(key: 'access_token');
  }

  Future<void> storeToken(String token) async {
    await _storage.write(key: 'access_token', value: token);
  }

  Future<String?> getUserRole() async {
    return await _storage.read(key: 'user_role');
  }
  //(Clears Token)
  Future<void> logout() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'user_role');
    print('Token deleted');
  }

  //Check if user is logged in
  Future<bool> isLoggedIn() async {
    String? token = await _storage.read(key: 'access_token');
    return token != null;
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

    Future<String?> loginUser(BuildContext context, String email, String password) async {
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
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        String? role = decodedToken["role"];

        await _storage.write(key: 'user_role', value: role);

        print('token stored: $token, Role stored: $role');
        return token;

      } else if (response.statusCode == 403) {
        await logout();
        throw Exception("Session Expired. Please log in again.");
      } else {
        throw Exception('Login failed: ${response.body}');
      }
    } catch (e) {
      print("Error during login: $e");
      return null;
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

  Future<Map<String, dynamic>?> fetchUserData() async {
    try {
      String? token = await getToken();
      if (token == null) return null;

      final response = await http.get(
        Uri.parse('$apiUrl/users'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load user: ${response.body}');
      }
    } catch (e) {
      print('Error loading user: $e');
      return {};
    }
  }
}