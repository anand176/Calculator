import 'package:flutter/material.dart';

class CalculatorKey extends StatelessWidget {
  final String label;
  final int flex;
  final Function(String) onPressed;

  const CalculatorKey({
    required this.label,
    this.flex = 1,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 80.0,
        child: ElevatedButton(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          onPressed: () => onPressed(label),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey[300],
            onPrimary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
      ),
    );
  }
}
