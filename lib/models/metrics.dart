import 'package:flutter/foundation.dart' show immutable;
import 'package:metrics_viewer/models/context.dart';

@immutable
class Metrics {
  const Metrics({
    required this.metricsId,
    required this.value,
    required this.unitType,
    required this.level,
    required this.comment,
    required this.recommendation,
    required this.context,
  });

  final String metricsId;
  final int value;
  final String unitType;
  final String level;
  final String comment;
  final String recommendation;
  final List<Context> context;
}
