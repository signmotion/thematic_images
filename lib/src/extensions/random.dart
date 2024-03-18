import 'dart:math';

/// Copied from `dart_helpers`.
extension RandomIterableItemExt<T> on Iterable<T> {
  /// Random item from the [Iterable].
  T randomItem() => toList().randomItem();
}

/// Copied from `dart_helpers`.
extension RandomListItemExt<T> on List<T> {
  /// Random item from the [List].
  T randomItem() {
    if (isEmpty) {
      throw ArgumentError('The empty list.');
    }

    return this[genRandomNumber.nextInt(length)];
  }
}

/// [0; 1 << 32)
/// Copied from `dart_helpers`.
int get randomPositiveInt => genRandomNumber.nextInt(1 << 32);

final genRandomNumber = Random();
