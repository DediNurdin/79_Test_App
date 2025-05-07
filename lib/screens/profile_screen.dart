import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tujuh_sembilan_test_app/utils/utils.dart';
import '../models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
            fontSize: 14,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Utils.primaryColor,
                backgroundImage: NetworkImage(user.image),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 1,
              color: Utils.colorBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.plusJakartaSans().fontFamily,
                              fontSize: 14,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            'Username',
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.plusJakartaSans().fontFamily,
                              fontSize: 14,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            'Email',
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.plusJakartaSans().fontFamily,
                              fontSize: 14,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            'Gender',
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.plusJakartaSans().fontFamily,
                              fontSize: 14,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            '${user.firstName} ${user.lastName}',
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.plusJakartaSans().fontFamily,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            user.username,
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.plusJakartaSans().fontFamily,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            user.email,
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.plusJakartaSans().fontFamily,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            user.gender,
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.plusJakartaSans().fontFamily,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
