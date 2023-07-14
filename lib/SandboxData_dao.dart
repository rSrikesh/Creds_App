import 'package:creds_app/SandboxData.dart';
import 'package:floor/floor.dart';

@dao
abstract class SandboxData_dao {
  @Query('SELECT * FROM data')
  Future<List<SandboxData>> getData();

  @insert
  Future<void> insertData(SandboxData snd);
}
