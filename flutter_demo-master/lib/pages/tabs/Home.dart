import 'dart:convert';

import 'package:flutter/material.dart';
import '../../components/MyDialog.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Map userinfo = {

    //   "username" : "张三",
    //   "age" : 20,
    // };

    // print(json.encode(userinfo)); // map转换成json字符串

    // var a = json.encode(userinfo);

    // print(a is Map);

    // print(a is String);
  }

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[

        RaisedButton(

          child: Text('跳转到date测试页面'),
          onPressed: (){

            Navigator.pushNamed(context, '/dateDemo');
          },
        ),

        SizedBox(height: 20,),

        RaisedButton(

          child: Text('跳转到Diolog演示页面'),
          onPressed: (){

            Navigator.pushNamed(context, '/diolog');
          },
        ),

        SizedBox(height: 20,),

        RaisedButton(

          child: Text('自定义dialog演示'),
          onPressed: (){

            showDialog(
              context: context,
              builder: (context){
                return MyDialog(title: '关于我们', content: '这是文本');
              }
            );
          },
        ),

        SizedBox(height: 20,),

        RaisedButton(

          child: Text('get请求'),
          onPressed: (){

            Navigator.pushNamed(context, '/get');
          },
        ),

        SizedBox(height: 20,),

        RaisedButton(

          child: Text('post请求'),
          onPressed: (){

            Navigator.pushNamed(context, '/post');
          },
        ),

        SizedBox(height: 20,),

        RaisedButton(

          child: Text('get请求，渲染数据演示'),
          onPressed: (){

            Navigator.pushNamed(context, '/getShow');
          },
        ),

      ],
    );
  }
}