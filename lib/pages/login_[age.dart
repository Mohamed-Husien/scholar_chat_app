import 'package:chat_app/widgets/custom_elevation_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b475e),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/scholar.png'),
              const Text(
                'scholar Chat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Pacifico',
                ),
              ),
              const Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Pacifico',
                ),
              ),
              CustomTextField(
                hientText: 'Email',
              ),
              CustomTextField(
                hientText: 'Password',
              ),
              const CustomElevationButton(buttonText: 'Sign In')
            ],
          ),
        ),
      ),
    );
  }
}
