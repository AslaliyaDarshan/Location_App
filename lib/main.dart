import 'package:flutter/material.dart';
import 'package:permissions_app/provider/provider.dart';
import 'package:permissions_app/view/homeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
      },
    ),
  ));
}
