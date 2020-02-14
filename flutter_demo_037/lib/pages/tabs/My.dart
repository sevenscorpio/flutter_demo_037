

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/Storage.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  String str = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
  }

  _getData() async{

    var str1 = await Storage.getString("name");

    setState(() {
      str = str1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的主页')
      ),
      body: Center(

        child: Column(

          children: <Widget>[

            RaisedButton(

              child: Text('获取缓存数据'),
              onPressed: _getData,
              
            ),

            SizedBox(height:20,),

            Text(str),


          ],
        )
      ),
    );
  }
}