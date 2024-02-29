part of '../../thematic_images.dart';

/// Entrance point for generate images.
class Images {
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

  /// A width for images.
  final num? _width;
  int get width => _width?.toInt() ?? 512;

  /// A height for images.
  final num? _height;
  int get height => _height?.toInt() ?? 512;

  /// A key of image. Range [1; 100].
  final int? _key;
  int get key => _key ?? _genRandomNumber.nextInt(100) + 1;

  /// A source for downloading the images.
  String get baseUrl => 'https://source.unsplash.com';

  /// Next image or empty image when error.
  Future<Image> get next async {
    try {
      return await _next ?? _emptyImage;
    } catch (_) {
      return _emptyImage;
    }
  }

  Future<Image?> get _next async {
    final url = nextUrl;
    final response = await Dio().get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    if (response.statusCode != 200 || response.data == null) {
      throw Exception(response.statusMessage);
    }

    final bytes = Uint8List.fromList(response.data!);
    final decoder = findDecoderForData(bytes);
    if (decoder == null) {
      throw Exception('Decoder not found.');
    }

    return decoder.decode(bytes);
  }

  /// Returns URL to an image random image from [baseUrl].
  String get nextUrl {
    final url = '$baseUrl/${width}x$height';
    if (keywords.isNotEmpty) {
      final formatted =
          RegExp(r'^([A-Za-z0-9].+,[A-Za-z0-9]+)$|^([A-Za-z0-9]+)$');
      if (keywords.any(formatted.hasMatch)) {
        return '$url?${keywords.join(',')}&random=$key';
      }
    } else {
      return '$url?random=$key';
    }

    return url;
  }

  @override
  String toString() => '$runtimeType `$baseUrl`';
}

final _genRandomNumber = Random();

final _emptyImage = Image.empty();
