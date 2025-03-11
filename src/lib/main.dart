import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:src/screens/user_list.dart';
import 'package:src/services/auth_service.dart';
import './screens/settings.dart';
import './screens/login.dart';
import './screens/about.dart';
import './screens/inventory.dart' as inv; // Alias to avoid conflicts
import './screens/recipes.dart' as rec; // Alias to avoid conflicts
import './screens/home.dart';
import './screens/menu.dart';
import './screens/expenses.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeMode themeMode = await _loadTheme();
  AuthService authService = AuthService();
  bool loggedIn = await authService.isLoggedIn();
  runApp(ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: MyApp(initialThemeMode: themeMode, loggedIn: loggedIn),
  ));
}

Future<ThemeMode> _loadTheme() async {
  final prefs = await SharedPreferences.getInstance();
  int themeIndex = prefs.getInt('themeMode') ?? 0; // Default to System theme
  return ThemeMode.values[themeIndex];
}

class MyApp extends StatefulWidget {
  final ThemeMode initialThemeMode;
  final bool loggedIn;
  const MyApp(
      {super.key, required this.initialThemeMode, required this.loggedIn});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = widget.initialThemeMode;
  }

  void _updateTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', mode.index);
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Bakery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF7B421D),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      initialRoute: widget.loggedIn ? '/home' : '/login',
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => HomePage(),
        '/settings': (context) => SettingsScreen(onThemeChanged: _updateTheme),
        '/inventory': (context) => inv
            .InventoryPage(), // Use alias since it literally won't work without it
        '/recipes': (context) => rec.RecipesPage(),
        '/about': (context) => AboutPage(),
        '/menu': (context) => BakeryShop(),
        '/expenses': (context) => ExpensesPage(),
        '/users': (context) => UserListScreen(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
