import 'package:flutter/material.dart';

import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import '../components/LoadingWidget.dart';


class NewsContentPage extends StatefulWidget {
  Map arguments;

  NewsContentPage({Key key, this.arguments}) : super(key: key);

  @override
  _NewsContentPageState createState() => _NewsContentPageState(this.arguments);
}

class _NewsContentPageState extends State<NewsContentPage> {

  Map arguments;

  List _dataList = [];

  bool _flag = true;

  _NewsContentPageState(this.arguments);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(this.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新闻详情"),
      ),
      body: Column(

        children: <Widget>[

          this._flag? LoadingWidget() : Text(''),

          Expanded(

            child: InAppWebView(


              initialUrl: "http://www.phonegap100.com/newscontent.php?aid=${this.arguments["aid"]}",
              onProgressChanged: (InAppWebViewController controller, int progress) {

                print(progress / 100);
                setState(() {
                  if((progress / 100) > 0.999){

                    this._flag = false;
                  }
                });
              },
            )
          )
        ]
      )
    );
  }
}
