import 'package:flutter/material.dart';
import 'package:tujuh_sembilan_test_app/services/auth_services.dart';
import 'package:tujuh_sembilan_test_app/utils/utils.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<User?> _getUserFromToken() async {
    try {
      final String? token = await Utils.getToken();
      return await AuthService.getCurrentUser(token!);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tujuh Sembilan Test App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<User?>(
        future: _getUserFromToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasData && snapshot.data != null) {
            return HomeScreen(user: snapshot.data!);
          }

          return const LoginScreen();
        },
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) {
          final user = ModalRoute.of(context)!.settings.arguments as User;
          return HomeScreen(user: user);
        },
      },
    );
  }
}
