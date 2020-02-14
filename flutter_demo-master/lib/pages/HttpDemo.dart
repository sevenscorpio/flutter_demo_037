import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

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

  var item;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this._getData();
  }

  _getData() async{

    var apiurl = "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1";

    Response responseData = await Dio().get(apiurl);

    setState(() {
      
      _dataList = json.decode(responseData.data)['result'];
    });

    print(_dataList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(

        title: Text('get渲染数据演示'),
      ),

      body: this._dataList.length > 0? ListView.builder(

        itemCount: this._dataList.length,
        itemBuilder: (context, index){
          return ListTile(

             title: Text('${this._dataList[index]['title']}'),

          );
        },
      ) : Text('加载中。。。'),
    );
  }
}