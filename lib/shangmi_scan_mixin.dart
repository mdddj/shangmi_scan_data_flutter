import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sm_scan/shangmi_util.dart';

/// 商米扫描设备混入
mixin ShangmiScanMixin<T extends StatefulWidget> on State<T> {
  late StreamSubscription streamSubscription;
  final ShangMiScanUtil util = ShangMiScanUtil();

  @override
  void initState() {
    super.initState();
    /// 开始监听流
    Future.microtask(() {
      streamSubscription = util.start().listen((event) {
        util.printLog("接收扫描数据:$event");
        if (event != null) {
          shangmiCodeHandle(event.toString());
        }
      });
    });
  }

  ///
  /// 当商米红外扫描头扫描到数据的时候执行回调
  ///
  /// 可以在这里处理相关逻辑
  ///
  Future<void> shangmiCodeHandle(String code);

  @override
  void dispose() {
    super.dispose();

    /// 关闭监听流，防止内存泄漏
    streamSubscription.cancel();
  }
}
