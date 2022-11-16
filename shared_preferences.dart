import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesHelper {
  // key - value
  SharePreferencesHelper();

  static final String KEY_ISLOGIN = 'KEY ISLOGIN';
  static final String KEY_USERNAME = 'KEY USERNAME';
  static final String KEY_PASSWORD = 'KEY PASSWORD';
  static final String KEY_ISREMEMBER = 'KEY ISREMEMBER';
  static final String KEY_TOKEN = 'KEY TOKEN';

  static final String KEY_TAMBAHNAMA = 'KEY TAMBAHNAMA';
  static final String KEY_TAMBAHNAMASINGKAT = 'KEY TAMBAHNAMASINGKAT';
  static final String KEY_CARI = 'KEY CARI';
  static final String KEY_RESET = 'KEY RESET';
  static final String KEY_SPESIALISASI_ADD = "KEY SPESIALISASI ADD";
  static final String KEY_IS_FILTER = "KEY FILTER";
  static final String KEY_SPESIALISASI_TERPILIH = "KEY SPESIALISASI TERPILIH";
  static final String KEY_ARRAY_SPESIALISASI = "KEY ARRAY SPESIALISASI";

  static final String KEY_CARINAMA = 'KEY CARINAMA';
  static final String KEY_CARINAMASing = 'KEY CARINAMASing';
  static final String KEY_IS_FILTERBANK = 'KEY FILTERBANK';
  static final String KEY_CARIBANK = 'KEY CARIBANK';
  static final String KEY_CARINAMABANK = 'KEY CARINAMABANK';
  static final String KEY_TAMBAHBANK = 'KEY TAMBAHBANK';
  static final String KEY_TAMBAHVA = 'KEY TAMBAHVA';
  static final String KEY_ARRAY_SORT = 'KEY SORT';
  static final String KEY_NAMABANK = 'KEY NAMABANK';
  static final String KEY_IS_FILTERBANK2 = 'KEY FILTERBANK';
  static final String KEY_ID = 'KEY ID';
  //CARI DOKTER
  static final String KEY_TINDAKDOKTER = 'KEY TINDAKDOKTER';
  static final String KEY_NAMADOKTER = 'KEY NAMADOKTER';
  static final String KEY_LOKASIDOKTER = 'KEY LOKASIDOKTER';
  static final String KEY_SPESDOKTER = 'KEY SPESDOKTER';
  static final String KEY_IDDOK = 'KEY IDDOK';
  static final String KEY_LINKDOKTER = 'KEY LINKDOKTER';

  static Future<SharedPreferences> get sharedpreferences =>
      SharedPreferences.getInstance();

  static Future saveIsLogin(bool islogin) async {
    final pref = await sharedpreferences;
    return pref.setBool(KEY_ISLOGIN, islogin);
  }

  static Future<bool> readIsLogin() async {
    final pref = await sharedpreferences;
    return pref.getBool(KEY_ISLOGIN) ?? false;
  }

  //untuk simpan username
  static Future saveUserName(String username) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_USERNAME, username);
  }

  //panggil username
  static Future<String> readUsername() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_USERNAME) ?? '';
  }

//untuk simpan pass
  static Future savePassword(String password) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_PASSWORD, password);
  }

//untuk panggil password
  static Future<String> readPassword() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_PASSWORD) ?? '';
  }

  //untuk save flag(truefalse) isremember
  static Future saveIsRemember(bool isremember) async {
    final pref = await sharedpreferences;
    return pref.setBool(KEY_ISREMEMBER, isremember);
  }

  static Future<bool> readIsRemember() async {
    final pref = await sharedpreferences;
    return pref.getBool(KEY_ISREMEMBER) ?? false;
  }

  static Future saveToken(String token) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_TOKEN, token);
  }

  static Future<String> readToken() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_TOKEN) ?? '';
  }

  //minipro
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

//cari lokasi
  static Future saveCariLokasi(String cari) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_CARI, cari);
  }

  //simpan lokasi
  static Future<String> readCariLokasi() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_CARI) ?? "";
  }

  static Future saveIsFilter(bool isfilter) async {
    final pref = await sharedpreferences;
    return pref.setBool(KEY_IS_FILTER, isfilter);
  }

  static Future<bool> readIsFilter() async {
    final pref = await sharedpreferences;
    return pref.getBool(KEY_IS_FILTER) ?? false;
  }

  static Future saveSpesialisasi(String spesialisasi) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_SPESIALISASI_TERPILIH, spesialisasi);
  }

  //call username
  static Future<String> readSpesialisasi() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_SPESIALISASI_TERPILIH) ?? "";
  }

