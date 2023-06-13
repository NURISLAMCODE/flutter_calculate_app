import 'package:calculator_app/main.dart';
import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  final String value;
  final Function() ontap;
  const OperatorButton({super.key, required this.value, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        oparetor = value;
        ontap;
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: oparetor == value ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
