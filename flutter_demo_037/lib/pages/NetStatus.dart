import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class NetStatusPage extends StatefulWidget {
  @override
  _NetStatusPageState createState() => _NetStatusPageState();
}

class _NetStatusPageState extends State<NetStatusPage> {

  var subscription;

  String _netstatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    // Got a new connectivity status!

      if (result == ConnectivityResult.wifi) {
        setState(() {
          _netstatus = "当前网络环境为wifi";
        });
      }else if (result == ConnectivityResult.mobile) {
        setState(() {
          _netstatus = "当前网络环境为移动网络";
        });
      }else{
        setState(() {
          _netstatus = "当前没有网络";
        });
      }
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    subscription.cancel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络环境"),
      ),
      body: Center(
        child: Text(_netstatus),
      ),
    );
  }
}