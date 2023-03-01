import 'package:shared_preferences/shared_preferences.dart';

class SaveService {
  late SharedPreferences _sharedPreferences;

  SaveService() {
    _init();
  }

  void _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveToken(String token) async {
    await _sharedPreferences.setString("token", token);
  }

  String? getToken() {
    return _sharedPreferences.getString("token");
  }

  Future<void> removeToken() async {
    await _sharedPreferences.remove("token");
  }
}