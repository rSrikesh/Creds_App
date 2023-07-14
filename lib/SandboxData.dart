import 'package:floor/floor.dart';

@Entity(tableName: 'sandboxdata')
class SandboxData {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? value;

  SandboxData({this.id, this.value});

  
}
