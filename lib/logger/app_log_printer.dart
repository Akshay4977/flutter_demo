import 'package:logger/logger.dart';

Logger getLogger(String className) {
  return Logger(printer: AppLogPrinter());
}

class AppLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [event.message];
  }
}
