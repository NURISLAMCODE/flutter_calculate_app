import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintext;
  final TextEditingController controller;
  final Function() onTap;
  const CustomTextField({
    super.key,
    required this.hintext,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        onTap();
      },
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), hintText: hintext),
    );
  }
}
