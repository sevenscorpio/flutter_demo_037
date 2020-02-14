import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('获取设备'),
                onPressed: () {
                  Navigator.pushNamed(context, "/device");
            }),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                child: Text('获取定位'),
                onPressed: () {
                  Navigator.pushNamed(context, "/location");
            }),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                child: Text('imagepicker'),
                onPressed: () {
                  Navigator.pushNamed(context, "/imagePicker");
            }),

            SizedBox(
              height: 20,
            ),
            RaisedButton(
                child: Text('video demo'),
                onPressed: () {
                  Navigator.pushNamed(context, "/video");
            }),

            SizedBox(
              height: 20,
            ),
            RaisedButton(
                child: Text('NetStatus'),
                onPressed: () {
                  Navigator.pushNamed(context, "/netStatus");
            }),

            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('本地储存'),
              onPressed: () {
                Navigator.pushNamed(context, "/storage");
              }
            ),

            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('扫码'),
              onPressed: () {
                Navigator.pushNamed(context, "/scan");
              }
            ),
          ],
        )
      ),
    );
  }
}
