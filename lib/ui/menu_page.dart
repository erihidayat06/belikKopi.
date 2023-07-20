import 'package:flutter/material.dart';
import '../model/menu.dart';
import '../service/menu_service.dart';
import 'menu_detail.dart';
import 'menu_form.dart';
import 'menu_item.dart';
import '../widget/sidebar.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Stream<List<Menu>> getList() async* {
    List<Menu> data = await MenuService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Data Menu Minuman"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuForm()),
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
              return MenuItem(menu: snapshot.data![index]);
            },
          );
        },
      ),
    );
  }
}
