import 'package:flutter/foundation.dart' show immutable;
import 'package:metrics_viewer/models/code_span.dart';

@immutable
class Context {
  const Context({
    required this.message,
    required this.span,
  });

  final String message;
  final CodeSpan span;
}
