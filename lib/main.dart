import 'package:dars_demo/di.dart';
import 'package:dars_demo/pages/home/home_page.dart';
import 'package:dars_demo/pages/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: "/",
      routes: {
        "/": (context) {
          return ChangeNotifierProvider(
            create: (context) => HomeProvider(di.get()),
            builder: (context, child) => const HomePage(),
          );
        },
      },
    );
  }
}