//filterberdasarkan nama
  static Future savefilterNama(bool isNama) async {
    final pref = await sharedpreferences;
    return pref.setBool(KEY_CARINAMA, isNama);
  }

  //simpan lokasi
  static Future<bool> readfilterNama() async {
    final pref = await sharedpreferences;
    return pref.getBool(KEY_CARINAMA) ?? false;
  }

  //nama singkatan
  static Future savefilterasc(bool isNamaSing) async {
    final pref = await sharedpreferences;
    return pref.setBool(KEY_CARINAMASing, isNamaSing);
  }

  //simpan lokasi
  static Future<bool> readfilterasc() async {
    final pref = await sharedpreferences;
    return pref.getBool(KEY_CARINAMASing) ?? false;
  }

  //BANK
  static Future saveIsFilterBank(bool isfilter) async {
    final pref = await sharedpreferences;
    return pref.setBool(KEY_IS_FILTERBANK, isfilter);
  }

  static Future<bool> readIsFilterBank() async {
    final pref = await sharedpreferences;
    return pref.getBool(KEY_IS_FILTERBANK) ?? false;
  }

  static Future saveCariBank(String cari) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_CARIBANK, cari);
  }

  //simpan lokasi
  static Future<String> readCariBank() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_CARIBANK) ?? "";
  }

  static Future savefilterNamaBank(bool isNama) async {
    final pref = await sharedpreferences;
    return pref.setBool(KEY_CARINAMABANK, isNama);
  }

  //simpan lokasi
  static Future<bool> readfilterNamaBank() async {
    final pref = await sharedpreferences;
    return pref.getBool(KEY_CARINAMABANK) ?? false;
  }

  static Future saveBank(String tambahnamabank) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_TAMBAHBANK, tambahnamabank);
  }

  //simpan nama level lokasi
  static Future<String> readNamaBank() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_TAMBAHBANK) ?? '';
  }

  static Future saveVA(String tambahva) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_TAMBAHVA, tambahva);
  }

  //simpan nama level lokasi
  static Future<String> readVA() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_TAMBAHVA) ?? '';
  }

  static Future saveUrutFilter(int order) async {
    final pref = await sharedpreferences;
    return pref.setInt(KEY_ARRAY_SORT, order);
  }

  //call urut filter kurir
  static Future<int> readUrutFilter() async {
    final pref = await sharedpreferences;
    return pref.getInt(KEY_ARRAY_SORT);
  }

  //berdasarkan nama bank va code
  static Future savetombolNamaBank(bool namaBank) async {
    final pref = await sharedpreferences;
    return pref.setBool(KEY_NAMABANK, namaBank);
  }

  //simpan lokasi
  static Future<bool> readtombolNamaBank() async {
    final pref = await sharedpreferences;
    return pref.getBool(KEY_NAMABANK) ?? false;
  }

  static Future saveIsFilterBank2(bool isfilter) async {
    final pref = await sharedpreferences;
    return pref.setBool(KEY_IS_FILTERBANK2, isfilter);
  }

  static Future<bool> readIsFilterBank2() async {
    final pref = await sharedpreferences;
    return pref.getBool(KEY_IS_FILTERBANK2) ?? false;
  }

  static Future saveIDbank(String id) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_ID, id);
  }

  //simpan nama level lokasi
  static Future<String> readIDbank() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_ID) ?? '';
  }

  //cari dokter
  //simpan lokasi
  static Future savelokasidokter(String link) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_LOKASIDOKTER, link);
  }

  static Future<String> readlokasidokter() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_LOKASIDOKTER) ?? '';
  }

  static Future savenamadokter(String pilihnama) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_NAMADOKTER, pilihnama);
  }

  static Future<String> readnamadokter() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_NAMADOKTER) ?? '';
  }

  static Future savespesialisasidokter(String pilihspes) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_SPESDOKTER, pilihspes);
  }

  static Future<String> readspesialisasidokter() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_SPESDOKTER) ?? '';
  }

  static Future savetinakdokter(String pilihtindak) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_TINDAKDOKTER, pilihtindak);
  }

  static Future<String> readtindakdokter() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_TINDAKDOKTER) ?? '';
  }

  static Future saveIddokter(String id_dok) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_IDDOK, id_dok);
  }

  static Future<String> readIddokter() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_IDDOK) ?? '';
  }

  static Future savelinkdokter(String link) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_LINKDOKTER, link);
  }

  static Future<String> readlinkdokter() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_LINKDOKTER) ?? '';
  }

  //clear semua data yg disimpan
  static Future clearALLData() async {
    final pref = await sharedpreferences;
    await Future.wait(<Future>[
      pref.setBool(KEY_ISLOGIN, false),
      pref.setString(KEY_USERNAME, ''),
      pref.setString(KEY_PASSWORD, ''),
      pref.setString(KEY_TOKEN, ''),
    ]);
  }
}
