class BuissnesList {
  int id;
  String name;
  double price;
  String image;
  int quantity;
  double total;

  BuissnesList(
      {required this.name,
      required this.price,
      this.quantity = 1,
      this.total =0,
      required this.id,
      required this.image});

  static List<List<BuissnesList>> productList = [
    [
      //Shirts
      BuissnesList(
          name: "Shirts",
          price: 100,
          id: 1,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/1c9db5bb0b1c00b3cdb7aaca28863984.png_200x200q80.png_.webp"),
      BuissnesList(
          name: "Shirts",
          price: 123,
          id: 2,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/f021caad4870f43915ba678b0fbe0393.jpg_200x200q80.jpg_.webp"),
      BuissnesList(
          name: "Shirts",
          price: 123,
          id: 3,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/5bb21ff41d7115c84d8013a5024220b8.jpg_200x200q80.jpg_.webp"),
      BuissnesList(
          name: "Shirts",
          price: 123,
          id: 4,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/77b61e824d363ff3112d606b96e2b9d9.jpg_200x200q80.jpg_.webp"),
      BuissnesList(
          name: "Shirts",
          price: 123,
          id: 5,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/510e6efc952ff7b075841cd6687a12a6.jpg_200x200q80.jpg_.webp"),
    ],
    [
      //T shirt
      BuissnesList(
          name: "T shirt",
          price: 1109,
          id: 1,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/4083ae58c865edcdb13c7e78740013a8.jpg_200x200q80.jpg_.webp"),
      BuissnesList(
          name: "T shirt",
          price: 1109,
          id: 2,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/6b081f1ec311c6bbe14bb76860211424.jpg_200x200q80.jpg_.webp"),
      BuissnesList(
          name: "T shirt",
          price: 1109,
          id: 3,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/8074c31283c959ff3606cca47b413bc5.png_200x200q80.png_.webp"),

      BuissnesList(
          name: "T shirt",
          price: 1109,
          id: 4,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/111191dbd424c69525539587e8f3987a.jpg_200x200q80.jpg_.webp"),
      BuissnesList(
          name: "T shirt",
          price: 1109,
          id: 5,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/87cf7be8c312783307af11b4f02737a8.png_200x200q80.png_.webp"),
      BuissnesList(
          name: "T shirt",
          price: 1109,
          id: 6,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/b76b45ce61ed0e1fcee088b150d31acd.jpg_200x200q80.jpg_.webp"),
      BuissnesList(
          name: "T shirt",
          price: 1109,
          id: 7,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/01dc9543dd488dcde02927b85b270341.jpg_200x200q80.jpg_.webp"),
    ],
    [
      //pent

      BuissnesList(
          name: "Pent",
          price: 1109,
          id: 1,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/53d794ea52035ebaa1940693cc399f32.jpg_200x200q80.jpg_.webp"),

      BuissnesList(
          name: "Pent",
          price: 701,
          id: 2,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/f1eb9cba102c049cb39ad9a73703d451.jpg_200x200q80.jpg_.webp"),

      BuissnesList(
          name: "Pent",
          price: 404,
          id: 3,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/16fa693914842c10e4f874c3f382eabc.jpg_200x200q80.jpg_.webp"),
      BuissnesList(
          name: "Pent",
          price: 1400,
          id: 4,
          image:
              "https://img.drz.lazcdn.com/g/kf/Se405a25e44394782ba7c5aa4e4cbdb81T.jpg_200x200q80.jpg_.webp"),

      BuissnesList(
          name: "Pent",
          price: 701,
          id: 5,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/893eaeb5a717d015c764ef2a49034031.jpg_200x200q80.jpg_.webp"),

      BuissnesList(
          name: "Pent",
          price: 404,
          id: 6,
          image:
              "https://img.drz.lazcdn.com/g/kf/S19660a6071e84ca9b3b7ab8652a2df04x.jpg_200x200q80.jpg_.webp"),
    ],
    [
      //hoddie
      BuissnesList(
          name: "Hoddie",
          price: 1109,
          id: 1,
          image:
              "https://img.drz.lazcdn.com/g/kf/Sb37b8e46250d4213b18afd1697e0a586N.jpg_200x200q80.avif"),

      BuissnesList(
          name: "Hoddie",
          price: 701,
          id: 2,
          image:
              "https://img.drz.lazcdn.com/g/kf/Sb37b8e46250d4213b18afd1697e0a586N.jpg_200x200q80.avif"),

      BuissnesList(
          name: "Hoddie",
          price: 404,
          id: 3,
          image:
              "https://img.drz.lazcdn.com/g/kf/Sb90dc115877f4594a8796a9ae7bbe8495.jpg_200x200q80.avif"),
      BuissnesList(
          name: "Hoddie",
          price: 1400,
          id: 4,
          image:
              "https://img.drz.lazcdn.com/g/kf/Scd121ddd7b54457d8d2e3bc0562f34daK.jpg_200x200q80.avif"),

      BuissnesList(
          name: "Hoddie",
          price: 701,
          id: 5,
          image:
              "https://img.drz.lazcdn.com/static/pk/p/893eaeb5a717d015c764ef2a49034031.jpg_200x200q80.jpg_.webp"),

      BuissnesList(
          name: "Hoddie",
          price: 404,
          id: 6,
          image:
              "https://img.drz.lazcdn.com/g/kf/S19660a6071e84ca9b3b7ab8652a2df04x.jpg_200x200q80.jpg_.webp"),
    ],
    []
  ];
}
