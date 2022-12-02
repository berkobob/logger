import 'dart:io';

import 'level.dart';

class Log {
  Level level;
  String msg;
  Error? _error;
  StackTrace trace;

  Log(
      {required this.level,
      required this.msg,
      Error? error,
      required this.trace}) {
    _error = error;
  }

  String get error => _error != null ? _error.toString() : '';

  @override
  String toString() => '$level: $msg - $error\t$trace';

  String get source =>
      trace.toString().split('\n')[1].replaceFirst(RegExp(r'#\d+\s+'), '');

  String get file => source
      .substring(0, source.lastIndexOf(':'))
      .replaceFirst(Directory.current.path, '')
      .replaceAll('file:///', '')
      .replaceAll('(', '')
      .replaceAll(')', '');
}
