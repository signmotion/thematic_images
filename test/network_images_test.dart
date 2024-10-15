import 'package:test/test.dart';
import 'package:thematic_images/thematic_images.dart';

import 'helpers/files.dart';

void main() {
  group('NetworkImages', () {
    test('Generate some images with keywords', () async {
      clearOutputFolder('network');

      final images = NetworkImages(keywords: ['castle']);
      for (var i = 0; i < 4; ++i) {
        save('network', '$i.png', await images.next);
      }
    });
  }, tags: ['windows']);
}
