import 'dart:async';

import 'package:flutter/services.dart';

/// 商米
class ShangMiScanUtil {
  ShangMiScanUtil._();
  factory ShangMiScanUtil() => _instance;
  static ShangMiScanUtil get _instance => ShangMiScanUtil._();

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
