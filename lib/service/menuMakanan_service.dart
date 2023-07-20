import 'package:menu/model/menu.dart';
import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/menu.dart';

class MakananService {
  Future<List<Menu>> listData() async {
    final Response response = await ApiClient().get('menu');
    final List data = response.data as List;
    List<Menu> result = data
        .where((e) => e["kategori"] == "makanan")
        .map((json) => Menu.fromJson(json))
        .toList();
    return result;
  }

  Future<Menu> simpan(Menu poli) async {
    var data = poli.toJson();
    final Response response = await ApiClient().post('menu', data);
    Menu result = Menu.fromJson(response.data);
    return result;
  }

  Future<Menu> ubah(Menu menu, String id) async {
    var data = menu.toJson();
    final Response response = await ApiClient().put('menu/${id}', data);
    print(response);
    Menu result = Menu.fromJson(response.data);
    return result;
  }

  Future<Menu> getById(String id) async {
    final Response response = await ApiClient().get('menu/${id}');
    Menu result = Menu.fromJson(response.data);
    return result;
  }

  Future<Menu> hapus(Menu menu) async {
    final Response response = await ApiClient().delete('menu/${menu.id}');
    Menu result = Menu.fromJson(response.data);
    return result;
  }
}
