import 'dart:async';

import 'level.dart';
import 'log.dart';

class Logger {
  static final Logger _mylog = Logger._internal();

  Logger._internal();

  factory Logger() {
    return _mylog;
  }

  final _logStream = StreamController<Log>();
  Level level = Level.verbose;

  void v(String msg, [Error? error, StackTrace? trace]) {
    if (Level.verbose.index < level.index) return;
    final log = Log(
        level: Level.verbose,
        msg: msg,
        error: error,
        trace: trace ?? StackTrace.current);
    _logStream.add(log);
  }

  void d(String msg, [Error? error, StackTrace? trace]) {
    if (Level.debug.index < level.index) return;
    final log = Log(
        level: Level.debug,
        msg: msg,
        error: error,
        trace: trace ?? StackTrace.current);
    _logStream.add(log);
  }

  void i(String msg, [Error? error, StackTrace? trace]) {
    if (Level.info.index < level.index) return;
    final log = Log(
        level: Level.info,
        msg: msg,
        error: error,
        trace: trace ?? StackTrace.current);
    _logStream.add(log);
  }

  void w(String msg, [Error? error, StackTrace? trace]) {
    if (Level.warning.index < level.index) return;
    final log = Log(
        level: Level.warning,
        msg: msg,
        error: error,
        trace: trace ?? StackTrace.current);
    _logStream.add(log);
  }

  void e(String msg, [Error? error, StackTrace? trace]) {
    if (Level.error.index < level.index) return;
    final log = Log(
        level: Level.error,
        msg: msg,
        error: error,
        trace: trace ?? StackTrace.current);
    _logStream.add(log);
  }

  void wtf(String msg, [Error? error, StackTrace? trace]) {
    if (Level.wtf.index < level.index) return;
    final log = Log(
        level: Level.wtf,
        msg: msg,
        error: error,
        trace: trace ?? StackTrace.current);
    _logStream.add(log);
  }

  /// Only one package can register a printer
  void registerPrinter(Function printer) {
    _logStream.stream.forEach((element) => printer(element));
  }
}
