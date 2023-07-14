// ignore: file_names
import 'dart:async';
import 'package:floor/floor.dart';
import 'SandboxData_dao.dart';
import 'SandboxData.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'DataBase.g.dart';
 // the generated code will be there

 @Database(version: 1, entities: [SandboxData])
 abstract class AppDatabase extends FloorDatabase {
   SandboxData_dao get sandboxDao;
 }