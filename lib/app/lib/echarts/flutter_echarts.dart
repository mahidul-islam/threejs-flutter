library flutter_echarts;

import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:threejs/app/lib/echarts/echarts_script.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

/// <!DOCTYPE html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0, target-densitydpi=device-dpi" /><style type="text/css">body,html,#chart{height: 100%;width: 100%;margin: 0px;}div {-webkit-tap-highlight-color:rgba(255,255,255,0);}</style></head><body><div id="chart" /></body></html>
/// 'data:text/html;base64,' + base64Encode(const Utf8Encoder().convert( /* STRING ABOVE */ ))
const htmlBase64 =
    'PCFET0NUWVBFIGh0bWw+CjxodG1sPgoKPGhlYWQ+CiAgICA8bWV0YSBjaGFyc2V0PSJ1dGYtOCI+CiAgICA8bWV0YSBuYW1lPSJ2aWV3cG9ydCIgY29udGVudD0id2lkdGg9ZGV2aWNlLXdpZHRoLCBpbml0aWFsLXNjYWxlPTEuMCwgbWF4aW11bS1zY2FsZT0xLjAsIG1pbmltdW0tc2NhbGU9MS4wLCB1c2VyLXNjYWxhYmxlPTAsIHRhcmdldC1kZW5zaXR5ZHBpPWRldmljZS1kcGkiIC8+CiAgICA8c3R5bGUgdHlwZT0idGV4dC9jc3MiPgogICAgICAgIGJvZHksCiAgICAgICAgaHRtbCwKICAgICAgICAjY2hhcnQgewogICAgICAgICAgICBoZWlnaHQ6IDEwMCU7CiAgICAgICAgICAgIHdpZHRoOiAxMDAlOwogICAgICAgICAgICBtYXJnaW46IDBweDsKICAgICAgICB9CiAgICAgICAgCiAgICAgICAgZGl2IHsKICAgICAgICAgICAgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDI1NSwgMjU1LCAyNTUsIDApOwogICAgICAgIH0KICAgIDwvc3R5bGU+CjwvaGVhZD4KCjxib2R5PgogICAgPGRpdiBpZD0iY2hhcnQiPjwvZGl2Pgo8L2JvZHk+Cgo8L2h0bWw+';

class Echarts extends StatefulWidget {
  const Echarts({
    Key? key,
    required this.option,
    this.extraScript = '',
    this.onMessage,
    this.extensions = const [],
    this.theme,
    this.captureAllGestures = false,
    this.captureHorizontalGestures = false,
    this.captureVerticalGestures = false,
    this.onLoad,
    this.onWebResourceError,
    this.reloadAfterInit = false,
    this.getSetStateJS,
    this.getControllerReference,
  }) : super(key: key);

  final String option;

  final String extraScript;

  final void Function(String message)? onMessage;

  final List<String> extensions;

  final String? theme;

  final bool captureAllGestures;

  final bool captureHorizontalGestures;

  final bool captureVerticalGestures;

  final void Function(WebViewXController)? onLoad;

  final void Function(WebViewXController, Exception)? onWebResourceError;

  final bool reloadAfterInit;

  final Function(Function(String))? getSetStateJS;

  final Function(WebViewXController)? getControllerReference;

  @override
  _EchartsState createState() => _EchartsState();
}

class _EchartsState extends State<Echarts> {
  WebViewXController? _controller;

  String? _currentOption;

  @override
  void initState() {
    super.initState();
    _currentOption = widget.option;
    widget.getSetStateJS?.call(update);
    if (widget.reloadAfterInit) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _controller?.reload();
      });
    }
  }

  void init() async {
    echartsScript.toString();
    final extensionsStr = widget.extensions.isNotEmpty
        ? widget.extensions.reduce((value, element) => '$value\n$element')
        : '';
    final themeStr = widget.theme != null ? '\'${widget.theme}\'' : 'null';
    await _controller?.evalRawJavascript('''
      $echartsScript
      $extensionsStr
      var chart = echarts.init(document.getElementById('chart'), $themeStr);
      ${widget.extraScript}
      chart.setOption($_currentOption, true);
    ''');
    if (widget.onLoad != null) {
      widget.onLoad!(_controller!);
    }
  }

  // Set<Factory<OneSequenceGestureRecognizer>> getGestureRecognizers() {
  //   Set<Factory<OneSequenceGestureRecognizer>> set = {};
  //   if (widget.captureAllGestures || widget.captureHorizontalGestures) {
  //     set.add(Factory<HorizontalDragGestureRecognizer>(() {
  //       return HorizontalDragGestureRecognizer()
  //         ..onStart = (DragStartDetails details) {}
  //         ..onUpdate = (DragUpdateDetails details) {}
  //         ..onDown = (DragDownDetails details) {}
  //         ..onCancel = () {}
  //         ..onEnd = (DragEndDetails details) {};
  //     }));
  //   }
  //   if (widget.captureAllGestures || widget.captureVerticalGestures) {
  //     set.add(Factory<VerticalDragGestureRecognizer>(() {
  //       return VerticalDragGestureRecognizer()
  //         ..onStart = (DragStartDetails details) {}
  //         ..onUpdate = (DragUpdateDetails details) {}
  //         ..onDown = (DragDownDetails details) {}
  //         ..onCancel = () {}
  //         ..onEnd = (DragEndDetails details) {};
  //     }));
  //   }
  //   return set;
  // }

  void update(String preOption) async {
    _currentOption = widget.option;
    if (_currentOption != preOption) {
      await _controller?.evalRawJavascript('''
        try {
          chart.setOption($_currentOption, true);
        } catch(e) {
        }
      ''');
    }
  }

  @override
  void didUpdateWidget(Echarts oldWidget) {
    super.didUpdateWidget(oldWidget);
    update(oldWidget.option);
  }

  @override
  void dispose() {
    // _controller?.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final extensionsStr = widget.extensions.isNotEmpty
        ? widget.extensions.reduce((value, element) => '$value\n$element')
        : '';
    final themeStr = widget.theme != null ? '\'${widget.theme}\'' : 'null';
    return WebViewX(
      width: Get.width,
      height: 600,
      initialContent: const Utf8Decoder().convert(
        base64Decode(htmlBase64),
      ),
      initialSourceType: SourceType.html,
      // backgroundColor: const Color(0x00000000),
      // initialUrl: htmlBase64,
      javascriptMode: JavascriptMode.unrestricted,
      jsContent: <EmbeddedJsContent>{
        EmbeddedJsContent(js: '''
      $echartsScript
      $extensionsStr
      var chart = echarts.init(document.getElementById('chart'), $themeStr);
      ${widget.extraScript}
      chart.setOption($_currentOption, true);
      ''')
      },
      onWebViewCreated: (WebViewXController webViewController) {
        _controller = webViewController;
        widget.getControllerReference?.call(webViewController);
      },
      onPageFinished: (String url) {},
      onPageStarted: (String url) {},
      onWebResourceError: (e) {
        if (widget.onWebResourceError != null) {
          widget.onWebResourceError!(_controller!, Exception(e));
        }
      },
      // javascriptChannels: <JavascriptChannel>{
      //   JavascriptChannel(
      //       name: 'Messager',
      //       onMessageReceived: (JavascriptMessage javascriptMessage) {
      //         if (widget.onMessage != null) {
      //           widget.onMessage!(javascriptMessage.message);
      //         }
      //       }),
      // },
      // gestureRecognizers: getGestureRecognizers(),
    );
  }
}
