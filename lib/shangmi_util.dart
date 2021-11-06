import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 商米
class ShangMiScanUtil {
  ShangMiScanUtil._();

  factory ShangMiScanUtil() => ShangMiScanUtil._();

  static ShangMiScanUtil get instance => ShangMiScanUtil._();

  EventChannel eventChannel = EventChannel('shangmi_flutter');

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
        codeHandle.call(event.toString());
      }
    });
  }

  /// 关闭监听
  void cancel() {
    streamSubscription?.cancel();
  }
}
