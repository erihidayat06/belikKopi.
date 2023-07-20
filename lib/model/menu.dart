class Menu {
  String? id;
  String namaMenu;
  String harga;
  String kategori;
  Menu(
      {this.id,
      required this.namaMenu,
      required this.harga,
      required this.kategori});
  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
      id: json["id"],
      namaMenu: json["menu"],
      harga: json["harga"],
      kategori: json["kategori"]);

  Map<String, dynamic> toJson() =>
      {"menu": namaMenu, "harga": harga, "kategori": kategori};
}
