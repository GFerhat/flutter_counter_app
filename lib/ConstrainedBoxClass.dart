import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnlyNumsTextfield extends StatelessWidget {
  const OnlyNumsTextfield({super.key});
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 80),
      child: TextField(
        decoration: InputDecoration(border: OutlineInputBorder()),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(5),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
