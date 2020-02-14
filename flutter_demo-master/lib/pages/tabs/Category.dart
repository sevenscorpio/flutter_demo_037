import 'package:flutter/material.dart';


class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  String title = '表单';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 2,

      child: Scaffold(

        appBar: AppBar(

          title: Row(

            children: <Widget>[

              Expanded(

                child: TabBar(

                  isScrollable: true,
                  indicatorColor: Colors.yellow,
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,

                  tabs: <Widget>[

                    Tab(
                      text: '热销',
                    ),

                    Tab(
                      text: '推荐',
                    ),
                  ],
                ),
              )
            ],
          ),

       
        ),

        body: TabBarView(

          children: <Widget>[

            ListView(

              children: <Widget>[

                ListTile(
                  title: Text('第一个tab'),
                ),
                ListTile(
                  title: Text('第一个tab'),
                ),
                
              ],
            ),

            ListView(

              children: <Widget>[

                ListTile(
                  title: Text('第二个tab'),
                ),
                ListTile(
                  title: Text('第二个tab'),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}