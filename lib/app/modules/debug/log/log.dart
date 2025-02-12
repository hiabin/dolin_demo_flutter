import 'package:dolin_demo_flutter/app/services/storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:logger_flutter_plus/logger_flutter_plus.dart';

class Log {
  static Logger logger = Logger(
    output: AppLogOutput(
      logConsoleManager: StorageService.instance.logConsoleManager,
    ),
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  static d(String message) {
    logger.d("${DateTime.now().toString()}\n$message");
  }

  static i(String message) {
    logger.i("${DateTime.now().toString()}\n$message");
  }

  static e(String message, StackTrace stackTrace) {
    logger.e("${DateTime.now().toString()}\n$message", null, stackTrace);
  }

  static w(String message) {
    logger.w("${DateTime.now().toString()}\n$message");
  }

  static void logPrint(dynamic obj) {
    if (obj is Error) {
      Log.e(obj.toString(), obj.stackTrace ?? StackTrace.current);
    } else if (kDebugMode) {
      print(obj);
    }
  }
}

class AppLogOutput extends LogOutput {
  AppLogOutput({
    required this.logConsoleManager,
  });
  final LogConsoleManager logConsoleManager;

  @override
  void output(OutputEvent event) {
    // 记录到 logConsoleManager
    logConsoleManager.addLog(event);
    // 控制台打印
    event.lines.forEach(print);
  }

  @override
  void destroy() {
    logConsoleManager.dispose();
    super.destroy();
  }
}
