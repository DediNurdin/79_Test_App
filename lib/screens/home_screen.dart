import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tujuh_sembilan_test_app/utils/utils.dart';
import '../models/user.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hai, ${widget.user.firstName} ${widget.user.lastName} 🚀',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                ),
              ),
              Text(
                'Mulai eksplorasi bersama kami sekarang',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Utils.primaryColor,
                        ),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.all(16),
                        ),
                        shape: WidgetStateProperty.all(const CircleBorder()),
                      ),
                      icon: const Icon(Icons.person, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ProfileScreen(user: widget.user),
                          ),
                        );
                      },
                    ),

                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Utils.primaryColorSec,
                        ),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.all(16),
                        ),
                        shape: WidgetStateProperty.all(const CircleBorder()),
                      ),
                      icon: const Icon(Icons.logout, color: Colors.white),
                      onPressed: () async {
                        Utils.removeTokenData();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/login',
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
