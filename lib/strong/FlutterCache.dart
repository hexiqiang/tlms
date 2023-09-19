import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  SharedPreferences prefs;

  CacheManager(this.prefs);

  Future<void> set(String key, String value) async {
    await prefs.setInt(key, value.hashCode);
    await prefs.setString(key + '_value', value);
  }

  Future<String?> get(String key) async {
    int? hashCode = await prefs.getInt(key);
    if (hashCode == null) return null;

    String? value = await prefs.getString(key + '_value');
    if (value == null) return null;

    return value;
  }

  Future<void> remove(String key) async {
    await prefs.remove(key);
    await prefs.remove(key + '_value');
  }

  Future<void> clear() async {
    prefs.clear();
  }
}