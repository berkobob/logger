import 'package:logger/logger.dart';
import 'package:logger/src/graphic_printer.dart';

void main(List<String> arguments) {
  final log = Logger(graphicPrinter);
  log.v('This is the verbose message');
  log.d('This is the debug message');
  log.i('This is the info message', ArgumentError());
  log.w('This is the warning message');
  log.e('This is the error message', ArgumentError());
  log.wtf('This is the WTF message');
}
