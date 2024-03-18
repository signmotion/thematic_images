# Thematic Image Generator

![Cover - Thematic Images](https://raw.githubusercontent.com/signmotion/thematic_images/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/signmotion/thematic_images/master/LICENSE)

Generates thematic images with defined keywords and sizes.
Easy-to-use and well-tested Dart package.
Feel free to use it in your projects.

## Usage

By default the package uses `https://source.unsplash.com` as source of images.

### Get an image

```dart
// get an image generator
final images = Images(keywords: ['castle']);

// generate an image
final image = await images.next;

// save the generated image as PNG file
const file = 'example_image.png';
final encoder = findEncoderForNamedImage(file)!;
final bytes = encoder.encode(image);
File(file).writeAsBytesSync(bytes);

```

![Output Castle - Thematic Images](https://raw.githubusercontent.com/signmotion/thematic_images/master/images/example_image.png)

## Welcome

Requests and suggestions are warmly welcome.

This package is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/thematic_images). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/thematic_images).

## TODO

- Notes on the image.
- Styles of images.
- Random sizes options.
- Just a one-filled-color image.
- Local images with keywords.
