import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tujuh_sembilan_test_app/utils/utils.dart';

class AuthForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final bool isLoading;
  final String errorMessage;
  final Function onSubmit;
  final bool isLogin;

  const AuthForm({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
    required this.isLoading,
    required this.errorMessage,
    required this.onSubmit,
    this.isLogin = true,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/icons/logo_ic.jpg',
              width: 195,
              height: 210,
            ),
          ),
          Text(
            'Username',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
            ),
          ),
          const SizedBox(height: 10),

          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),

              fillColor: Utils.colorBg,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Password',
            style: TextStyle(
              fontSize: 14,

              fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
            ),
          ),
          const SizedBox(height: 10),

          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              fillColor: Utils.colorBg,
              filled: true,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          if (errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(errorMessage, style: TextStyle(color: Colors.red)),
            ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Utils.primaryColorSec,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: isLoading ? null : () => onSubmit(),
                  child:
                      isLoading
                          ? CupertinoActivityIndicator()
                          : Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily:
                                  GoogleFonts.plusJakartaSans().fontFamily,
                            ),
                          ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
