import 'dart:async';

import 'package:flutter/services.dart';

class SmScan {
  static const MethodChannel _channel =
      const MethodChannel('sm_scan');

  static Future<String?> smScanInit() async {
    final String? code = await _channel.invokeMethod('init');
    return code;
  }
}
