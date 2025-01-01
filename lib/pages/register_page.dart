import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/emial_and_password_validet_function.dart';
import 'package:chat_app/helper/show_snack_bar_function.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/cubits/register_cubit/register_cubit.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/widgets/custom_elevation_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static String id = 'RegisterPage';
  String? password;

  String? email;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            isLoading = true;
          } else if (state is RegisterSuccess) {
            Navigator.pushNamed(context, LoginPage.id);
            isLoading = false;
          } else if (state is RegisterFailure) {
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
                            'REGISTER',
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
                        validator: (value) {
                          return validateEmail(value!);
                        },
                        onChange: (data) {
                          email = data;
                        },
                        hientText: 'Email',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          return validatePassword(value!);
                        },
                        onChange: (data) {
                          password = data;
                        },
                        hientText: 'Password',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomElevationButton(
                        buttonText: 'Register',
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context)
                                .createUserMethod(
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
                            'Already have an account ',
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
            ),
          );
        },
      ),
    );
  }
}
