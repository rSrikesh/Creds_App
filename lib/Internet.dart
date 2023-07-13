import 'package:flutter/material.dart';
import 'package:requests/requests.dart';

class Internet extends StatefulWidget {
  const Internet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _State createState() => _State();
}

class _State extends State<Internet> {
  TextEditingController x = TextEditingController();
  TextEditingController y = TextEditingController();
  bool isClicked = false;

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
                  controller: x,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter First Value'),
                )),
            const SizedBox(height: 20.0),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: y,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Second Value'),
                )),
            TextButton(
                onPressed: () async {
                  var r = await Requests.get(
                      'https://8ksec.io/?val=${x.text}${y.text}');
                  setState(() {
                    isClicked = true;
                  });
                },
                child: const Text('HTTPS')),
            TextButton(
                onPressed: () async {
                  var r = await Requests.get(
                      'http://example.com/?val=${x.text}${y.text}');
                  setState(() {
                    isClicked = true;
                  });
                },
                child: const Text('HTTP')),
            TextButton(onPressed: () {}, child: const Text('Pinned')),
            const SizedBox(height: 15.0),
            Visibility(
              visible: isClicked,
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Value sent is ${x.text + y.text}',
                      style: const TextStyle(fontSize: 20))),
            ),
          ],
        ),
      ),
    );
  }
}
