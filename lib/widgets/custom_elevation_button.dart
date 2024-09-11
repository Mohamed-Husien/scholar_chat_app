import 'package:flutter/material.dart';

class CustomElevationButton extends StatelessWidget {
  CustomElevationButton({super.key, required this.buttonText, this.onTap});
  final String buttonText;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize:
            MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return const Color(0xff2b475e); // Color when the button is pressed
          }
          return Colors.white; // Default color
        }),
      ),
      onPressed: onTap,
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Pacifico',
        ),
      ),
    );
  }
}
