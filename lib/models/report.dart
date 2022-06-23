import 'package:flutter/foundation.dart';
import 'package:metrics_viewer/models/code_span.dart';
import 'package:metrics_viewer/models/metrics.dart';

@immutable
class Report {
  const Report({
    required this.span,
    required this.metrics,
  });

  final CodeSpan span;
  final List<Metrics> metrics;
}
