import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DiologDemoPage extends StatefulWidget {
  @override
  _DiologDemoPageState createState() => _DiologDemoPageState();
}

class _DiologDemoPageState extends State<DiologDemoPage> {
  _alertDiolog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示信息'),
            content: Text('确认删除？'),
            actions: <Widget>[
              FlatButton(
                child: Text('确定'),
                onPressed: () {
                  print('确定');
                  Navigator.pop(context, 'Ok');
                },
              ),
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  print('取消');
                  Navigator.pop(context, 'Cancle');
                },
              )
            ],
          );
        });

    print(result);
  }

  _simpleDiolog() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('选择内容'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Option A'),
                onPressed: () {
                  print('A');
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: Text('Option B'),
                onPressed: () {
                  print('B');
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: Text('Option C'),
                onPressed: () {
                  print('C');
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: Text('Option D'),
                onPressed: () {
                  print('D');
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  _modalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('微信'),
                onTap: () {},
              ),
              ListTile(
                title: Text('支付宝'),
                onTap: () {},
              ),
              ListTile(
                title: Text('其他'),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  _toast() {
    Fluttertoast.showToast(
      msg: "给我一个理由忘记",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Diolog演示界面'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('alert弹出框-AlertDiolog'),
              onPressed: _alertDiolog,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('simpleDiolog弹出框-simpleDiolog'),
              onPressed: _simpleDiolog,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('ActionSheet底部弹出框-showModalBottomSheet'),
              onPressed: _modalBottomSheet,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('toast-fluttertoast第三方库'),
              onPressed: _toast,
            ),
          ],
        ),
      ),
    );
  }
}
