import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final AuthService _authService = AuthService();
  late Future<List<Map<String, dynamic>>?> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = _authService.fetchUsers(); // Fetch users when the screen loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: FutureBuilder<List<Map<String, dynamic>>?>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading
          }
          if (snapshot.hasError || snapshot.data == null) {
            return Center(child: Text("Error loading users"));
          }

          List<Map<String, dynamic>> users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];
              return Card(
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("${user['firstName']} ${user['lastName']}"),
                  subtitle: Text("Role: ${user['role']}\nEmail: ${user['userEmail']}"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserDetailsScreen(user: user)),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class UserDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> user;
  UserDetailsScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${user['firstName']} ${user['lastName']}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Email: ${user['userEmail']}"),
            Text("Role: ${user['role']}"),
            SizedBox(height: 10),
            Text("Address:"),
            Text("${user['userStreet']}, ${user['userStreet2']}"),
            Text("${user['userCity']}, ${user['userState']}, ${user['userPostal']}"),
            Text("${user['userCountry']}"),
          ],
        ),
      ),
    );
  }
}
