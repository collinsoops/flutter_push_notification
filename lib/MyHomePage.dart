
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notification/services/local_notification.dart';

import 'folders/message.dart';
import 'permissions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  @override
  late  RemoteMessage rmessage;
  void initState() {
    super.initState();
    LocalNotificationService.initialize(context);
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if(message !=null){
        final routeFromMessage= message.data["route"];
        Navigator.of(context).pushNamed(routeFromMessage);
        LocalNotificationService.display(message);
      }
      print('The message received had no route');
    });
    //foreground
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification != null){
        print(message.notification!.body);
        print(message.notification!.title);
        LocalNotificationService.display(message);



      }
    });
    //Notification opened when the app is opened
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage= message.data["route"];
      print(routeFromMessage);
      Navigator.of(context).pushNamed(routeFromMessage);
      }
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            FloatingActionButton(onPressed: (){MessageArguments(rmessage,true);})

          ],
        ),
      ),

    );
  }

}
