import 'package:logger/logger.dart';
import 'package:logger/src/graphic_printer.dart';

void main(List<String> arguments) {
  final log = Logger(p: graphicPrinter);
  log.v('verbose');
  log.d('debug');
  log.i('info', ArgumentError());
  log.w('warning');
  log.e('error', ArgumentError());
  log.wtf('WTF');
}
