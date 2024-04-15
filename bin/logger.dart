import 'package:logger/logger.dart';

void main(List<String> arguments) {
  final log = Logger();
  log.v('verbose');
  log.d('debug');
  log.i('info', ArgumentError());
  log.w('warning');
  log.e('error', ArgumentError());
  log.wtf('WTF');
}
