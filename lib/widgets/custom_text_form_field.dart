import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hientText, this.onChange, this.validator});
  final String hientText;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hientText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
