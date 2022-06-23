import 'package:flutter/foundation.dart' show immutable;
import 'package:metrics_viewer/models/code_span.dart';
import 'package:metrics_viewer/models/suggestion.dart';

@immutable
class Issue {
  const Issue({
    required this.ruleId,
    required this.documentation,
    required this.span,
    required this.severity,
    required this.message,
    required this.verboseMessage,
    required this.suggestion,
  });

  final String ruleId;
  final String documentation;
  final CodeSpan span;
  final String severity;
  final String message;
  final String verboseMessage;
  final Suggestion suggestion;
}
