// ignore: file_names
import 'package:creds_app/Sandbox.dart';
import 'package:flutter/material.dart';
import 'Internet.dart';
import 'NativeLib.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _State createState() => _State();
}

class _State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100.0),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Internet()));
                },
                child: const Text('Internet')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NativeLib()));
                },
                child: const Text('Native')),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Sandbox()));
              },
              child: const Text('Sandbox'),
            ),
          ],
        ),
      ),
    );
  }
}
