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

    await AMapLocationClient.startup(new AMapLocationOption( desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters  ));

    var location = await AMapLocationClient.getLocation(true);

    // print("经度 ${location.longitude}");

    print("经度 ${location.latitude}");

    print(location);
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