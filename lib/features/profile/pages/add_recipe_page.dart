import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';
import 'package:recipefoodapp/features/authentication/widgets/login_page_text_field.dart';
import 'package:recipefoodapp/features/profile/widgets/profile_page_button.dart';

class AddRecipePage extends StatelessWidget {
  AddRecipePage({super.key});

  final titleController = TextEditingController();
  final timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset(
            'assets/Icons/back-arrow.svg',
          ),
        ),
        centerTitle: true,
        title: Text(
          'Create Recipe',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.redPinkMain,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.only(right: 34, left: 34),
          child: Column(
            children: [
              Row(
                children: [
                  ProfilePageButton(text: 'Publish', onTap: () {}),
                  ProfilePageButton(text: 'Delete', onTap: () {}),
                ],
              ),
              SizedBox(height: 24.h,),
              Container(
                width: 362.w,
                height: 281.h,
                decoration: BoxDecoration(
                  color: AppColors.pink,
                  borderRadius: BorderRadiusGeometry.circular(20.r),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 105,
                      right: 142,
                      child: IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          shape: CircleBorder(),
                          fixedSize: Size(71, 75),
                          backgroundColor: AppColors.redPinkMain,
                        ),
                        icon: SvgPicture.asset(
                          'assets/Icons/play.svg',
                          width: 29,
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h,),
              LoginPageTextField(
                text: 'Title',
                hintText: 'Recipe title',
                suffixIcon: null,
                prefixIcon: null,
                controller: titleController,
              ),
              SizedBox(height: 13.h,),
              Column(spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Recipe description',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: AppColors.backgroundBeige.withValues(
                          alpha: 0.45,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.pink,
                      constraints: BoxConstraints(
                        maxWidth: 358.w,
                        maxHeight: 64.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13.h,),
              LoginPageTextField(
                text: 'Time Recipe',
                hintText: '1hour, 30min, ...',
                suffixIcon: null,
                prefixIcon: null,
                controller: timeController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
