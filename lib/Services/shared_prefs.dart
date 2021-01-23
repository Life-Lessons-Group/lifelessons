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
}

final sharedPrefs = SharedPrefs();
