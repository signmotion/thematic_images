part of '../../thematic_images.dart';

/// Entrance point for generate images.
abstract class Images {
  /// Constructs an image generator.
  Images({
    this.keywords = const [],
    num? width,
    num? height,
    int? key,
  })  : _width = width,
        _height = height,
        _key = key;

  /// Keywords for generate images.
  final List<String> keywords;
  bool get hasKeywords => keywords.isNotEmpty;

  /// A width for images.
  final num? _width;
  int get width => _width?.toInt() ?? 512;
  bool get hasWidth => _width != null;

  /// A height for images.
  final num? _height;
  int get height => _height?.toInt() ?? 512;
  bool get hasHeight => _height != null;

  /// A key of image. Range: see [randomPositiveInt].
  final int? _key;
  int get key => _key ?? randomPositiveInt;

  bool get hasKey => _key != null;

  /// Next image or empty image when error.
  /// Use [innerNext] and [emptyImage] for construct result.
  Future<Image> get next async {
    try {
      return await innerNext ?? emptyImage;
    } catch (_) {
      return emptyImage;
    }
  }

  @protected
  Future<Image?> get innerNext;

  final emptyImage = Image.empty();

  @override
  String toString() => '$runtimeType $width x $height key $key';
}
