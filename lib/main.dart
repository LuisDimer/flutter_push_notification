import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterpushnotification/services/Launcher.service.dart';
import 'modules/dialog-box/dialog-box.service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  final DialogBoxService _dialogBoxService = DialogBoxService();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _notificationListener();
  }


  void _notificationListener() {
    
    final _handler = (Map<String, dynamic> response) async {
      final title = response['notification']['title'];
      final link = response['data']['url'];

      if (response['data']['url'] != null) {
        LauncherService.launchWebView(context, title, link);
      }
    };

    final _onMessageHandler = (Map<String, dynamic> response) async {
      final title = response['notification']['title'];
      final subtitle = response['notification']['body'];
      final content = ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      );

      _dialogBoxService.openDialogBoxNotification(context, content, response);
    };

    //final _backgroundMessageHandler = (Map<String, dynamic> response) {
    //  if (response.containsKey('data')) {
    //    final dynamic data = response['data'];
    //  }
    //  if (response.containsKey('notification')) {
    //    final dynamic notification = response['notification'];
    // }
    //};


    _fcm.configure(
      onMessage: _onMessageHandler,
      //onBackgroundMessage: _backgroundMessageHandler,
      onLaunch: _handler,
      onResume: _handler,
    );
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}