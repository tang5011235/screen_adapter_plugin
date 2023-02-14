import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:screen_adapter/screen_adapter.dart';
import 'package:screen_adapter_example/example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeWidget()
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String _platformVersion = 'Unknown';
  double _devicePxRadio = 0;
  double _height = 0;
  double _width = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    double height;
    double width;
    double devicePxRadio;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await ScreenAdapter.getPlatformVersion() ??
          'Unknown platform version';
      devicePxRadio = await ScreenAdapter.getDevicePxRatio() ?? 0;
      width = await ScreenAdapter.getPhysicalWidth() ?? 0;
      height = await ScreenAdapter.getPhysicalHeight() ?? 0;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      height = 0;
      width = 0;
      devicePxRadio = 0;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _height = height;
      _width = width;
      _devicePxRadio = devicePxRadio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Running on: $_platformVersion\n'),
            Text('Running on: $_height\n'),
            Text('Running on: $_width\n'),
            Text('Running on: $_devicePxRadio\n'),
            Text('flutter'),
            Text(window.physicalSize.toString()),
            Text(MediaQuery
                .of(context)
                .devicePixelRatio
                .toString()),
            Text(MediaQuery
                .of(context)
                .size
                .toString()),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ExamplePage();
                  }));
                },
                child: Text('示例'))
          ],
        ),
      ),
    );
  }
}

