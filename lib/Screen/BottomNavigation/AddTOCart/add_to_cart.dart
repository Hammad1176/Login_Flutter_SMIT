import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/Provider/category_provider.dart';
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
                            semanticContainer: true,

                            // color: Colors.white,
                            elevation: 5,
                            borderOnForeground: true,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  getProvider.addToCart[index].name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: getRowWiseAmount(getProvider, index),
                                leading: SizedBox(
                                  height: 100,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        getProvider.addToCart[index].image),
                                  ),
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
                                      style: const TextStyle(fontSize: 15),
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
                                      width: 10,
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
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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

//row wise total
// ignore: non_constant_identifier_names

getRowWiseAmount(CategoryProvider provider, int index) {
  provider.rowTotal(provider.addToCart, index);
  String amount = provider.addToCart[index].total.toStringAsFixed(2);
  final res = amountWithComma(amount);

  return Text(
    "Total value is $res",
    style: TextStyle(fontWeight: FontWeight.bold),
  );
}

//value add comma ,
amountWithComma(String amount) {
  return amount.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}

totalAmount(double value) {
  // value.checkTotalValue();
  String totalAmount =
      amountWithComma(value.toStringAsFixed(2)); //1000 => 1,000
  return Text("Total Value is : $totalAmount",
      style: const TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold));
}
