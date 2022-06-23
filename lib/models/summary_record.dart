import 'package:flutter/foundation.dart' show immutable;

@immutable
class SummaryRecord {
  const SummaryRecord({
    required this.status,
    required this.title,
    required this.value,
    required this.violations,
  });

  final String status;
  final String title;
  final dynamic value;
  final int violations;
}
