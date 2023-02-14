import 'package:flutter/material.dart';
import 'package:screen_adapter/screen_util.dart';
import 'package:screen_adapter/size_extension.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('示例'),
      ),
      body: Column(
        children: [
          // FutureBuilder(
          //     future: Future.wait([ScreenUtil.init(designSize: const Size(392, 872))]),
          //     builder: (context, snap) {
          //       if (!snap.hasData) {
          //         return Container();
          //       } else {
          //         return Container(
          //           color: Colors.red,
          //           width: 100.w,
          //           height: 100.w,
          //         );
          //       }
          //     }),
          FutureBuilder(
              future: Future.wait([ScreenUtil.init(designSize: const Size(375, 812))]),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return Container();
                } else {
                  return Container(
                    color: Colors.blue,
                    width: 100.w,
                    height: 100.h,
                  );
                }
              }),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
          )
        ],
      ),
    );
  }
}
