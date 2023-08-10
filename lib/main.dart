import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomato_timer/model/data_model.dart';
import 'package:tomato_timer/screens/setting_page.dart';

import 'screens/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create:(_) => DataModel(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => HomePage(),
        '/setting': (context) => SettingPage(),
      },
    );
  }
}
