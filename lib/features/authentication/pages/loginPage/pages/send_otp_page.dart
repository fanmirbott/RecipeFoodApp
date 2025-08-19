import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

import '../widgets/login_page_text_button.dart';

class SendOtpPage extends StatefulWidget {
  const SendOtpPage({super.key});

  @override
  State<SendOtpPage> createState() => _SendOtpPageState();
}

class _SendOtpPageState extends State<SendOtpPage> {
  late final  Timer timer;

  int second = 60;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(seconds: 1),
            (timer) {
          if (timer.tick >= 60) {
            timer.cancel();
          }
          second --;
          setState(() {
          });
        }
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  static final otpLength = 6;

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());


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
            SizedBox(
              height: 30.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You’ve got mail',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Appcolors().white,
                  ),
                ),
                Text(
                  'We will send you the verification code to your email address, check your email and put the code right below .',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Appcolors().white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 53.h,
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
              child: Row(
                spacing: 15.w,
                children: [
                  ...List.generate(otpLength, (index) {
                    return TextFormField(
                      keyboardType: TextInputType.number,
                      cursorColor: Appcolors().white,
                      textAlign: TextAlign.center,
                      focusNode: focusNodes[index],
                      controller: controllers[index],
                      onChanged: (value) {
                        if (value.length == 1) {
                          if (index < otpLength - 1) {
                            focusNodes[index + 1].requestFocus();
                          }
                        }
                      },
                      maxLength: 1,
                      style: TextStyle(
                        color: Appcolors().white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        counter: SizedBox.shrink(),
                        constraints: BoxConstraints(
                          maxHeight: 40.h,
                          maxWidth: 40.w,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Appcolors().redpinkmain,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Appcolors().redpinkmain,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Appcolors().redpinkmain,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 76.h,),
            Text(
              'Didn’t receive the mail?',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Appcolors().white,
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'You can resend it in ',
                children: [
                  TextSpan(
                    text: '$second'.toString(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Appcolors().redpinkmain,
                    ),
                  ),
                  TextSpan(
                    text: ' sec',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Appcolors().white,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            LoginPageTextButton(
              onPressed: () {},
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
