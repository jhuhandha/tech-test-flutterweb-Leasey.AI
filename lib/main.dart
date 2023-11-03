import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtest/providers/property.dart';

import 'package:webtest/views/home_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PropertyModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MI Casa SAS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
