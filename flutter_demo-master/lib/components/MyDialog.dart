import 'dart:async';

import 'package:flutter/material.dart';

class MyDialog extends Dialog{

  String title;
  String content;

  MyDialog({this.title = null, this.content = null});

  _showTime(context){

    var timer;
    timer = Timer.periodic(
      Duration(milliseconds: 1500),(t){
        print('执行');
        Navigator.pop(context);
        t.cancel();
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    _showTime(context);
    // TODO: implement build
    return Material(

      type: MaterialType.transparency,
      child: Center(
        child: Container(

          height: 200,
          width: 200,
          color: Colors.white,
          child: Column(

            
            children: <Widget>[

              Padding(

                padding: EdgeInsets.all(10),
                child: Stack(

                  children: <Widget>[

                    Align(
                      alignment: Alignment.topCenter,
                      child: Text('${this.title}'),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Icon(Icons.close),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )
              ),

              Divider(),

              Container(

                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Text(
                  '${this.content}',
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}