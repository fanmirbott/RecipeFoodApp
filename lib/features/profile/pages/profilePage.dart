import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/core/utils/provider.dart';
import 'package:recipefoodapp/data/repositories/profile/profileRepostory.dart';
import 'package:recipefoodapp/features/common/bottomNavigationBar/bottom_nav_bar.dart';
import 'package:recipefoodapp/features/profile/managers/profileViewModel.dart';
import 'package:recipefoodapp/features/profile/widgets/profile_page_button.dart';
import 'package:recipefoodapp/features/recipes/widgets/profilePageGridView.dart';
import 'package:recipefoodapp/features/topChef/pages/following_container.dart';
import '../../../core/utils/Appcolors.dart';

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
    _tabController = TabController(length: 3, vsync: this);
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
        ProfileRepository(
          client: ApiClient(),
        ),
      )..getProfileDetails(),
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
            body: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: MyPersistentHeaderDelegate(profile: profile),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
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
                        SizedBox(height: 8.h),
                        FollowingContainer(
                          recipes: profile.recipesCount.toString(),
                          following: profile.followingCount.toString(),
                          followers: profile.followerCount.toString(),
                        ),
                        SizedBox(height: 12.h),

                        TabBar(
                          controller: _tabController,
                          labelColor: Appcolors().redpinkmain,
                          indicatorColor: Appcolors().redpinkmain,
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
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        CustomScrollView(
                          slivers: [
                            ProfilePageGridview(),
                          ],
                        ),
                        CustomScrollView(
                          slivers: [
                            const SliverToBoxAdapter(
                              child: Center(child: Text("Layk bosilgan Recipelar")),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              ],
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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
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
            child: Opacity(
              opacity: 1 - clamped,
              child: Column(
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
                    "@${profile.username}",
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
            ),
          ),
          const Spacer(),
          Icon(Icons.menu, color: Appcolors().redpinkmain),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 200.h;

  @override
  double get minExtent => 100.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
