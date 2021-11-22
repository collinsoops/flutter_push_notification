import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_push_notification/permissions.dart';
import 'package:auto_start_flutter/auto_start_flutter.dart';

import 'MyHomePage.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future<void> main() async {
  initAutoStart();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(const MyApp());
}

Future<void> initAutoStart() async {
  try {
    //check auto-start availability.
    var test = await isAutoStartAvailable;
    print(test);
    //if available then navigate to auto-start setting page.
    if (test) await getAutoStartPermission();
  } on PlatformException catch (e) {
    print(e);
  }
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        routes: {
          "permissions": (_) => Permissions(),
        },
      home:
      Scaffold(

        body: MyHomePage
          (title: 'Home',),)


    );
  }
}
