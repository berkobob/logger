import 'ansi_color.dart';
import 'level.dart';
import 'log.dart';

import 'dart:io';

// Color chart: https://gist.github.com/JBlond/2fea43a3049b38287e5e9cefc87b2124

final levelColors = {
  Level.verbose: AnsiColor.fg(AnsiColor.grey(0.5)),
  Level.debug: AnsiColor.fg(7),
  Level.info: AnsiColor.fg(12), //12
  Level.warning: AnsiColor.fg(208),
  Level.error: AnsiColor.fg(196),
  Level.wtf: AnsiColor.fg(199),
};

final levelEmojis = {
  Level.verbose: '📣 ',
  Level.debug: '🐛 ',
  Level.info: '💡 ',
  Level.warning: '❗️ ',
  Level.error: '🤦 ',
  Level.wtf: '😱 ',
};

void printer(Log log) {
  int cols;
  try {
    cols = stdout.terminalColumns - 10;
  } catch (e) {
    cols = 170;
  }
  final step = cols ~/ 5;
  var line = levelEmojis[log.level]!;
  line += log.msg;
  if (line.length > step * 2) line += '\n...';
  line += ' ' * (step * 2 - line.lineLength);
  line += log.error;
  if (line.lineLength > step * 4) line += '\n...';
  line += ' ' * (step * 4 - line.lineLength);
  final length = line.lineLength;
  line = levelColors[log.level]!.call(line);

  // if (stdout.hasTerminal) {
  try {
    line += ' ' * (cols - length - log.file.length - 1);
    line += AnsiColor.fg(AnsiColor.grey(1.5)).call(log.file.split(' ')[0]);
    line += ' ';
    line += AnsiColor.fg(AnsiColor.grey(0.5)).call(log.file.split(' ')[1]);
  } catch (e) {
    line += log.source;
  }

  print(line);
}

extension LineLengthExtension on String {
  int get lineLength {
    final lines = split('\n');
    return lines[lines.length - 1].length;
  }
}
