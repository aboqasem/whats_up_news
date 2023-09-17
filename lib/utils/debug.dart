import 'package:flutter/foundation.dart';

void debug(Object? object) {
  if (kDebugMode) {
    print('''
${DateTime.now().toIso8601String()} - [DEBUG]: $object
  ''');
  }
}
