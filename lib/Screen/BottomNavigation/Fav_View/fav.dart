import 'package:flutter/material.dart';
import 'package:login_project/Modal/buissnes_list.dart';
import 'package:login_project/Screen/BottomNavigation/Provider/category_provider.dart';
import 'package:login_project/Screen/BottomNavigation/fav_View/open_user_deatils.dart';
import 'package:login_project/Utils/colors.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorCustom.background,
      child: Consumer<CategoryProvider>(
        builder: (BuildContext context, getProvider, Widget? child) {
          return getProvider.fav!.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 50,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'No favorites yet',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: getProvider.fav!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Hero(
                      tag: getProvider.fav![index].image,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          color: ColorCustom.background,
                          borderOnForeground: true,
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(
                                getProvider.fav![index].name,
                              ),
                              leading: SizedBox(
                                height: 50,
                                width: 60,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      getProvider.fav![index].image),
                                ),
                              ),
                              trailing: const Icon(Icons.navigate_next),
                              onTap: () {
                                String name = getProvider.fav![index].name;
                                String image = getProvider.fav![index].image;
                                double price = getProvider.fav![index].price;
                                BuissnesList list = getProvider.fav![index];

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OpenProductDetails(
                                            product_name: name,
                                            product_url: image,
                                            product_price: price,
                                            list: list,
                                          )),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
