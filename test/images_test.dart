import 'package:test/test.dart';
import 'package:thematic_images/thematic_images.dart';

import 'helpers/files.dart';

void main() {
  group('Images', () {
    test('Generate some images with keywords', () async {
      clearOutputFolder();

      final images = Images(keywords: ['castle'], key: 12);
      for (var i = 0; i < 4; ++i) {
        save('$i.png', await images.next);
      }
    });
  });
}
