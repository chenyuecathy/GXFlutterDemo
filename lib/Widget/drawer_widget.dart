import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {

  const DrawerWidget({Key key}) : super(key: key);

  static Widget _drawerHeader() {
    return new UserAccountsDrawerHeader(
//      margin: EdgeInsets.zero,
      accountName: new Text(
        "SuperLuo",
        style: TextStyle(color: Colors.white, fontSize: 15.0),
      ),
      accountEmail: new Text(
        "super_luo@163.com",
        style: TextStyle(color: Colors.white, fontSize: 15.0),
      ),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: new AssetImage("images/ymj_jiayou.gif"),
      ),
      onDetailsPressed: () {},
      otherAccountsPictures: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage("images/ymj_shuijiao.gif"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(),
      children: <Widget>[
        _drawerHeader(),
        
        new ClipRect(
          child: new ListTile(
            leading: new CircleAvatar(child: new Text("A")),
            title: new Text('Drawer item A'),
            onTap: () => {},
          ),
        ),
        new ListTile(
          leading: new CircleAvatar(child: new Text("B")),
          title: new Text('Drawer item B'),
          subtitle: new Text("Drawer item B subtitle"),
          onTap: () => {},
        ),
        new AboutListTile(
          icon: new CircleAvatar(child: new Text("Ab")),
          child: new Text("About"),
          applicationName: "Test",
          applicationVersion: "1.0",
          applicationIcon: new Image.asset(
            "images/ymj_jiayou.gif",
            width: 64.0,
            height: 64.0,
          ),
          applicationLegalese: "applicationLegalese",
          aboutBoxChildren: <Widget>[
            new Text("BoxChildren"),
            new Text("box child 2")
          ],
        ),
      ],
    );
  }
}
