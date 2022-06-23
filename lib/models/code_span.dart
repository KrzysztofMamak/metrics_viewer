import 'package:flutter/foundation.dart' show immutable;
import 'package:metrics_viewer/models/code_location.dart';

@immutable
class CodeSpan {
  const CodeSpan({
    required this.start,
    required this.end,
    required this.text,
  });

  final CodeLocation start;
  final CodeLocation end;
  final String text;
}
