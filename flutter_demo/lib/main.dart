import 'package:flutter/material.dart';
import 'route/Routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false, // 去掉debug图标

      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}