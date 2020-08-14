
商米L2 手机接收广播数据flutter插件

# 如何使用

引入插件后,在需要获取获取扫描头数据的页面,创建:
```dart
static const EventChannel _eventChannel = EventChannel('smscan.flutter.io/charging');
```

`initState` 初始化

```dart
_eventChannel.receiveBroadcastStream().listen((value) {
    print("获取到扫描头数据>>>>>>>>>>$value");
}); 
```