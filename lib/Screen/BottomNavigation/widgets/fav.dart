import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/Buisness/Provider/category_provider.dart';
import 'package:login_project/Screen/open_user_deatils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (BuildContext context, getProvider, Widget? child) {
        return getProvider.Fav!.isEmpty
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
                itemCount: getProvider.Fav?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Hero(
                    tag: getProvider.Fav![index].image,
                    child: Card(
                      color: Colors.white,
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            getProvider.Fav![index].name,
                          ),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(getProvider.Fav![index].image),
                          ),
                          trailing: const Icon(Icons.navigate_next),
                          onTap: () {
                            String name = getProvider.Fav![index].name;
                            String image = getProvider.Fav![index].image;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OpenUserScreen(
                                        fruit_url: image,
                                        fruit_name: name,
                                      )),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
