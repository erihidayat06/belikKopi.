import 'package:flutter/material.dart';
import '../model/menu.dart';
import '../service/menu_service.dart';
import 'menu_detail.dart';

class MenuUpdateForm extends StatefulWidget {
  final Menu menu;
  const MenuUpdateForm({Key? key, required this.menu}) : super(key: key);
  _MenuUpdateFormState createState() => _MenuUpdateFormState();
}

class _MenuUpdateFormState extends State<MenuUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaMenuCtrl = TextEditingController();
  final _hargaCtrl = TextEditingController();
  final _kategoriCtrl = TextEditingController();

  Future<Menu> getData() async {
    Menu data = await MenuService().getById(widget.menu.id.toString());
    setState(() {
      _namaMenuCtrl.text = data.namaMenu;
    });

    setState(() {
      _hargaCtrl.text = data.harga;
    });

    setState(() {
      _kategoriCtrl.text = data.kategori;
    });

    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Menu Minuman"),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaMenu(),
              _fieldHarga(),
              _fieldKategori(),
              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaMenu() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Menu"),
      controller: _namaMenuCtrl,
    );
  }

  _fieldHarga() {
    return TextField(
      decoration: const InputDecoration(labelText: "Harga"),
      controller: _hargaCtrl,
    );
  }

  _fieldKategori() {
    return TextField(
      decoration: const InputDecoration(labelText: "Kategori"),
      enabled: false,
      controller: _kategoriCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Menu menu = new Menu(
              namaMenu: _namaMenuCtrl.text,
              harga: _hargaCtrl.text,
              kategori: _kategoriCtrl.text);
          String id = widget.menu.id.toString();
          await MenuService().ubah(menu, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MenuDetail(menu: value)));
          });
        },
        child: const Text("Simpan Perubahan"));
  }
}
