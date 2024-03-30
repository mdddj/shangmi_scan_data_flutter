import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShangMiScanUtil {
  ShangMiScanUtil._();

  factory ShangMiScanUtil() => _instance;
  static final ShangMiScanUtil _instance = ShangMiScanUtil._();
  bool showLog = true;

  EventChannel eventChannel = EventChannel('shangmi_flutter');

  void printLog(dynamic log) {
    if (showLog) {
      debugPrint('商米: $log');
    }
  }

  StreamSubscription? streamSubscription;
  Stream? stream;

  Stream start() {
    stream ??= eventChannel.receiveBroadcastStream();
    return stream!;
  }

  /// 监听扫码数据
  void listen(ValueChanged<String> codeHandle) {
    streamSubscription = start().listen((event) {
      if (event != null) {
        printLog('扫描到数据$event');
        codeHandle.call(event.toString());
      }
    });
  }

  /// 关闭监听
  void cancel() {
    streamSubscription?.cancel();
  }
}
