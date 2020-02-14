import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class NewsContentPage extends StatefulWidget {
  Map arguments;

  NewsContentPage({Key key, this.arguments}) : super(key: key);

  @override
  _NewsContentPageState createState() => _NewsContentPageState(this.arguments);
}

class _NewsContentPageState extends State<NewsContentPage> {
  Map arguments;

  List _dataList = [];

  _NewsContentPageState(this.arguments);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getData();
  }

  _getData() async {
    var apiurl =
        "http://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${this.arguments["aid"]}";

    var response = await Dio().get(apiurl);

    setState(() {
      this._dataList = json.decode(response.data)["result"];
    });

    print(_dataList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新闻详情"),
      ),
      body: ListView(
        children: <Widget>[
          Text(
              this._dataList.length > 0 ? "${this._dataList[0]["title"]}" : ""),
          Html(
            data: """
              ${this._dataList.length > 0 ? this._dataList[0]["content"] : ""}
            """,
            //Optional parameters:
            padding: EdgeInsets.all(8.0),
            linkStyle: const TextStyle(
              color: Colors.redAccent,
              decorationColor: Colors.redAccent,
              decoration: TextDecoration.underline,
            ),
            onLinkTap: (url) {
              print("Opening $url...");
            },
            onImageTap: (src) {
              print(src);
            },
            //Must have useRichText set to false for this to work
            customRender: (node, children) {
              if (node is dom.Element) {
                switch (node.localName) {
                  case "custom_tag":
                    return Column(children: children);
                }
              }
              return null;
            },
            customTextAlign: (dom.Node node) {
              if (node is dom.Element) {
                switch (node.localName) {
                  case "p":
                    return TextAlign.justify;
                }
              }
              return null;
            },
            customTextStyle: (dom.Node node, TextStyle baseStyle) {
              if (node is dom.Element) {
                switch (node.localName) {
                  case "p":
                    return baseStyle.merge(TextStyle(height: 2, fontSize: 20));
                }
              }
              return baseStyle;
            },
          ),
        ],
      ),
    );
  }
}
