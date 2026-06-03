import 'package:shared_preferences/shared_preferences.dart';

class PrefrancesManager {
  //////////////// Stips to MAke Singleton Class/////////////////////

  ////  Frist Stip    private Constractor
  PrefrancesManager._intrnal();

  //// Second Step     Create Instance
  static final PrefrancesManager _instance = PrefrancesManager._intrnal();

  /// Second Stip      Create Factory Constractor
  factory PrefrancesManager() => _instance;
  //////////////// Stips to MAke Singleton Class/////////////////////

  /////  Metods
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setDuble(String key, double value) async {
    return await _prefs.setDouble(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  double? getDuble(String key) {
    return _prefs.getDouble(key);
  }
}
