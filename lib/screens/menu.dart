import 'package:flutter/material.dart';
import 'package:test_app/components/menu_item.dart';

import 'order.dart';

const _appBarLabel = 'Cardápio';

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
    return Scaffold(
      appBar: AppBar(title: Text(_appBarLabel)),
      body: ListView.builder(
        itemCount: widget._menuList.length,
        itemBuilder: (context, index) {
          final menuItem = widget._menuList[index];
          return MenuItemWidget(menuItem);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddProductWidget();
          })).then((createMenuItem) => updateMenuList(createMenuItem));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void updateMenuList(createMenuItem) {
    if (createMenuItem != null) {
      setState(() => widget._menuList.add(createMenuItem));
    }
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
