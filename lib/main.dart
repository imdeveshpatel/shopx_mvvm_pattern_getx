import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopx_mvvm_pattern/view/screen/homepage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
