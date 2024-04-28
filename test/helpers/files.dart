import 'dart:io';

import 'package:image/image.dart';
import 'package:test/test.dart';

const output = './_output';

void clearOutputFolder(String prefix) {
  final directory = Directory('$output/$prefix');
  if (directory.existsSync()) {
    directory.deleteSync(recursive: true);
  }
}

File save(String prefix, String filename, Image image) {
  final file = '$output/$prefix/$filename';
  final encoder = findEncoderForNamedImage(file)!;
  final bytes = encoder.encode(image);

  return File(file)
    ..createSync(recursive: true)
    ..writeAsBytesSync(bytes);
}

void checkFileImage(
  File file, {
  num? width,
  num? height,
}) {
  expect(file.existsSync(), isTrue, reason: file.path);

  final bytes = file.readAsBytesSync();
  final decoder = findDecoderForData(bytes)!;
  final image = decoder.decode(bytes)!;

  if (width != null) {
    expect(image.width, width);
  }
  if (height != null) {
    expect(image.height, height);
  }
}
