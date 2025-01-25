import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/emial_and_password_validet_function.dart';
import 'package:chat_app/helper/show_snack_bar_function.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_elevation_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static String id = 'LogInPage';
  String? password;

  String? email;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            isLoading = true;
          } else if (state is LoginSuccess) {
            BlocProvider.of<ChatCubit>(context).getMessage();
            Navigator.pushNamed(context, ChatPage.id);
            isLoading = false;
          } else if (state is LoginFailure) {
            showSnachBarFun(context, state.errMessage);
            isLoading = false;
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 75,
                      ),
                      Image.asset(
                        'assets/images/scholar.png',
                        height: 100,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Center(
                        child: Text(
                          'Scholar Chat',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 75,
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
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        validator: (value) => validateEmail(value!),
                        onChange: (value) {
                          email = value;
                        },
                        hientText: 'Email',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        onChange: (value) => password = value,
                        validator: (value) => validatePassword(value!),
                        hientText: 'Password',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomElevationButton(
                        buttonText: 'Sign In',
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            isLoading = true;

                            BlocProvider.of<AuthCubit>(context)
                                .signInUserMethod(
                                    email: email!, password: password!);
                          } else {}
                        },
                      ),
                      const SizedBox(
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
            ),
          );
        },
      ),
    );
  }
}
