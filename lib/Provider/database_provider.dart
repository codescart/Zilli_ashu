
import 'package:nb_utils/nb_utils.dart';

class DataBase{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void saveString(String data, String key) async{
    SharedPreferences preferences = await _prefs;
    preferences.setString(key, data);
  }
  Future<String?> retrieveString(String key) async{
    SharedPreferences preferences = await _prefs;
    return preferences.getString(key);
  }
}