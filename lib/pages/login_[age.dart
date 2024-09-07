import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b475e),
      body: SafeArea(
        child: Column(
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
            const TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
