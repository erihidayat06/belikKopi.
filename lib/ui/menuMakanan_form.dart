import 'package:flutter/material.dart';
import '../model/menu.dart';
import '../service/menu_service.dart';
import 'menu_detail.dart';

class MenuMakananForm extends StatefulWidget {
  const MenuMakananForm({Key? key}) : super(key: key);

  @override
  _MenuMakananFormState createState() => _MenuMakananFormState();
}

class _MenuMakananFormState extends State<MenuMakananForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaMenuCtrl = TextEditingController();
  final _hargaCtrl = TextEditingController();
  final _kategoriCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Menu Makanan"),
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

  Widget _fieldNamaMenu() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Menu"),
      controller: _namaMenuCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nama Poli tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _fieldHarga() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Harga"),
      controller: _hargaCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nama Poli tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _fieldKategori() {
    setState(() {
      _kategoriCtrl.text = "makanan";
    });
    return TextFormField(
      enabled: false,
      decoration: const InputDecoration(labelText: "Kategori"),
      controller: _kategoriCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nama Poli tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          Menu menu = Menu(
              namaMenu: _namaMenuCtrl.text,
              harga: _hargaCtrl.text,
              kategori: _kategoriCtrl.text);
          await MenuService().simpan(menu).then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MenuDetail(menu: value)),
            );
          });
        }
      },
      child: const Text("Simpan"),
    );
  }
}
