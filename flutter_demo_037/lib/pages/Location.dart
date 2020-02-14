import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getLocation();
  }

  _getLocation() async{

    //先启动一下
    await AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));

    //直接获取定位
    var result = await AMapLocationClient.getLocation(true);
    print("""
    经度：${result.longitude}
    纬度：${result.latitude}
    """);

    //监听定位
    AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
      if (!mounted) return;
      setState(() {
        print("""
    经度：${result.longitude}
    纬度：${result.latitude}
    """);
      });
    });
    AMapLocationClient.startLocation();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('获取设备定位'),
      ),
      body: Container(

        
      ),
    );
  }
}