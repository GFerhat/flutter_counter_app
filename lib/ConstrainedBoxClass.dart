import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class DecimalInputField extends StatefulWidget {
  final double numberToBeRounded;
  final void Function(double) setResult;
  const DecimalInputField({
    super.key,
    required this.numberToBeRounded,
    required this.setResult,
  });
  @override
  State<DecimalInputField> createState() => _DecimalInputFieldState();
}

class _DecimalInputFieldState extends State<DecimalInputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 55),
      child: TextField(
        controller: _controller,
        onEditingComplete: () {
          int digitsAfterComma = int.tryParse(_controller.text) ?? 0;
          double rounded = roundDouble(
            widget.numberToBeRounded,
            digitsAfterComma,
          );
          widget.setResult(rounded);
        },
        decoration: InputDecoration(border: OutlineInputBorder()),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(2),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}

double roundDouble(double toBeRounded, int digitsAfterComma) {
  double x = 0.5 / pow(10, digitsAfterComma);
  toBeRounded = toBeRounded + x;
  toBeRounded = toBeRounded * pow(10, digitsAfterComma);
  int cutRemainingDigits = toBeRounded.toInt();
  toBeRounded = cutRemainingDigits.toDouble() / pow(10, digitsAfterComma);
  return toBeRounded;
}