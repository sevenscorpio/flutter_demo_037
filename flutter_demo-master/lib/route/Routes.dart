import 'package:flutter/material.dart';
import '../pages/Tabs.dart';
import '../pages/DatePicker.dart';
import '../pages/DiologDemo.dart';
import '../pages/HttpDemo.dart';


// 配置路由
final routes = {
    '/' : (context) => Tabs(),
    '/dateDemo' : (context) => DatePickerPage(),
    '/diolog' : (context) => DiologDemoPage(),
    '/get' : (context) => GetDemo(),
    '/post' : (context) => PostDemo(),
    '/getShow' : (context) => GetShowDemo(),

  };

// 固定写法
var onGenerateRoute = (RouteSettings settings){
        
        // 统一处理
        final String name = settings.name;
        final Function pageContentBuild = routes[name];
        if(pageContentBuild != null){

          if(settings.arguments != null){

            final Route route = MaterialPageRoute(

              builder: (context) => pageContentBuild(context, arguments: settings.arguments)
            );

            return route;
          }else{

            final Route route = MaterialPageRoute(
              builder: (context) => pageContentBuild(context)
            );

            return route;
          }
        }
      };