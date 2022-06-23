import 'package:flutter/foundation.dart' show immutable;
import 'package:metrics_viewer/models/issue.dart';
import 'package:metrics_viewer/models/metrics.dart';
import 'package:metrics_viewer/models/report.dart';

@immutable
class Record {
  const Record({
    required this.path,
    required this.fileMetrics,
    required this.classes,
    required this.functions,
    required this.issues,
    required this.antiPatternCases,
  });

  final String path;
  final List<Metrics> fileMetrics;
  final Map<String, Report> classes;
  final Map<String, Report> functions;
  final List<Issue> issues;
  final List<Issue> antiPatternCases;
}
