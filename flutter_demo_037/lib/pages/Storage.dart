import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoragePage extends StatefulWidget {
  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {

  _saveData() async{

    SharedPreferences sp =  await SharedPreferences.getInstance();

    sp.setString("name", "张三");

  }

  _getData() {


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("本地缓存"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

            RaisedButton(
              child: Text("保存数据"),
              onPressed: _saveData,
            ),

            SizedBox(height: 20,),

            RaisedButton(
              child: Text("读取数据"),
              onPressed: _getData,
            ),

          ],
        )
      ),
    );
  }
}