import 'package:flutter/material.dart';
import 'package:test_app/screens/menu.dart';

class MenuItemWidget extends StatelessWidget {
  final MenuItem _menuItem;
  MenuItemWidget(this._menuItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.add_shopping_cart_rounded),
        title: Text(_menuItem.name.toString()),
        subtitle: Text(_menuItem.description.toString()),
        trailing: Text('R\$ ${_menuItem.price.toString()}'),
      ),
    );
  }
}

// class MenuAddItemWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         final Future future =
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return AddProductWidget();
//         }));
//         future.then((createMenuItem) {
//           debugPrint('Retornando item do Menu');
//           debugPrint('$createMenuItem');
//         });
//       },
//       child: Card(
//         elevation: 3,
//         child: Container(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Icon(Icons.add_circle),
//           ),
//           alignment: Alignment.center,
//         ),
//       ),
//     );
//   }
// }