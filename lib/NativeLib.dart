// ignore: file_names
import 'package:flutter/material.dart';
import 'ffi_bridge.dart';

class NativeLib extends StatefulWidget {
  const NativeLib({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _State createState() => _State();
}

class _State extends State<NativeLib> {
  final FFIBridge ffi = FFIBridge();
  TextEditingController x = TextEditingController();
  TextEditingController y = TextEditingController();
  bool isButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 150.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: x,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter First Value'),
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: y,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Second Value'),
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isButtonClicked = true;
                    });
                  },
                  child: const Text('Encrypt'),
                )),
            const SizedBox(height: 15.0),

            Visibility(
              visible: isButtonClicked,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Encrypted Value: ${ffi.getEncrypt(x.text, y.text)}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
