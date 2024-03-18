part of '../../thematic_images.dart';

/// Entrance point for generate images using Internet.
class NetworkImages extends Images {
  /// Constructs an image generator.
  NetworkImages({
    super.keywords,
    super.width,
    super.height,
    super.key,
  });

  /// A key of image. Range: [1; 100].
  @override
  int get key => _key ?? genRandomNumber.nextInt(100) + 1;

  /// A source for downloading the images.
  String get baseUrl => 'https://source.unsplash.com';

  @override
  Future<Image?> get innerNext async {
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
  String toString() => '${super.toString()} base url `$baseUrl`';
}
