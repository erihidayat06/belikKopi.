import 'package:flutter/material.dart';
import 'package:menu/ui/menuMakanan_page.dart';
import '../ui/beranda.dart';
import '../ui/login.dart';
import '../ui/menu_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              accountName: Text("Kelompok 2"),
              accountEmail: Text("kelompok2@admin.com")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Beranda"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: Icon(Icons.coffee),
            title: Text("Minuman"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MenuPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text("Makanan"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuMakananPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}
