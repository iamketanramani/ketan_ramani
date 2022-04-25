import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ketan_ramani/resources/app_strings.dart';
import 'package:ketan_ramani/view/screen_listing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(),
      home: const ScreenListing(),
    );
  }
}
