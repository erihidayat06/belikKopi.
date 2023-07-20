import 'package:menu/model/menu.dart';
import 'package:flutter/material.dart';
import '../model/menu.dart';
import 'menu_detail.dart';

class MenuItem extends StatelessWidget {
  final Menu menu;
  const MenuItem({super.key, required this.menu});
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
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MenuDetail(menu: menu)));
      },
    );
  }
}
