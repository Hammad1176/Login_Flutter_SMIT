// ignore_for_file: non_constant_identifier_names

class FruitDetail {
  String fruit_name;
  String Url;

  FruitDetail({required this.fruit_name, required  this.Url });

  String getFruitName() {
    return fruit_name;
  }

  String getUrl() {
    return Url;
  }

  static List<FruitDetail> listDetails = [
    FruitDetail(
        fruit_name: "Apple",
        Url:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Red_Apple.jpg/661px-Red_Apple.jpg'),
    FruitDetail(
        fruit_name: "Banana",
        Url:
            'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg'),
    FruitDetail(
        fruit_name: "Mango",
        Url:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg'),
    FruitDetail(
        fruit_name: "Oragne",
        Url:
            'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg'),
    FruitDetail(
        fruit_name: "Pine Apple",
        Url:
            'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'),
  ];
}
