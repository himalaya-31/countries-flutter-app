import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseRepository {

  static const String TABLE_COUNTRY_DETAIL = "country_detail";
  static const String COUNTRY_DETAIL_DATA = 'country_detail_data';

  DataBaseRepository._();

  static final DataBaseRepository db = DataBaseRepository._();

  Database _database;

  /// Database getter method used to get the database instance
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    String dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, 'countries.db');
    if (await databaseExists(dbPath)) {
      return await openDatabase(dbPath);
    }

    return await openDatabase(dbPath, version: 1,
        onCreate: (Database database, int version) async {
          Batch batch = database.batch();
          batch.execute("CREATE TABLE $TABLE_COUNTRY_DETAIL ("
              "$COUNTRY_DETAIL_DATA TEXT"
              ")");
          await batch.commit();
        });
  }

  Future<void> insertCountryDetailData(String countryDetailData) async {
    final db = await database;
    await db.insert(TABLE_COUNTRY_DETAIL,
      {
        COUNTRY_DETAIL_DATA: countryDetailData
      }
    );
  }
}