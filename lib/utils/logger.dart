
// ========================================================
// [LATIHAN 4] CLASS LOGGER UNTUK LOGGING TERSTRUKTUR
// ========================================================
import 'package:flutter/foundation.dart';

class Logger {
  /// Base method log internal yang membatasi log hanya berjalan pada mode Debug
  static void _log(String level, String message) {
    if (kDebugMode) {
      print('[${level.toUpperCase()}] ${DateTime.now()}: $message');
    }
  }

  static void debug(String message) => _log('DEBUG', message);
  static void info(String message) => _log('INFO', message);
  static void warning(String message) => _log('WARNING', message);
  
  /// Mencetak error dengan aman tanpa kebocoran informasi kredensial sensitif
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _log('ERROR', '$message ${error != null ? "- Detail: $error" : ""}');
    if (stackTrace != null && kDebugMode) {
      print(stackTrace);
    }
  }
}
