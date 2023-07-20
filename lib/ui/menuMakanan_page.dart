import 'package:flutter/material.dart';
import 'package:menu/service/menuMakanan_service.dart';
import 'package:menu/ui/menuMakanan_form.dart';
import 'package:menu/ui/menuMakanan_item.dart';
import '../model/menu.dart';
import '../service/menu_service.dart';
import 'menu_detail.dart';
import 'menu_form.dart';
import 'menu_item.dart';
import '../widget/sidebar.dart';

class MenuMakananPage extends StatefulWidget {
  const MenuMakananPage({Key? key}) : super(key: key);

  @override
  _MenuMakananPageState createState() => _MenuMakananPageState();
}

class _MenuMakananPageState extends State<MenuMakananPage> {
  Stream<List<Menu>> getList() async* {
    List<Menu> data = await MakananService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Data Menu Makanan"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuMakananForm()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Menu>>(
        stream: getList(),
        builder: (context, AsyncSnapshot<List<Menu>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Kosong');
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return MenuMakananItem(menu: snapshot.data![index]);
            },
          );
        },
      ),
    );
  }
}
