import 'package:flutter/foundation.dart' show immutable;
import 'package:metrics_viewer/models/record.dart';

@immutable
class AnalysisReport {
  const AnalysisReport({
    required this.formatVersion,
    required this.timestamp,
    required this.records,
    required this.summary,
  });

  final int formatVersion;
  final String timestamp;
  final List<Record> records;
  final List<dynamic> summary;
}
