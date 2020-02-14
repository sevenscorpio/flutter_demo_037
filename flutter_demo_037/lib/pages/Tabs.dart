import 'package:flutter/material.dart';
import 'tabs/Home.dart';
import 'tabs/Category.dart';
import 'tabs/My.dart';

class Tabs extends StatefulWidget {

  final index;

  Tabs({Key key, this.index = 0}) : super(key : key);

  @override
  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {

  int _currentIndex = 0;

  _TabsState(index){
    _currentIndex = index;
  }

  List _pageList = [
    
    HomePage(),
    CategoryPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: (int index){

          setState(() {
            _currentIndex = index;
          });
        },

        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('分类'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('我的'),
          ),
        ],
      ),
    );
  }
}