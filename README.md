
# sm_scan

[![GitHub issues](https://img.shields.io/github/issues/mdddj/shangmi_scan_data_flutter)](https://github.com/mdddj/shangmi_scan_data_flutter/issues)
[![GitHub forks](https://img.shields.io/github/forks/mdddj/shangmi_scan_data_flutter)](https://github.com/mdddj/shangmi_scan_data_flutter/network)
[![GitHub stars](https://img.shields.io/github/stars/mdddj/shangmi_scan_data_flutter)](https://github.com/mdddj/shangmi_scan_data_flutter/stargazers)
[![GitHub license](https://img.shields.io/github/license/mdddj/shangmi_scan_data_flutter)](https://github.com/mdddj/shangmi_scan_data_flutter/blob/master/LICENSE)



#### 商米手持pda设备（android）主要应用于仓储，快递等ERP系统中。这个插件方便大家简单获取到它的红外头扫描到的条码数据

pub.dev地址: [https://pub.dev/packages/sm_scan](https://pub.dev/packages/sm_scan)

开发环境
```dart
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.0.2, on macOS 12.4 21F79 darwin-arm (Rosetta),
    locale zh-Hans-CN)
Checking Android licenses is taking an unexpectedly long time...[✓] Android toolchain - develop for Android devices (Android SDK version
    32.1.0-rc1)
[✓] Xcode - develop for iOS and macOS (Xcode 13.4.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2021.2)
[✓] Android Studio (version 2021.2)
[✓] IntelliJ IDEA Ultimate Edition (version 2022.1.2)
[✓] IntelliJ IDEA Ultimate Edition (version 2022.1.2)
[✓] IntelliJ IDEA Ultimate Edition (version 2022.1.1)
[✓] VS Code (version 1.68.0)
[✓] Connected device (3 available)
```

# 引入依赖
支持空安全,适配Flutter2.10.1
```dart
dependencies:
  sm_scan: ^2.0.0 
```

# 如何使用

方式一： 在页面中混入`ShangmiScanMixin`，只需简单两步
```dart

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// 第一步：混入ShangmiScanMixin
class _MyAppState extends State<MyApp> with ShangmiScanMixin<MyApp> {


  String _code = '';

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
```

方式二： 在任何地方监听数据

```dart

    /// 在任何地方监听扫描数据
    ShangMiScanUtil.instance.listen((value) {
      print("扫描到数据：$value");
    });

    /// 不需要的时候记得关闭它
    ShangMiScanUtil.instance.cancel();
```

任何问题请加QQ群：667186542


# 开源不易,请作者喝杯咖啡,哪怕一块钱也好
<img src="http://duodob.oss-cn-shenzhen.aliyuncs.com/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87%2FWechatIMG8.jpeg.jpeg">

# 附件参考
[扫码头开发及用户文档.pdf](http://sunmi-ota.oss-cn-hangzhou.aliyuncs.com/DOC/resource/re_cn/%E6%89%AB%E7%A0%81%E5%A4%B4/%E6%89%AB%E7%A0%81%E5%A4%B4%E5%BC%80%E5%8F%91%E5%8F%8A%E7%94%A8%E6%88%B7%E6%96%87%E6%A1%A3.pdf)

[flutter插件开发,监听原生广播返回数据](https://www.jianshu.com/p/46c55eb9ad12)

