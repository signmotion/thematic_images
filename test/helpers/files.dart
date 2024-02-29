import 'dart:io';

import 'package:image/image.dart';

const output = 'test/_output';

void clearOutputFolder() => Directory(output).deleteSync(recursive: true);

void save(String filename, Image image) {
  final file = '$output/$filename';
  final encoder = findEncoderForNamedImage(file)!;
  final bytes = encoder.encode(image);
  File(file)
    ..createSync(recursive: true)
    ..writeAsBytesSync(bytes);
}
