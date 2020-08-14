
[![GitHub issues](https://img.shields.io/github/issues/mdddj/shangmi_scan_data_flutter)](https://github.com/mdddj/shangmi_scan_data_flutter/issues)
[![GitHub forks](https://img.shields.io/github/forks/mdddj/shangmi_scan_data_flutter)](https://github.com/mdddj/shangmi_scan_data_flutter/network)
[![GitHub stars](https://img.shields.io/github/stars/mdddj/shangmi_scan_data_flutter)](https://github.com/mdddj/shangmi_scan_data_flutter/stargazers)
[![GitHub license](https://img.shields.io/github/license/mdddj/shangmi_scan_data_flutter)](https://github.com/mdddj/shangmi_scan_data_flutter/blob/master/LICENSE)

商米手机(带扫描头)接收红外扫描头发送的广播数据,返回到flutter app

# 引入依赖
```dart
sm_scan:
    git:
      url: git://github.com/mdddj/shangmi_scan_data_flutter.git
```
添加包到`pubspec.yaml`文件中
```dart
dependencies:
  sm_scan: ^0.0.2
```

# 如何使用

引入插件后,在需要获取获取扫描头数据的页面,创建:
```dart
static const EventChannel _eventChannel = EventChannel('shangmi_flutter');
```

在`initState` 初始化

```dart
_eventChannel.receiveBroadcastStream().listen((value) {
    print("获取到扫描头数据>>>>>>>>>>$value");
}); 
```

# 附件
[扫码头开发及用户文档.pdf](http://sunmi-ota.oss-cn-hangzhou.aliyuncs.com/DOC/resource/re_cn/%E6%89%AB%E7%A0%81%E5%A4%B4/%E6%89%AB%E7%A0%81%E5%A4%B4%E5%BC%80%E5%8F%91%E5%8F%8A%E7%94%A8%E6%88%B7%E6%96%87%E6%A1%A3.pdf)

[flutter插件开发,监听原生广播返回数据](https://www.jianshu.com/p/46c55eb9ad12)
