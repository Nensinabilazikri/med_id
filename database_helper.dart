import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  String databaseName = 'database_satu.db';
  String tableName = 'profil_mahasiswa';

  //init database
  Future<Database> initDatabase() async {
    return openDatabase(join(await getDatabasesPath(), '$databaseName'),
        //versi dataabsenya, defaultnya 1. kalau mau update tapi naikiin versinya
        version: 1,
        //operasi yg dilakukan jika terkoneksi dengan db untuk 'pertama kali'
        onCreate: createTable);
  }

  //cretaeTable (hanya kalau belum ada tablenya)
  void createTable(Database db, int version) async {
    String syntaxQuery = '''CREATE TABLE "$tableName" (
	"id"	INTEGER,
	"nama"	TEXT,
	"ttl"	TEXT,
	"gender"	TEXT,
	"alamat"	TEXT,
	"jurusan"	TEXT,
	"foto_path"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);''';
    await db.execute(syntaxQuery);
  }
}
