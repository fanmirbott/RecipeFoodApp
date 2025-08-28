
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

import '../widgets/login_page_text_button.dart';
import '../widgets/login_page_text_field.dart';



class OtpDigitField extends StatelessWidget {
  OtpDigitField({super.key});

  final controllerOne = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors().backgroundBegie,
        centerTitle: true,
        title: Text(
          'Forgot your password',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Appcolors().redpinkmain,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 37),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello there!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Appcolors().white,
                  ),
                ),
                Text(
                  'Enter your email address. We will send a code verification in the next step.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Appcolors().white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 43.h,
            ),
            LoginPageTextField(
              controller: controllerOne,
              text: 'Email',
              hintText: 'example@example.com',
              suffixIcon: null,
              prefixIcon: null,
            ),
            Spacer(),
            LoginPageTextButton(
              onPressed: () {
                context.push('/SendOtpPage');
              },
              text: 'Login',
              textColor: Appcolors().pinkSub,
              backgroundColor: Appcolors().pink,
            ),
            SizedBox(
              height: 48.h,
            ),
          ],
        ),
      ),
    );
  }
}
