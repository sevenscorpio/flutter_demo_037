import 'package:flutter/material.dart';
import 'tabs/Home.dart';
import 'tabs/Category.dart';
import 'tabs/Setting.dart';

class Tabs extends StatefulWidget {

  final index;

  Tabs({Key key, this.index = 0}) : super(key : key);

  @override
  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {

  int _currentIndex = 0;

  _TabsState(index){
    this._currentIndex = index;
  }

  List _pageList = [
    Home(),
    Category(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(

          currentIndex: _currentIndex,
          onTap: (int index){
            setState(() {
              this._currentIndex = index;
            });
          },

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('分类'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('设置'),
            ),
          ],
        ),

        drawer: Drawer(

          child: Column(

            children: <Widget>[

              Row(

                children: <Widget>[

                  Expanded(
                    child: UserAccountsDrawerHeader(

                      accountName: Text('飘过人间'),
                      accountEmail: Text('yangzhen@163.com'),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage('https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1921831366,1925603054&fm=11&gp=0.jpg'),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1579678726491&di=d8ec97d53c65b57e16e4ac893ab45c5d&imgtype=0&src=http%3A%2F%2Fimages.ali213.net%2Fpicfile%2Fpic%2F2013%2F06%2F09%2F927_ttt15.jpg'),
                          fit: BoxFit.cover,
                        )
                      ),
                      otherAccountsPictures: <Widget>[
                        Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1579678726491&di=d8ec97d53c65b57e16e4ac893ab45c5d&imgtype=0&src=http%3A%2F%2Fimages.ali213.net%2Fpicfile%2Fpic%2F2013%2F06%2F09%2F927_ttt15.jpg'),
                        Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1579678726491&di=d8ec97d53c65b57e16e4ac893ab45c5d&imgtype=0&src=http%3A%2F%2Fimages.ali213.net%2Fpicfile%2Fpic%2F2013%2F06%2F09%2F927_ttt15.jpg'),
                      ],
                    ),
                  )
                ],
              ),

              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.home),
                ),
                title: Text('我的空间'),
              ),

              Divider(),

              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.people),
                ),
                title: Text('用户中心'),
                onTap: (){

                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/users');
                },
              ),

              Divider(),

              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.settings),
                ),
                title: Text('设置'),
              )
            ],
          ),
        ),

        endDrawer: Drawer(

          child: Text('右侧侧边栏'),
        ),
      );
  }
}

