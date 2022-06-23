import 'package:flutter/foundation.dart';

@immutable
class Suggestion {
  const Suggestion({
    required this.comment,
    required this.replacement,
  });

  final String comment;
  final String replacement;
}
