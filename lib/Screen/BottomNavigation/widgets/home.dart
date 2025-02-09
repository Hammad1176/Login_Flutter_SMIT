import 'package:flutter/material.dart';
import 'package:login_project/Screen/open_user_deatils.dart';
import 'package:login_project/Modal/fruit_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Map<String, dynamic>> FruitDetail.listDetails = [
  //   {
  //     "Fruit": "Apple",
  //     "Url":
  //         'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Red_Apple.jpg/661px-Red_Apple.jpg'
  //   },
  //   {
  //     "Fruit": "Banana",
  //     "Url":
  //         'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
  //   },
  //   {
  //     "Fruit": "Mango",
  //     "Url":
  //         'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
  //   },
  //   {
  //     "Fruit": "Orange",
  //     "Url":
  //         'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
  //   },
  //   {
  //     "Fruit": "pineapple",
  //     "Url":
  //         'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg',
  //   },
  //   {
  //     "Fruit": "Apple",
  //     "Url":
  //         'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Red_Apple.jpg/661px-Red_Apple.jpg'
  //   },
  //   {
  //     "Fruit": "Banana",
  //     "Url":
  //         'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
  //   },
  //   {
  //     "Fruit": "Mango",
  //     "Url":
  //         'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
  //   },
  //   {
  //     "Fruit": "Orange",
  //     "Url":
  //         'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
  //   },
  //   {
  //     "Fruit": "pineapple",
  //     "Url":
  //         'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg',
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: FruitDetail.listDetails.length,
      itemBuilder: (BuildContext context, int index) {
        return Expanded(

            // Url: Urls.amber[UrlCodes[index]],
            child: Card(
          color: Colors.white,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                FruitDetail.listDetails[index].getFruitName(),
              ),
              leading: CircleAvatar(
                // ignore: unnecessary_string_interpolations
                backgroundImage:
                    NetworkImage(FruitDetail.listDetails[index].Url),
              )
              // leading: SizedBox(

              //   height: 50,
              //   width: 50,
              //   child: Image.network(FruitDetail.listDetails[index].getUrl()),
              // ),
              ,
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                // ignore: avoid_print
                print(
                    "object  ${FruitDetail.listDetails[index].getFruitName()}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OpenUserScreen(
                          fruit_name:
                              FruitDetail.listDetails[index].getFruitName(),
                          fruit_url: FruitDetail.listDetails[index].getUrl())),
                );
              },
            ),
          ),
        ));
      },
    );
  }
}
