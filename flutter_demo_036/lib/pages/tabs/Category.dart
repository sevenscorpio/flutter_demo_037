import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的分类')
      ),
      body: Center(

        child: Column(

          children: <Widget>[

            RaisedButton(

              child: Text(''),
              onPressed: (){
                
              }
              
            )
          ],
        )
      ),
    );
  }
}