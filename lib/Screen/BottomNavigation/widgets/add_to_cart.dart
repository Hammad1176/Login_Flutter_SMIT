import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/Buisness/Provider/category_provider.dart';
import 'package:login_project/Utils/colors.dart';
import 'package:provider/provider.dart';

class AddTOCardScreen extends StatefulWidget {
  const AddTOCardScreen({super.key});

  @override
  State<AddTOCardScreen> createState() => _AddTOCardScreenState();
}

class _AddTOCardScreenState extends State<AddTOCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Consumer<CategoryProvider>(
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
                            'No items in the cart yet',
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
                        // Ensure the index is within the valid range

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
                                subtitle: getRowWiseAmount(getProvider, index),
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
                                          //increament
                                          getProvider.addQty(
                                              getProvider.addToCart[index],
                                              index);
                                        },
                                        child: const Icon(
                                            Icons.add_circle_outline)),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      getProvider.addToCart[index].quantity
                                          .toString(),
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          //reduce qty
                                          getProvider.decQty(
                                              getProvider.addToCart[index],
                                              index);
                                        },
                                        child: const Icon(
                                            Icons.remove_circle_outline)),
                                    const SizedBox(
                                      width: 20,
                                      height: 5,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          getProvider.deleteItem(index);
                                          // getProvider.checkTotalValue();
                                        },
                                        child: const Icon(Icons.delete)),
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
          ),
        ),
        Consumer<CategoryProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return value.addToCart.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: ColorCustom.prinmary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                value.addToCart.isEmpty
                                    ? Container()
                                    : totalAmount(value.totalAmount()),
                              ],
                            )),
                      ),
                    ),
                  )
                : Container();
          },
        )
      ],
    );
  }
}

getRowWiseAmount(CategoryProvider provider, int index) {
  provider.rowTotal(provider.addToCart, index);
  return Text("Total value is ${provider.addToCart[index].total}");
}

totalAmount(double value) {
  // value.checkTotalValue();
  return Text("Total : ${value.toString()}",
      style: const TextStyle(fontSize: 18, color: Colors.grey));
}
