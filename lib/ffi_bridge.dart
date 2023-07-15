import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:convert';

typedef EncryptFunction = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);
typedef EncryptFunctionDart = Pointer<Utf8> Function(
    Pointer<Utf8>, Pointer<Utf8>);

class FFIBridge {
  late EncryptFunctionDart _encrypt;

  FFIBridge() {
    final dylib = DynamicLibrary.open('libnative.so');
    _encrypt =
        dylib.lookupFunction<EncryptFunction, EncryptFunctionDart>('encrypt');
  }

  List<int> getEncrypt(String x, String y) {
    final Pointer<Utf8> xPtr = x.toNativeUtf8();
    final Pointer<Utf8> yPtr = y.toNativeUtf8();
    final Pointer<Utf8> result = _encrypt(xPtr, yPtr);
    final String returnValue = result.toDartString();
    List<int> bytes = utf8.encode(returnValue);
    calloc.free(xPtr);
    calloc.free(yPtr);
    calloc.free(result);
    return bytes;
  }
}
