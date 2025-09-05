import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

class LoginPageTextField extends StatelessWidget {
  const LoginPageTextField({
    super.key,
    required this.text,
    required this.hintText,
    required this.suffixIcon,
    required this.prefixIcon,
    required this.controller,
  });

  final TextEditingController controller;

  final String text;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            constraints: BoxConstraints(maxWidth: 357.w, maxHeight: 45.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
            filled: true,
            fillColor: AppColors.pink,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.brown.shade400,
            ),
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}
