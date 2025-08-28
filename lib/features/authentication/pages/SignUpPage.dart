import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/data/models/authentication/AuthenticationModel.dart';
import 'package:recipefoodapp/data/repositories/Auth/AuthenticationRepository.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

import '../widgets/login_page_text_button.dart';
import '../widgets/login_page_text_field.dart';
class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerUsername = TextEditingController();

  final controllerEmail = TextEditingController();

  final controllerMobile = TextEditingController();

  final controllerData = TextEditingController();

  final controllerPassword = TextEditingController();

  final controllerConPassword = TextEditingController();

  @override
  void dispose() {
    controllerFirstName.dispose();
    controllerLastName.dispose();
    controllerUsername.dispose();
    controllerEmail.dispose();
    controllerMobile.dispose();
    controllerData.dispose();
    controllerPassword.dispose();
    controllerConPassword.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors().backgroundBegie,
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Appcolors().redpinkmain,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 36),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                LoginPageTextField(
                  text: 'FirstName',
                  hintText: 'FirstName',
                  suffixIcon: null,
                  prefixIcon: null,
                  controller: controllerFirstName,
                ),
                LoginPageTextField(
                  text: 'LastName',
                  hintText: 'LastName',
                  suffixIcon: null,
                  prefixIcon: null,
                  controller: controllerLastName,
                ),
                LoginPageTextField(
                  controller: controllerUsername,
                  text: 'username',
                  hintText: 'John Doe',
                  suffixIcon: null,
                  prefixIcon: null,
                ),
                LoginPageTextField(
                  controller: controllerEmail,
                  text: 'Email',
                  hintText: 'example@example.com',
                  suffixIcon: null,
                  prefixIcon: null,
                ),
                LoginPageTextField(
                  controller: controllerMobile,
                  text: 'Mobile Number',
                  hintText: '+ 123 456 789',
                  suffixIcon: null,
                  prefixIcon: null,
                ),
                LoginPageTextField(
                  controller: controllerData,
                  text: 'Date Of Birth',
                  hintText: 'DD / MM /YYY',
                  suffixIcon: null,
                  prefixIcon: null,
                ),
                LoginPageTextField(
                  controller: controllerPassword,
                  text: 'Password',
                  hintText: '●●●●●●●●',
                  suffixIcon: Icon(
                    Icons.visibility_off,
                  ),
                  prefixIcon: null,
                ),
                LoginPageTextField(
                  controller: controllerConPassword,
                  text: 'Confirm Password',
                  hintText: '●●●●●●●●',
                  suffixIcon: Icon(
                    Icons.visibility_off,
                  ),
                  prefixIcon: null,
                ),
                SizedBox(
                  height: 47.h,
                ),
                Text(
                  'By continuing, you agree to ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Appcolors().white,
                  ),
                ),
                Text(
                  ' Terms of Use and Privacy Policy.',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Appcolors().white,
                  ),
                ),
                SizedBox(height: 12.h),
                LoginPageTextButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final repo = context.read<AuthenticationRepository>();
                      SignUpModel signUp = SignUpModel(
                        username: controllerUsername.text,
                        firstName: controllerFirstName.text,
                        lastName: controllerLastName.text,
                        email: controllerEmail.text,
                        phoneNumber: controllerMobile.text,
                        birthDate: controllerData.text,
                        password: controllerPassword.text,
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(
                              child: Text(
                                "Sign up succesful!",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Appcolors().backgroundBegie,
                                ),
                              ),
                            ),
                            content: SizedBox(
                              width: 250.w,
                              height: 200.h,
                              child: Column(
                                children: [
                                  Container(
                                    width: 82.w,
                                    height: 82.h,
                                    decoration: BoxDecoration(
                                      color: Appcolors().pink,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/Icons/profile.svg',
                                        width: 30.w,
                                        height: 44.h,
                                        color: Appcolors().redpinkmain,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    "Profil ochildi",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    "Sizning profilingiz muvaffaqiyatli ochildi.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Xabar"),
                            content: Text("Zo‘r!"),
                            actions: [
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  text: 'Sign up',
                  textColor: Appcolors().white,
                  backgroundColor: Appcolors().redpinkmain,
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Appcolors().white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push('/loginPage');
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Appcolors().redpinkmain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
