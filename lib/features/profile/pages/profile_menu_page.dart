import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/core/routing/routes.dart';
import 'package:recipefoodapp/features/profile/widgets/notifiy_widget.dart';

import '../../../core/utils/Appcolors.dart';

class ProfileMenuPage extends StatelessWidget {
  const ProfileMenuPage({super.key});

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
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.redPinkMain,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 36, left: 36),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              NotifyWidget(
                icon: SvgPicture.asset(
                  'assets/Icons/notification.svg',
                  colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
                text: 'Notification',
                iconPrefix: GestureDetector(
                  onTap: (){
                    context.push(Routes.notificationPage);
                  },
                  child: Image.asset(
                    'assets/IconsApp/play.png',
                    width: 11,
                    height: 15,
                  ),
                ),
              ),
              NotifyWidget(
                icon: Image.asset(
                  'assets/IconsApp/help.png',
                  width: 18,
                  height: 20,
                ),
                text: 'Help Center',
                iconPrefix: Image.asset(
                  'assets/IconsApp/play.png',
                  width: 11,
                  height: 15,
                ),
              ),
              NotifyWidget(
                icon: Image.asset(
                  'assets/IconsApp/police.png',
                  width: 15,
                  height: 17,
                ),
                text: 'Privacy Policy',
                iconPrefix: Image.asset(
                  'assets/IconsApp/play.png',
                  width: 11,
                  height: 15,
                ),
              ),
              NotifyWidget(
                icon: SvgPicture.asset(
                  'assets/Icons/reviews.svg',
                  width: 17,
                ),
                text: 'Language',
                iconPrefix: Image.asset(
                  'assets/IconsApp/play.png',
                  width: 11,
                  height: 15,
                ),
              ),
              NotifyWidget(
                icon: Image.asset(
                  'assets/IconsApp/turn.png',
                  width: 15,
                  height: 17,
                ),
                text: 'Turn dark Theme',
                iconPrefix: null,
              ),
              NotifyWidget(
                icon: Image.asset(
                  'assets/IconsApp/logout.png',
                  width: 15,
                  height: 17,
                ),
                text: 'Log Out',
                iconPrefix: null,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Delete Account',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.pinkSub,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
