import 'dart:io';

import 'package:image/image.dart';
import 'package:thematic_images/thematic_images.dart';

void main() async {
  // get an image generator
  final images = NetworkImages(keywords: ['castle']);

  // generate an image and save as PNG file
  final image = await images.next;
  const file = 'example_image.png';
  final encoder = findEncoderForNamedImage(file)!;
  final bytes = encoder.encode(image);
  File(file).writeAsBytesSync(bytes);
}
