import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/utils/provider.dart';
import 'package:recipefoodapp/features/common/bottomNavigationBar/bottom_nav_bar.dart';

import '../../core/utils/Appcolors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavBar(),
      body: Column(
        children: [
          Center(
            child: IconButton(
              onPressed: () {
                context.read<ThemeViewModel>().toggleTheme();
              },
              style: IconButton.styleFrom(backgroundColor: Appcolors().pink),
              icon: Icon(Icons.brightness_6),
            ),
          ),
        ],
      ),
    );
  }
}
