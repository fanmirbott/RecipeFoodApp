import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/router/routerName.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';
import '../managers/AuthentictacionViewModel.dart';
import '../widgets/login_page_text_button.dart';
import '../widgets/login_page_text_field.dart';
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors().backgroundBegie,
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Appcolors().redpinkmain,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 37),
          child: Column(
            children: [
              SizedBox(
                height: 122.h,
              ),
              LoginPageTextField(
                controller: controllerEmail,
                hintText: '    example@example.com',
                suffixIcon: null,
                prefixIcon: null,
                text: 'Email',
              ),
              SizedBox(
                height: 10.h,
              ),
              LoginPageTextField(
                controller: controllerPassword,
                hintText: '   ●●●●●●●●',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_off),
                ),
                prefixIcon: null,
                text: 'Password',
              ),
              SizedBox(
                height: 69.h,
              ),
              LoginPageTextButton(
                onPressed: () async {
                  final loginVM = context.read<LoginViewModel>();
                  final success = await loginVM.login(
                    controllerEmail.text,
                    controllerPassword.text,
                  );

                  if (success) {
                    context.go(Routers.homePage);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          loginVM.errorMessage ?? "Xatolik yuz berdi",
                        ),
                      ),
                    );
                  }
                },

                text: 'Login',
                textColor: Appcolors().white,
                backgroundColor: Appcolors().pink,
              ),
              SizedBox(
                height: 22.h,
              ),
              LoginPageTextButton(
                onPressed: () {
                  context.push(Routers.signUpPage);
                },
                text: 'Sign up',
                textColor: Appcolors().pinkSub,
                backgroundColor: Appcolors().pink,
              ),
              SizedBox(
                height: 48.h,
              ),
              GestureDetector(
                onTap: () {
                  context.push(Routers.otpDigitField);
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Appcolors().white,
                  ),
                ),
              ),
              SizedBox(
                height: 65.h,
              ),
              Text(
                'or sign up with',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Appcolors().white,
                ),
              ),
              SizedBox(
                height: 74.h,
              ),
              SizedBox(
                width: 205.w,
                height: 31.h,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/IconsApp/instagram.png',
                      ),
                      Image.asset(
                        'assets/IconsApp/google.png',
                      ),
                      Image.asset(
                        'assets/IconsApp/facebook.png',
                      ),
                      Image.asset(
                        'assets/IconsApp/watsUp.png',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Don’t have an account? Sign Up',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Appcolors().white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
