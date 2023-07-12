import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef EncryptFunction = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);
typedef EncryptFunctionDart = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);

class FFIBridge {
  late EncryptFunctionDart _encrypt;

  FFIBridge() {
    final dylib = DynamicLibrary.open('libnative.so');
    _encrypt = dylib.lookupFunction<EncryptFunction, EncryptFunctionDart>('encrypt');
  }

  String getEncrypt(String x, String y) {
    final Pointer<Utf8> xPtr = x.toNativeUtf8();
    final Pointer<Utf8> yPtr = y.toNativeUtf8();
    final Pointer<Utf8> result = _encrypt(xPtr, yPtr);
    final String returnValue = result.toDartString();
    calloc.free(xPtr);
    calloc.free(yPtr);
    calloc.free(result);
    return returnValue;
  }
}