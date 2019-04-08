import 'package:flutter/cupertino.dart';
import 'package:capturefacturas/pages/Cargar/UpLoadImage.dart';
import 'package:flutter/material.dart';
import 'package:capturefacturas/main.dart';
import 'package:capturefacturas/pages/Inicio/Tabs/Image.dart' as _firstTab;
import 'package:capturefacturas/pages/Inicio/Tabs/profile.dart' as _secondTab;

class PrincipalPage extends StatefulWidget {

  _PrincipalState createState() => _PrincipalState();

}

class _PrincipalState extends State<PrincipalPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body:UpLoadImage(),
      body: Tabs(),


    );
  }

}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> {

  PageController _tabController;

  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    this._title_app = TabItems[0].title;
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
    appBar: new AppBar(
      actions: <Widget>[
        IconButton(
          iconSize: 40,
          icon: Icon(Icons.image),
          tooltip: 'Lista de Gasolineras',
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => UpLoadImage()),
            );
          },
        ),
      ],
      title: new Text(
        _title_app,
        style: new TextStyle(
          fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
          color: Colors.white,
        ),
      ),

      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      backgroundColor: PrimaryColor,

    ),

    //Content of tabs
    body: new PageView(
      controller: _tabController,
      onPageChanged: onTabChanged,
      children: <Widget>[
        new _firstTab.Imagenes(),
        new _secondTab.Profile(),
      ],
    ),

    //Tabs
    bottomNavigationBar: Theme.of(context).platform == TargetPlatform.iOS ?
    new CupertinoTabBar(
      activeColor: Colors.blueGrey,
      currentIndex: _tab,
      onTap: onTap,
      items: TabItems.map((TabItem) {
        return new BottomNavigationBarItem(
          title: new Text(TabItem.title),
          icon: new Icon(TabItem.icon),
        );
      }).toList(),
    ):
    new BottomNavigationBar(
      fixedColor: PrimaryColor,
      currentIndex: _tab,
      onTap: onTap,
      items: TabItems.map((TabItem) {
        return new BottomNavigationBarItem(backgroundColor: PrimaryColor,
          title: new Text(TabItem.title),
          icon: new Icon(TabItem.icon),
        );
      }).toList(),
    ),

  );

  void onTap(int tab){
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState((){
      this._tab = tab;
    });

    switch (tab) {
      case 0:
        this._title_app = TabItems[0].title;
        break;

      case 1:
        this._title_app = TabItems[1].title;
        break;
    }
  }
}

class TabItem {
  const TabItem({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Imagenes', icon: Icons.dashboard),
  const TabItem(title: 'Perfil', icon: Icons.account_circle)
];