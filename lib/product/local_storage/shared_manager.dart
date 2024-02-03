import 'package:bende_fazla/product/enums/app_shared_keys.dart';
import 'package:bende_fazla/product/local_storage/shared_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  SharedPreferences? preferences;

  // shared objesi olusturur
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  // obje olusturulmus mu diye kontrol eder
  void _checkPreferences() {
    if (preferences == null) throw SharedInitializeException();
  }

  // bool degerlerini sharedPreferencese kaydeder
  Future<void> saveBool(AppSharedKeys key, bool value) async {
    _checkPreferences();
    await preferences?.setBool(key.name, value);
  }

  // bool degerlerini sharedPreferences den ceker
  bool? getBool(AppSharedKeys key) {
    _checkPreferences();
    final bool onboard = preferences?.getBool(key.name) ?? false;
    return onboard;
  }
}
