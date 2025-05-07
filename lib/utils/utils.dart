import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static const String keyToken = 'token_key';

  static Future<void> saveToken(String userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyToken, userData);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataToken = prefs.getString(keyToken);

    return userDataToken;
  }

  static Future<void> removeTokenData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyToken);
  }

  static const Color primaryColor = Color.fromRGBO(108, 231, 217, 1);
  static const Color primaryColorSec = Color.fromRGBO(61, 185, 245, 1);
  static const Color colorBg = Color.fromRGBO(249, 249, 250, 1);
}
