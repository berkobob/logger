import 'dart:io';

import 'ansi_color.dart';
import 'level.dart';
import 'log.dart';

// Color chart: https://gist.github.com/JBlond/2fea43a3049b38287e5e9cefc87b2124

final levelColors = {
  Level.verbose: AnsiColor.fg(AnsiColor.grey(0.75)),
  Level.debug: AnsiColor.fg(AnsiColor.grey(1.0)),
  Level.info: AnsiColor.fg(12), //12
  Level.warning: AnsiColor.fg(208),
  Level.error: AnsiColor.fg(196),
  Level.wtf: AnsiColor.fg(199),
};

final levelEmojis = {
  Level.verbose: '📣 ─ noise ',
  Level.debug: '🐛 ─ debug ',
  Level.info: '💡 ─ info  ',
  Level.warning: '❗️ ─ warn  ',
  Level.error: '🤦 ─ error ',
  Level.wtf: '😱 ─  WTF  ',
};

void graphicPrinter(Log log) {
  stdout.write('│\n');
  stdout.write('├─ ${levelEmojis[log.level]}');
  stdout.write('─' * 90);
  stdout.write('\n│ ${levelColors[log.level]!.call(log.msg)}\n');
  if (log.error != '') {
    stdout.write('│ ${levelColors[log.level]!.call(log.error)}\n');
  }
  stdout.write(
      '│ ${AnsiColor.fg(AnsiColor.grey(0.5)).call(log.file.replaceFirst(' ', ': '))}\n');
  // stdout.write(
  //     ': ${AnsiColor.fg(AnsiColor.grey(0.5)).call(log.file.split(' ')[1])}\n');
  // print('│ ${log.source}');
  // print('┌');
  // print('─' * 80);
}
