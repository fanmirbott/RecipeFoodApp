import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/features/common/bottomNavigationBar/bottom_nav_bar.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/core/router/routerName.dart';
import 'package:recipefoodapp/data/repositories/recipe/communityRepostory.dart';
import 'package:recipefoodapp/features/common/appBar/app_bar_home.dart';
import 'package:recipefoodapp/features/community/widgets/CommunityBottomBar.dart';
import 'package:recipefoodapp/features/community/managers/CommuntyViewModel.dart';

import '../../../../../core/utils/Appcolors.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  List<bool> likedStates = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommunityViewModel(CommunityRepository(ApiClient()), ),
      builder: (context, child) => Consumer<CommunityViewModel>(
        builder: (context, vm, child) {
          if (likedStates.length != vm.recipes.length) {
            likedStates = List.filled(vm.recipes.length, false);
          }
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.recipes.isEmpty) {
            return const Center(child: Text("No recipes found"));
          }
          return Scaffold(
            extendBody: true,
            appBar: AppBarHome(
              title: "Community",
              bottom: CommunityBottomBar(),
            ),
            bottomNavigationBar: BottomNavBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.only(
                  right: 36,
                  left: 36,
                  bottom: 100,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 22.h,
                    ),
                    ...List.generate(vm.recipes.length, (index) {
                      final items = vm.recipes[index];
                      return SizedBox(
                        width: 356.w,
                        height: 319.5.h,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 14,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(17.r),
                                  child: Image.network(
                                    items.user.profilePhoto,
                                    width: 35.w,
                                    height: 35.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '@${items.user.username}',
                                      style: Theme.of(context).textTheme.bodySmall
                                    ),
                                    Text(
                                      '${items.created.month.toString()} Month ago',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Appcolors().pinkSub,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                context.push(Routers.recipe, extra: items.id);
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadiusGeometry.only(
                                      topRight: Radius.circular(14.r),
                                      topLeft: Radius.circular(14.r),
                                    ),
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          items.photo,
                                          width: 356.w,
                                          height: 173.h,
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          top: 11.h,
                                          left: 317.w,
                                          right: 11.w,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                likedStates[index] =
                                                    !likedStates[index];
                                              });
                                            },
                                            child: Container(
                                              width: 28.w,
                                              height: 28.h,
                                              decoration: BoxDecoration(
                                                color: likedStates[index]
                                                    ? Appcolors().redpinkmain
                                                    : Appcolors().pink,
                                                shape: BoxShape.circle,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/Icons/like.svg',
                                                width: 15.w,
                                                height: 15.h,
                                                fit: BoxFit.none,
                                                color: likedStates[index]
                                                    ? Appcolors().white
                                                    : Appcolors().pinkSub,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsetsGeometry.only(
                                      right: 15,
                                      left: 15,
                                      top: 4,
                                      bottom: 6,
                                    ),
                                    width: 356.w,
                                    height: 79.h,
                                    decoration: BoxDecoration(
                                      color: Appcolors().redpinkmain,
                                      borderRadius: BorderRadiusGeometry.only(
                                        bottomRight: Radius.circular(14.r),
                                        bottomLeft: Radius.circular(14.r),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          spacing: 5,
                                          children: [
                                            Text(
                                              items.title,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Appcolors().white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            SvgPicture.asset(
                                              'assets/Icons/star-filled.svg',
                                            ),
                                            Text(
                                              items.rating.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Appcolors().white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 258.w,
                                              height: 45.h,
                                              child: Text(
                                                items.description,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color: Appcolors().white,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  spacing: 4,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/Icons/clock.svg',
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                            Appcolors().white,
                                                            BlendMode.srcIn,
                                                          ),
                                                    ),
                                                    Text(
                                                      '${items.timeRequired.toString()} min',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color:
                                                            Appcolors().white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  spacing: 4,
                                                  children: [
                                                    Text(
                                                      items.reviewsCount
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color:
                                                            Appcolors().white,
                                                      ),
                                                    ),
                                                    SvgPicture.asset(
                                                      'assets/Icons/reviews.svg',
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                            Appcolors().white,
                                                            BlendMode.srcIn,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
