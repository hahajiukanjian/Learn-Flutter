import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;

  const InputWidget(this.hint,
      {super.key, this.obscureText = false, this.onChanged, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _input(),
        const Divider(height: 1, color: Colors.grey, thickness: 0.5),
      ],
    );
  }

  _input() {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      autofocus: !obscureText,
      cursorColor: Colors.blue,
      style: const TextStyle(
          fontSize: 17, color: Colors.black, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 17, color: Colors.grey),
      ),
    );
  }
}
