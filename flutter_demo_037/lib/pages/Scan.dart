import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo_camera),
        onPressed: (){

        },
      ),
      appBar: AppBar(
        title: Text("扫码"),
      ),
      body: Center(

        
      ),
    );
  }
}