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

              child: Text('新闻列表'),
              onPressed: (){
                
                Navigator.pushNamed(context, '/news');
              }
              
            )
          ],
        )
      ),
    );
  }
}