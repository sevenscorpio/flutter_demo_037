import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

class DevicePage extends StatefulWidget {
  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getDevice();
  }

  _getDevice() async{

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.androidId}');  // e.g. "Moto G (4)"

    // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    // print('Running on ${iosInfo.utsname.machine}');  // e.g. "iPod7,1"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('获取设备信息'),
      ),
      body: Container(

        child: Text(''),
      ),
    );
  }
}