import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/Appcolors.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool muteNotifications = true;
  bool sound = true;
  bool soundCall = true;
  bool vibrate = true;

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
          'Notification',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.redPinkMain,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(right: 36, left: 36),
        child: Column(
          spacing: 15,
          children: [
            Row(
              children: [
                Text(
                  'General Notification',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                Spacer(),
                Transform.scale(
                  scale: 0.6,
                  child: Switch(
                    inactiveTrackColor: AppColors.backgroundBeige,
                    value: muteNotifications,
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.redPinkMain,
                    onChanged: (value) {
                      setState(() {
                        muteNotifications = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Sound',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                Spacer(),
                Transform.scale(
                  scale: 0.6,
                  child: Switch(
                    inactiveTrackColor: AppColors.backgroundBeige,
                    value: sound,
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.redPinkMain,
                    onChanged: (value) {
                      setState(() {
                        sound = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Sound Call',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                Spacer(),
                Transform.scale(
                  scale: 0.6,
                  child: Switch(
                    inactiveTrackColor: AppColors.backgroundBeige,
                    value: soundCall,
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.redPinkMain,
                    onChanged: (value) {
                      setState(() {
                        soundCall = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Vibrate',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                Spacer(),
                Transform.scale(
                  scale: 0.6,
                  child: Switch(
                    inactiveTrackColor: AppColors.backgroundBeige,
                    value: vibrate,
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.redPinkMain,
                    onChanged: (value) {
                      setState(() {
                        vibrate = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
