import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class decimalInputField extends StatefulWidget {
  final double numberToBeRounded;
  final Function(double) setResult;
  const decimalInputField({
    super.key,
    required this.numberToBeRounded,
    required this.setResult,
  });
  @override
  State<decimalInputField> createState() => _decimalInputFieldState();
}

class _decimalInputFieldState extends State<decimalInputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 80),
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
