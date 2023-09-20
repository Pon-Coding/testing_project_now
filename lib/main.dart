import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //Start Retrieve Data From Method Channel
  static const platform = MethodChannel("com.example.flutter_application_1");
  bool deviceMode = false;
  Future<void> _getvm() async {
    bool deviceType =false;
    try {
      final bool result = await platform.invokeMethod('getDeviceModel');
      deviceType = result;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
    setState(() {
      deviceMode = deviceType;
    });
  }
  


  @override
  void initState() {
    super.initState();
    _getvm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(deviceMode ? 'Simulator' : 'Real Device'),
          ],
        ),
      ),
    );
  }
}
