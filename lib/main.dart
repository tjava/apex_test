import 'package:flutter/material.dart';
import 'package:apex_test/locator/locate.dart';
import 'package:apex_test/main_apex_test.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MainApexTest());
}
