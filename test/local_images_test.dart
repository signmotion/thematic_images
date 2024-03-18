import 'package:test/test.dart';
import 'package:thematic_images/thematic_images.dart';

import 'helpers/files.dart';

void main() {
  group('LocalImages', () {
    test('Generate some images with same width and height', () async {
      clearOutputFolder('local');

      const w = 256;
      const h = 256;

      final images = LocalImages(width: w, height: h);
      for (var i = 0; i < 4; ++i) {
        final file = save('local', '${i}_${w}x$h.png', await images.next);
        checkFileImage(file, width: w, height: h);
      }
    });
  }, tags: ['current']);
}
