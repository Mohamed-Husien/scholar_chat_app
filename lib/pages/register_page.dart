import 'package:chat_app/widgets/custom_elevation_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b475e),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Image.asset('assets/images/scholar.png'),
              const Text(
                'Scholar Chat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Pacifico',
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Colors.white,
                      // fontSize: 1,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              CustomTextField(
                hientText: 'Email',
              ),
              Container(
                height: 10,
              ),
              CustomTextField(
                hientText: 'Password',
              ),
              Container(
                height: 20,
              ),
              const CustomElevationButton(buttonText: 'Log In'),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      ' Login.',
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
