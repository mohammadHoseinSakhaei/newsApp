import 'package:logger/logger.dart';

final Logger logger = Logger(printer: CustomLogPrinter());

class CustomLogPrinter extends SimplePrinter {
  @override
  List<String> log(LogEvent event) {
    var messageStr = event.message;
    var errorStr = event.error != null ? '  ERROR: ${event.error}' : '';

    //search for ['[SUCCESSFUL]'] in the log message and change the log level to Level.info
    if (messageStr.contains('[SUCCESS]')) {
      return [messageStr];
    } else {
      return ['${_labelFor(event.level)} $messageStr$errorStr'];
    }
  }

  String _labelFor(Level level) {
    return _levelPrefixes[level]!;
  }

  final _levelPrefixes = {
    Level.debug: '[DEBUG]',
    Level.info: '[INFO]',
    Level.warning: '[WARNING]',
    Level.error: '[ERROR]',
  };
}

extension Log on Logger {
  void s(String message) => i('[SUCCESS] $message');
}