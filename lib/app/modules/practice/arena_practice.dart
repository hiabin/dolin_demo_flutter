import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArenaPage extends StatefulWidget {
  const ArenaPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ArenaPage> createState() => _ArenaPageState();
}

class _ArenaPageState extends State<ArenaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          RawGestureDetector(
            // 自己构造父 Widget 的手势识别映射关系
            gestures: {
              // 建立多手势识别器与手势识别工厂类的映射关系，从而返回可以响应该手势的 recognizer
              MultipleTapGestureRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                      MultipleTapGestureRecognizer>(
                () => MultipleTapGestureRecognizer(),
                (MultipleTapGestureRecognizer instance) {
                  instance.onTap = () => debugPrint('parent tapped '); // 点击回调
                },
              )
            },
            child: Container(
              color: Colors.pinkAccent,
              child: Center(
                child: GestureDetector(
                  // 子视图可以继续使用 GestureDetector
                  onTap: () => debugPrint('Child tapped'),
                  child: Container(
                    color: Colors.blueAccent,
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Get.to(
              () => const ArenaPage(
                    title: 'hello1',
                  ),
              preventDuplicates: false);
        },
        child: const Text('自己跳自己'),
      ),
    );
  }
}

class MultipleTapGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
