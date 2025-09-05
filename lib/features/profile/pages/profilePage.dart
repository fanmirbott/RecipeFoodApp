import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/data/repositories/profile/profileRepostory.dart';
import 'package:recipefoodapp/features/common/bottomNavigationBar/bottom_nav_bar.dart';
import 'package:recipefoodapp/features/profile/managers/profileViewModel.dart';
import 'package:recipefoodapp/features/profile/widgets/profile_page_button.dart';
import 'package:recipefoodapp/features/recipes/widgets/profilePageGridView.dart';
import 'package:recipefoodapp/features/topChef/pages/following_container.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/Appcolors.dart';
import '../../../core/utils/theme_view_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(
        ProfileRepository(client: ApiClient()),
      )..getProfileDetails(),
      child: Consumer<ProfileViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (vm.profile == null) {
            return Center(child: Text("Ma'lumot topilmadi"));
          }
          final profile = vm.profile!;
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: const BottomNavBar(),
            body: Padding(
              padding: EdgeInsetsGeometry.only(top: 20),
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: MyPersistentHeaderDelegate(profile: profile),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ProfilePageButton(
                                  text: 'Edit Profile',
                                  onTap: () {
                                    context.read<ThemeViewModel>().toggleTheme();
                                  },
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
                          SizedBox(height: 8.h),
                          FollowingContainer(
                            recipes: profile.recipesCount.toString(),
                            following: profile.followingCount.toString(),
                            followers: profile.followerCount.toString(),
                          ),
                          SizedBox(height: 12.h),
                          TabBar(
                            controller: _tabController,
                            labelColor: AppColors.redPinkMain,
                            indicatorColor: AppColors.redPinkMain,
                            dividerColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: const [
                              Tab(text: "Recipe"),
                              Tab(text: "Favorites"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    CustomScrollView(
                      slivers: [
                        ProfilePageGridview(),
                      ],
                    ),
                    CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 200,),
                              Text("Layk bosilgan receptlar"),
                            ],
                          )),
                        ),
                      ],
                    ),
                  ],
                )

              ),
            ),
          );
        },
      ),
    );
  }
}


class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final dynamic profile;
  MyPersistentHeaderDelegate({required this.profile});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / (maxExtent - minExtent);
    final clamped = progress.clamp(0.0, 1.0);

    final double imageSize = (102.w * (1 - clamped)) + (60.w * clamped);

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(53.r),
            child: Image.network(
              profile.profilePhoto,
              width: imageSize,
              height: imageSize,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 13.w),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: clamped < 0.7
                  ? Column(
                key: const ValueKey("full"),
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        profile.firstName,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: AppColors.redPinkMain,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        profile.lastName,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: AppColors.redPinkMain,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "@${profile.username}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.pinkSub,
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
              )
                  : Row(
                key: const ValueKey("compact"),
                children: [
                  Text(
                    "${profile.firstName} ${profile.lastName}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: AppColors.redPinkMain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              context.push(Routes.addRecipe);
            },
            child: Container(
              width: 28.w,
              height: 28.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.pink
              ),
              child: Icon(Icons.add, color: AppColors.redPinkMain,),
            ),
          ),
          SizedBox(width: 5.w,),
          GestureDetector(
            onTap: (){
              context.push(Routes.profileMenu);
            },
            child: Container(
              width: 28.w,
              height: 28.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.pink
              ),
              child: Icon(Icons.menu, color: AppColors.redPinkMain,),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 150.h;

  @override
  double get minExtent => 90.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
