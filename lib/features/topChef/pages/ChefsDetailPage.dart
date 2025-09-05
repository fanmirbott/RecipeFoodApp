import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/features/common/bottomNavigationBar/bottom_nav_bar.dart';
import 'package:recipefoodapp/features/topChef/managers/chefDetailViewModel.dart';
import 'package:recipefoodapp/features/topChef/pages/following_container.dart';
import 'package:recipefoodapp/features/topChef/pages/following_page.dart';
import '../../../../../../core/utils/Appcolors.dart';
import '../widgets/chef_recipe_grid_view.dart';

class ChefsDetailPage extends StatefulWidget {
  const ChefsDetailPage({
    super.key,
  });

  @override
  State<ChefsDetailPage> createState() => _ChefsDetailPageState();
}

class _ChefsDetailPageState extends State<ChefsDetailPage> {
  bool following = false;
  bool muteNotifications = true;
  bool muteAccount = true;
  bool blockAccount = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChefDetailViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundBeige,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: SvgPicture.asset("assets/Icons/back-arrow.svg"),
            ),
            title: Row(
              children: [
                Text(
                  '@${vm.chef?.firstName ?? ''}_',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.redPinkMain,
                  ),
                ),
                Text(
                  vm.chef?.lastName ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.redPinkMain,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      bool muteNotifications = true;
                      bool muteAccount = true;
                      bool blockAccount = false;
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return Container(
                            padding: EdgeInsets.only(
                              left: 56,
                              right: 56,
                              top: 45,
                              bottom: 40,
                            ),
                            width: double.infinity,
                            height: 373.h,
                            decoration: BoxDecoration(color: AppColors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(32.r),
                                      child: Image.network(
                                        vm.chef?.profilePhoto ?? '',
                                        width: 64.w,
                                        height: 64.h,
                                      ),
                                    ),
                                    SizedBox(width: 15.w),
                                    Row(
                                      children: [
                                        Text(
                                          '@${vm.chef?.firstName ?? ''}_',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: AppColors.redPinkMain,
                                          ),
                                        ),
                                        Text(
                                          vm.chef?.lastName ?? '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: AppColors.redPinkMain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Manage notifications",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),

                                // Mute notifications
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Mute notifications",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    CupertinoSwitch(
                                      value: muteNotifications,
                                      activeColor: Colors.red,
                                      onChanged: (value) {
                                        setState(() {
                                          muteNotifications = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                // Mute Account
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Mute Account",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    CupertinoSwitch(
                                      value: muteAccount,
                                      activeColor: Colors.red,
                                      onChanged: (value) {
                                        setState(() {
                                          muteAccount = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                // Block Account
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Block Account",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    CupertinoSwitch(
                                      value: blockAccount,
                                      activeColor: Colors.red,
                                      onChanged: (value) {
                                        setState(() {
                                          blockAccount = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                // Report
                                const Text(
                                  "Report",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.pink,
                  fixedSize: Size(36.w, 36.h),
                ),
                icon: Image.asset(
                  'assets/IconsApp/share1.png',
                ),
              ),
              IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.pink,
                ),
                icon: SvgPicture.asset(
                  "assets/Icons/three_dots.svg",
                  color: AppColors.pinkSub,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavBar(),
          body: vm.isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 35),
                child: SizedBox(
                  height: 97.h,
                  child: Row(
                    spacing: 13,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(50.r),
                        child: Image.network(
                          vm.chef?.profilePhoto ?? "",
                          width: 100.w,
                          height: 96.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        spacing: 7,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                vm.chef?.firstName ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: AppColors.redPinkMain,
                                ),
                              ),
                              Text(
                                vm.chef?.lastName ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: AppColors.redPinkMain,
                                ),
                              ),
                              Text(
                                '-Chef',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: AppColors.redPinkMain,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            vm.chef?.presentation ?? '',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: AppColors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                following = !following;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 81.w,
                              height: 19.h,
                              decoration: BoxDecoration(
                                color: following
                                    ? AppColors.pink
                                    : AppColors.redPinkMain,
                                borderRadius: BorderRadius.circular(
                                  30.r,
                                ),
                              ),
                              child: Text(
                                following ? 'Follow' : 'Following',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                  fontSize: 9,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FollowingPage(),));
                },
                child: FollowingContainer(
                  recipes: vm.chef?.recipesCount.toString() ?? '0',
                  following: vm.chef?.followingCount.toString() ?? '0',
                  followers: vm.chef?.followerCount.toString() ?? '0',
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Recipes',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 358.w,
                height: 1.h,
                decoration: BoxDecoration(
                  color: AppColors.redPinkMain,
                  borderRadius: BorderRadiusGeometry.circular(10.r),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              ChefRecipeGridView(),
            ],
          ),
        );
      },
    );
  }
}
