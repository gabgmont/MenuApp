import 'package:flutter/material.dart';
import 'package:test_app/models/text_editor.dart';

import 'menu.dart';

const _appBarLabel = 'Incluir Pedido';

const _productName = "Nome do produto";
const _productNameHint = "Lanche";

const _productDescription = "Descrição do Produto";
const _productDescriptionHint = "Pão, hamburguer...";

const _productValue = "Preço";
const _productValueHint = "R\$00.00";

const _confirmButton = 'Confirmar';

class AddProductWidget extends StatefulWidget {
  @override
  AddProductWidgetState createState() => AddProductWidgetState();
}

class AddProductWidgetState extends State<AddProductWidget> {
  final TextEditingController _orderNameController = TextEditingController();
  final TextEditingController _orderDescriptionController =
      TextEditingController();
  final TextEditingController _orderValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_appBarLabel)),
        body: SingleChildScrollView(
          child: Column(children: [
            TextEditor(
              orderName: _productName,
              orderHint: _productNameHint,
              controller: _orderNameController,
              icon: Icons.whatshot,
            ),
            TextEditor(
              orderName: _productDescription,
              orderHint: _productDescriptionHint,
              controller: _orderDescriptionController,
              icon: Icons.article,
            ),
            TextEditor(
              orderName: _productValue,
              orderHint: _productValueHint,
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
                child: Text(_confirmButton),
              ),
            ),
          ]),
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
      Navigator.pop(context, menuItem);
    }
  }
}
