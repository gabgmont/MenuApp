import 'package:flutter/material.dart';

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
        inputFormatters: [],
        keyboardType: keyboardType,
        controller: controller,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: orderName,
          hintText: orderHint,
        ),
      ),
    );
  }
}
