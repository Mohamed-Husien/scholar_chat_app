import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_elevation_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String id = 'LogInPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
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
                    'LOGIN',
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
              const CustomElevationButton(buttonText: 'Sign In'),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'You don\'t have acount?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                    child: const Text(
                      ' Register.',
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
