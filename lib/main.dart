import 'package:flutter/material.dart';

void main() => runApp(MenuApp());

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MenuWidget());
  }
}

class AddProductWidget extends StatelessWidget {
  final TextEditingController _orderNameController = TextEditingController();
  final TextEditingController _orderDescriptionController = TextEditingController();
  final TextEditingController _orderValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Incluir Pedido')),
        body: Column(
          children: [
            TextEditor(
              orderName: "Nome do produto",
              orderHint: "Lanche",
              controller: _orderNameController,
              icon: Icons.whatshot,
            ),
            TextEditor(
              orderName: "Descrição do Produto",
              orderHint: "Pão, hamburguer...",
              controller: _orderDescriptionController,
              icon: Icons.article,
            ),
            TextEditor(
              orderName: "Preço",
              orderHint: "R\$00.00",
              controller: _orderValueController,
              icon: Icons.monetization_on,
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    createMenuItem(context);
                  },
                  child: Text('Confirmar')),
            ),
          ],
        ));
  }

  void createMenuItem(BuildContext context) {
    final String menuItemName = _orderNameController.text;
    final String menuItemDescription = _orderDescriptionController.text;
    final double menuItemValue = double.tryParse(_orderValueController.text);

    if (menuItemName != "" &&
        menuItemDescription != "" &&
        menuItemValue != null) {
      final menuItem =
          MenuItem(menuItemName, menuItemDescription, menuItemValue);
      debugPrint('Criando item do menu');
      debugPrint('$menuItem');
      Navigator.pop(context, menuItem);
    }
  }
}

class TextEditor extends StatelessWidget {
  final TextEditingController controller;
  final orderName;
  final orderHint;
  final IconData icon;
  final TextInputType keyboardType;

  TextEditor(
      {this.controller,
      this.orderName,
      this.orderHint,
      this.icon,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
            icon: Icon(icon), labelText: orderName, hintText: orderHint),
      ),
    );
  }
}

class MenuWidget extends StatefulWidget {
  final List<MenuItem> _menuList = [];

  @override
  State<StatefulWidget> createState() {
    return MenuWidgetState();
  }
}

class MenuWidgetState extends State<MenuWidget> {

  @override
  Widget build(BuildContext context) {
    debugPrint('LISTA DE ITENS NO MENU ${widget._menuList}');

    return Scaffold(
      appBar: AppBar(title: Text('Cardápio')),
      body: ListView.builder(
        itemCount: widget._menuList.length,
        itemBuilder: (context, index) {
          final menuItem = widget._menuList[index];
          debugPrint('CRIANDO UM NOVO ITEM NO MENU $widget._menuList[index]');
          return MenuItemWidget(menuItem);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddProductWidget();
          }));
          future.then((createMenuItem) {
            debugPrint('Retornando item do Menu');
            debugPrint('$createMenuItem');
            widget._menuList.add(createMenuItem);
            debugPrint('LISTA DE ITENS ${widget._menuList}');
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MenuItem {
  final String name;
  final String description;
  final double price;

  MenuItem(this.name, this.description, this.price);

  @override
  String toString() {
    return 'MenuItem{name: $name, description: $description, price: $price}';
  }
}

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
