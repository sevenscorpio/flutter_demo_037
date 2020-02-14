import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页')
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            RaisedButton(

              child: Text('获取设备'),
              onPressed: (){
                
                Navigator.pushNamed(context, "/device");
              }
              
            ),

            SizedBox(height:20,),

            RaisedButton(

            child: Text('获取定位'),
            onPressed: (){
              
              Navigator.pushNamed(context, "/location");
            }
              
            )
          ],
        )
      ),
    );
  }
}