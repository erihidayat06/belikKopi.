import 'package:menu/model/menu.dart';
import 'package:flutter/material.dart';
import 'package:menu/ui/menuMakanan_detail.dart';
import '../model/menu.dart';
import 'menu_detail.dart';

class MenuMakananItem extends StatelessWidget {
  final Menu menu;
  const MenuMakananItem({super.key, required this.menu});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
          child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Table(
                children: [
                  TableRow(children: [
                    Container(
                      child: Text(
                        "${menu.namaMenu}",
                      ),
                    ),
                    Container(
                      child: Text(
                        "${menu.harga}",
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ]),
                ],
              )),
        ],
      )),

      // ListTile(
      //     title: Text("${menu.namaMenu}"),
      //   ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MenuDetailMakanan(menu: menu)));
      },
    );
  }
}
