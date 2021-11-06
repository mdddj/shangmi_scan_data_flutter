import 'package:flutter/material.dart';
import 'package:sm_scan/shangmi_scan_mixin.dart';
import 'package:sm_scan/shangmi_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with ShangmiScanMixin<MyApp> {
  // 第一步：混入ShangmiScanMixin

  String _code = '';


  @override
  void initState() {
    super.initState();

  
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('扫码例子'),
        ),
        body: Center(
          child: Text('扫描到数据：$_code'),
        ),
      ),
    );
  }

  /// 第二步：实现shangmiCodeHandle方法，当红外扫码头扫到数据执行的方法
  ///
  /// code: 表示扫码到的数据
  ///
  @override
  Future<void> shangmiCodeHandle(String code) async {
    /// 编写你的逻辑
    print('扫描到数据：$code');
    setState(() {
      _code = code;
    });
  }
}


