import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  int _page = 1;

  List _dataList = [];

  bool hasMore = true;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this._getData();

    // 监听滚动条时间
    _scrollController.addListener((){
      // print(_scrollController.position.pixels); // 获取滚动条下拉的距离

      // print(_scrollController.position.maxScrollExtent);  // 获取整个页面的高度

      if(_scrollController.position.pixels > (_scrollController.position.maxScrollExtent - 40)){

        _getData();
      }

    });
  }

  _getData() async{

    if(hasMore){

      var apiUrl = 'http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${this._page}';

      var response = await Dio().get(apiUrl);

      var res = json.decode(response.data)['result'];

      setState(() {
        
        _dataList.addAll(res);
        

        // 判断是否是最后一页
        if(res.length < 20){

          hasMore = false;
        }else{

          _page ++;
        }
      });
    }
  }

  // 下拉刷新
  Future<void> _onRefresh() async{

    print("下拉刷新");

    await Future.delayed(Duration(milliseconds: 2000), (){

      print("请求数据成功");
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新闻列表')
      ),
      body: this._dataList.length > 0? RefreshIndicator(
        
        onRefresh: _onRefresh,

        child: ListView.builder(

          controller: _scrollController,

          itemCount: this._dataList.length,
          itemBuilder: (context, index){

            if(index == (this._dataList.length - 1)){

              return Column(

                children: <Widget>[

                  ListTile(

                    title: Text("${this._dataList[index]["title"]}", maxLines: 1,),
                    onTap: (){

                      Navigator.pushNamed(context, "/newsContent", arguments: {
                        "aid":this._dataList[index]["aid"]
                      });
                    },
                  ),

                  Divider(),

                  _getMoreWidget(),

                ],
              );
            }else{

              return Column(

                children: <Widget>[

                  ListTile(

                    title: Text("${this._dataList[index]["title"]}", maxLines: 1,),
                    onTap: (){

                      Navigator.pushNamed(context, "/newsContent", arguments: {
                        "aid":this._dataList[index]["aid"]
                      });
                    },
                  ),

                  Divider(),

                ],
              );
            }
          },
        ), 
      ) : _getMoreWidget(),
    );
  }

//加载中的圈圈
  Widget _getMoreWidget() {

    if(hasMore){
      return Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '加载中...',
                style: TextStyle(fontSize: 16.0),
              ),
              CircularProgressIndicator(
                strokeWidth: 1.0,
              )
            ],
          ),
        ),
      );
    }else{
       return Center(
         child: Text("--我是有底线的--"),
       );
    }
  }

}