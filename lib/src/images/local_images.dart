part of '../../thematic_images.dart';

/// Entrance point for generate images from local data.
/// See [data].
class LocalImages extends Images {
  /// Constructs an image generator.
  LocalImages({
    super.width,
    super.height,
    super.key,
  }) : super(keywords: const []);

  @override
  Future<Image?> get innerNext async {
    final r = hasKey ? data[key % data.length] : data.randomItem();
    final bytes = Uint8List.fromList(r.$2);
    final decoder = findDecoderForData(bytes);
    if (decoder == null) {
      throw Exception('Decoder for `${r.$1}` not found.');
    }

    final image = decoder.decode(bytes)!;

    return hasWidth || hasHeight
        ? copyResize(
            image,
            width: width,
            height: height,
            interpolation: Interpolation.cubic,
          )
        : image;
  }
}
