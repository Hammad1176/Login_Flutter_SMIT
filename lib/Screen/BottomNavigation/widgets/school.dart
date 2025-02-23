import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/Buisness/Provider/category_provider.dart';
import 'package:provider/provider.dart';

class SchoolScreen extends StatefulWidget {
  const SchoolScreen({super.key});

  @override
  State<SchoolScreen> createState() => _SchoolScreenState();
}

class _SchoolScreenState extends State<SchoolScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
    return Consumer<CategoryProvider>(builder: (context, CartProvider, child) {
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      return ListView.builder(itemBuilder: (BuildContext, index) {
        return ListTile(
          title: Text(CartProvider.setindex(index: index)),
        );
      });
    });
  }
}
//  Center(
//       // ignore: sized_box_for_whitespace
//       child: Container(
//         height: 100,
//         width: 100,
//         child: Stack(
//           children: [
//             const Positioned(
//               top: 10,
//               child: Icon(
//                 Icons.shopping_cart_outlined,
//                 size: 50,
//               ),
//             ),
//             Positioned(
//               top: 5,
//               left: 30,
//               child: Container(
//                 height: 20,
//                 width: 20,
//                 // color: Colors.red,
//                 decoration: const BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.all(Radius.circular(80))),
//                 child: const Align(
//                   child: Icon(
//                     Icons.add,
//                     color: Colors.white,
//                     size: 10,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
   
   
//     );
