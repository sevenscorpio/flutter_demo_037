import 'package:flutter/material.dart';
import '../pages/Tabs.dart';
import '../pages/Device.dart';
import '../pages/Location.dart';
import '../pages/ImagePicker.dart';
import '../pages/ChewieVideo.dart';
import '../pages/NetStatus.dart';
import '../pages/Storage.dart';
import '../pages/Scan.dart';


// 配置路由
final routes = {
    '/' : (context) => Tabs(),
    "/device" : (context) => DevicePage(),
    "/location" : (context) => LocationPage(),
    "/imagePicker" : (context) => ImagePickerPage(),
    "/video" : (context) => VideoDemoPage(),
    "/netStatus" : (context) => NetStatusPage(),
    "/storage" : (context) => StoragePage(),
    "/scan" : (context) => ScanPage(),
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