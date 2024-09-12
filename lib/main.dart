import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospitalnew/CONTROLLER/controller.dart';
import 'package:hospitalnew/SCREEN/splashScreen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:async';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight,
  ]);
  requestPermission();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Controller()),
    ],
    child: MyApp(),
  ));
}

// void requestPermission() async {
//   print("req");
//   var status = await Permission.storage.status;
//   // var statusbl= await Permission.bluetooth.status;
//   var status1 = await Permission.manageExternalStorage.status;
//   if (!status1.isGranted) {
//     await Permission.storage.request();
//   }
//   if (!status1.isGranted) {
//     var status = await Permission.manageExternalStorage.request();
//     if (status.isGranted) {
//       await Permission.bluetooth.request();
//     } else {
//       openAppSettings();
//     }
//     // await Permission.app
//   }
//   if (!status1.isRestricted) {
//     await Permission.manageExternalStorage.request();
//   }
//   if (!status1.isPermanentlyDenied) {
//     await Permission.manageExternalStorage.request();
//   }
//   print("req granted");
// }

void requestPermission() async {
  var sta = await Permission.storage.request();
  var status = Platform.isIOS
      ? await Permission.photos.request()
      : await Permission.manageExternalStorage.request();
  if (status.isGranted) {
    await Permission.manageExternalStorage.request();
  } else if (status.isDenied) {
    await Permission.manageExternalStorage.request();
  } else if (status.isRestricted) {
    await Permission.manageExternalStorage.request();
  } else if (status.isPermanentlyDenied) {
    await Permission.manageExternalStorage.request();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      home: SplashScreen(),
    );
  }
}
