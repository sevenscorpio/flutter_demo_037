import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class GetDemo extends StatefulWidget {
  @override
  _GetDemoState createState() => _GetDemoState();
}

class _GetDemoState extends State<GetDemo> {

  // 请求数据
  _getData(){


  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('get演示界面'),
      ),

      body: Center(

        

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            RaisedButton(

              child: Text('请求数据'),
              onPressed: _getData,
            )
          ],
        ),
      )
    );
  }
}

class PostDemo extends StatefulWidget {
  @override
  _PostDemoState createState() => _PostDemoState();
}

class _PostDemoState extends State<PostDemo> {

  _postData(){


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('post演示界面'),
      ),

      body: Column(

        children: <Widget>[

          RaisedButton(

            child: Text('提交数据'),
            onPressed: _postData,
          )

        ],
      ),
    );
  }
}

class GetShowDemo extends StatefulWidget {
  @override
  _GetShowDemoState createState() => _GetShowDemoState();
}

class _GetShowDemoState extends State<GetShowDemo> {

  List _dataList = [];
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this._getData();
  }

  _getData() async{

    var apiurl = "http://a.itying.com/api/productlist";

    var responseData = await http.get(apiurl);

    if(responseData.statusCode == 200){

      // print(responseData.body);

      setState(() {
        
        this._dataList = json.decode(responseData.body)['result'];
      });

    }else{

      print("失败---${responseData.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(

        title: Text('get渲染数据演示'),
      ),

      body: this._dataList.length > 0? ListView(

        children: this._dataList.map((value){

          return ListTile(

            title: Text(value['title']),

          );
        }).toList(),

      ) : Text('加载中。。。'),
    );
  }
}