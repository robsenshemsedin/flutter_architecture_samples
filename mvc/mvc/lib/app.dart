import 'package:flutter/material.dart';

import 'package:mvc/screens/home.dart';

class App extends StatelessWidget {
  ///Rename the app to MVCApp and extend AppMVC
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
