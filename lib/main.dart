import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meditation/pages/choose_topic_page.dart';
import 'package:meditation/utils/themes.dart';
import 'pages/home_page.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditation',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: kColorPrimary),
      initialRoute: '$GetStartedPage',
      routes: {
        '$GetStartedPage': (_) => const GetStartedPage(),
        '$ChooseTopicPage': (_) => const ChooseTopicPage(),
      },
    );
  }
}
