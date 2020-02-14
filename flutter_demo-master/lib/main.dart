import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'route/Routes.dart';



void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [

        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      supportedLocales: [

        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],

      debugShowCheckedModeBanner: false,  // 去掉debug图标


      initialRoute: '/',  // 初始化时加载的路由
      onGenerateRoute: onGenerateRoute
    );
  }
}