
商米L2 手机接收广播数据flutter插件

# 如何使用

引入插件后,在需要获取获取扫描头数据的页面,创建:
```dart
static const EventChannel _eventChannel = EventChannel('smscan.flutter.io/charging');
```

在`initState` 初始化

```dart
_eventChannel.receiveBroadcastStream().listen((value) {
    print("获取到扫描头数据>>>>>>>>>>$value");
}); 
```

最后附上官方开发指南[扫码头开发及用户文档.pdf](http://sunmi-ota.oss-cn-hangzhou.aliyuncs.com/DOC/resource/re_cn/%E6%89%AB%E7%A0%81%E5%A4%B4/%E6%89%AB%E7%A0%81%E5%A4%B4%E5%BC%80%E5%8F%91%E5%8F%8A%E7%94%A8%E6%88%B7%E6%96%87%E6%A1%A3.pdf)