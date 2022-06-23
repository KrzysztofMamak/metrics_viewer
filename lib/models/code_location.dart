import 'package:flutter/foundation.dart' show immutable;

@immutable
class CodeLocation {
  const CodeLocation({
    required this.offset,
    required this.line,
    required this.column,
  });

  final int offset;
  final int line;
  final int column;
}
