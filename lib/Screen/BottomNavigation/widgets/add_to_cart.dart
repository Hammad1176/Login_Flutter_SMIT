import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/Buisness/Provider/category_provider.dart';
import 'package:provider/provider.dart';

class AddTOCardScreen extends StatefulWidget {
  const AddTOCardScreen({super.key});

  @override
  State<AddTOCardScreen> createState() => _AddTOCardScreenState();
}

class _AddTOCardScreenState extends State<AddTOCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (BuildContext context, getProvider, Widget? child) {
        return getProvider.addToCart.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 50,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'No addToCartorites yet',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: getProvider.addToCart.length,
                itemBuilder: (BuildContext context, int index) {
                  return Hero(
                    tag: getProvider.addToCart[index].image,
                    child: Card(
                      color: Colors.white,
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            getProvider.addToCart[index].name,
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                getProvider.addToCart[index].image),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    // ignore: avoid_print
                                    getProvider.addQty(
                                        getProvider.addToCart[index], index);
                                  },
                                  child: const Icon(Icons.add)),
                              const SizedBox(
                                width: 5,
                              ),
                              // ignore: unnecessary_string_interpolations
                              Text(
                                  // ignore: unnecessary_string_interpolations
                                  "${getProvider.addToCart[index].quantity.toString()}"),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(Icons.delete),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
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
