import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tujuh_sembilan_test_app/services/auth_services.dart';
import '../widgets/auth_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final response = await AuthService.login(
      _usernameController.text.trim(),
      _passwordController.text.trim(),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.success) {
      Navigator.pushReplacementNamed(
        // ignore: use_build_context_synchronously
        context,
        '/home',
        arguments: response.user,
      );
    } else {
      setState(() {
        _errorMessage = response.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(
            fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AuthForm(
          formKey: _formKey,
          usernameController: _usernameController,
          passwordController: _passwordController,
          isLoading: _isLoading,
          errorMessage: _errorMessage,
          onSubmit: _login,
          isLogin: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
