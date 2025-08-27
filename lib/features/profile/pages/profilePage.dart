import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/core/utils/provider.dart';
import 'package:recipefoodapp/data/repositories/profileRepostory.dart';
import 'package:recipefoodapp/features/common/bottomNavigationBar/bottom_nav_bar.dart';
import 'package:recipefoodapp/features/profile/managers/profileViewModel.dart';
import 'package:recipefoodapp/features/profile/widgets/profile_page_button.dart';
import 'package:recipefoodapp/features/topChef/pages/following_container.dart';
import '../../../core/utils/Appcolors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late ProfileViewModel vm;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    vm = ProfileViewModel(ProfileRepository(client: ApiClient()));
    vm.getProfileDetails();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileViewModel>.value(
      value: vm,
      child: Consumer<ProfileViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.profile == null) {
            return const Center(child: Text("Ma'lumot topilmadi"));
          }

          final profile = vm.profile!;
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: const BottomNavBar(),
            body: Padding(
              padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 50.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(53.r),
                        child: Image.network(
                          profile.profilePhoto,
                          width: 102.w,
                          height: 97.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 13.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                profile.firstName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: Appcolors().redpinkmain,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                profile.lastName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: Appcolors().redpinkmain,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '@${profile.username}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Appcolors().pinkSub,
                            ),
                          ),
                          Text(
                            profile.presentation,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          _circleButton(Icons.add),
                          SizedBox(width: 8.w),
                          _circleButton(Icons.menu),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                        child: ProfilePageButton(
                          text: 'Edit Profile',
                          onTap: () {},
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: ProfilePageButton(
                          text: 'Share Profile',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  FollowingContainer(
                    recipes: profile.recipesCount.toString(),
                    following: profile.followingCount.toString(),
                    followers: profile.followerCount.toString(),
                  ),
                  Center(
                    child: IconButton(
                      onPressed: () {
                        context.read<ThemeViewModel>().toggleTheme();
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Appcolors().pink,
                      ),
                      icon: const Icon(Icons.brightness_6),
                    ),
                  ),
                  TabBar(
                    controller: _tabController,
                    labelColor: Appcolors().redpinkmain,
                    unselectedLabelColor: Appcolors().pinkSub,
                    indicatorColor: Appcolors().redpinkmain,
                    tabs: [
                      Tab(
                        text: "Recipe",
                      ),
                      Tab(
                        text: "Favorites",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                          itemBuilder: (BuildContext context, int index) {

                          },
                        ),
                        Placeholder(color: Colors.green),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _circleButton(IconData icon) {
    return Container(
      width: 28.w,
      height: 28.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Appcolors().pink,
      ),
      child: Icon(icon, color: Appcolors().redpinkmain, size: 18.sp),
    );
  }
}
