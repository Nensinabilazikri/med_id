import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesHelperMinpro {
  SharePreferencesHelperMinpro();

  static final String KEY_TAMBAHNAMA = 'KEY TAMBAHNAMA';
  static final String KEY_TAMBAHNAMASINGKAT = 'KEY TAMBAHNAMASINGKAT';
  static final String KEY_CARI = 'KEY CARI';
  static final String KEY_RESET = 'KEY RESET';

  static Future<SharedPreferences> get sharedpreferences =>
      SharedPreferences.getInstance();

  //tambah nama level lokasi
  static Future saveNama(String tambahnama) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_TAMBAHNAMA, tambahnama);
  }

  //simpan nama level lokasi
  static Future<String> readNama() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_TAMBAHNAMA) ?? '';
  }
}
