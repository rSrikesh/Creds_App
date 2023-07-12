import 'package:flutter/material.dart';

class Internet extends StatefulWidget {
  const Internet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _State createState() => _State();
}

class _State extends State<Internet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              onPressed: (){},
              child: const Text('HTTPS')
            ),

            TextButton(
              onPressed: (){},
              child: const Text('HTTP')
            ),

            TextButton(
              onPressed: (){},
              child: const Text('Pinned')
            ),
          ],
        ),
      ),
    );
  }
}
