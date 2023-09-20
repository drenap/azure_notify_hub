import 'package:azure_notify_hub/azure_notify_hub.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  AzureNotificationhubsFlutter? _anh;

  @override
  void initState() {
    super.initState();
    _anh?.configure(
      onMessage: (Map<String, dynamic> message) async {
        if (kDebugMode) {
          print("onMessage: $message");
        }
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
            title: Text(message['notification']['title']),
            subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }, 
      onResume: (Map<String, dynamic> message)async {
        if (kDebugMode) {
          print("onResume: $message");
        }
        }, 
      onLaunch: (Map<String, dynamic> message)async { 
        if (kDebugMode) {
          print("onLaunch: $message");
        }
       }, 
      onToken: (String token)async { 
        if (kDebugMode) {
          print("onToken: $token");
        }
       }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Text('Running'),
        ),
      ),
    );
  }
}
