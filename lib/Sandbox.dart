import 'package:creds_app/DataBase.dart';
import 'package:creds_app/SandboxData.dart';
import 'package:creds_app/SandboxData_dao.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _State createState() => _State();
}

class _State extends State<Sandbox> {
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  late SharedPreferences prefs;
  late SandboxData_dao d;
  late SandboxData x;

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
    initializeDatabases();
  }

  Future<void> initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> initializeDatabases() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    d = database.sandboxDao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: a,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter First Value'),
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: b,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Second Value'),
                )),
            const SizedBox(height: 15.0),
            TextButton(
                onPressed: () async {
                  await prefs.setString('value_stored', a.text);
                  x = SandboxData(id: null, value: b.text);
                  await d.insertData(x);
                },
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
