import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;
  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  int get listenCount => _sharedPrefs.getInt('listenCount') ?? 0;

  set listenCount(int value) {
    _sharedPrefs.setInt('listenCount', value);
  }

  static Future<bool> isFirstVisit(String prefString) async {
    bool isFirstVisit = _sharedPrefs.getBool(prefString) ?? true;
    if (isFirstVisit) {
      _sharedPrefs.setBool(prefString, false);
    }
    return isFirstVisit;
  }

    static Future<bool> onInitialStart(String prefString) async {
    bool initialStart = _sharedPrefs.getBool(prefString) ?? true;
    if (initialStart) {
      _sharedPrefs.setBool(prefString, false);
    }
    return initialStart;
  }
}

final sharedPrefs = SharedPrefs();
