import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final IconData icon;

  const CustomSearchField({
    super.key,
    this.hintText = 'Pesquisar',
    this.onChanged,
    this.controller,
    this.icon = Icons.check,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.black54),
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            suffixIcon: Icon(icon, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
