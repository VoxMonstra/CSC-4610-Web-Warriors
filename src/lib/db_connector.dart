import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> connectToDB() async {
  final settings = ConnectionSettings(
    host: 'YOUR_VM_IP', // VM's public/private IP
    port: 3306,
    user: 'flutter_user',
    password: 'your_password',
    db: 'bakery_db',
  );

  return await MySqlConnection.connect(settings);
}