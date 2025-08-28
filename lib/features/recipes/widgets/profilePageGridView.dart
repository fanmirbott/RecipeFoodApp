import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/data/repositories/recipe/communityRepostory.dart';
import 'package:recipefoodapp/features/community/managers/CommuntyViewModel.dart';

import '../../../core/utils/Appcolors.dart';

class ProfilePageGridview extends StatelessWidget {
  const ProfilePageGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommunityViewModel(
        CommunityRepository(ApiClient()),
      ),
      builder: (context, child) => Consumer<CommunityViewModel>(
        builder: (context, vm, child) {
          if (vm.recipes.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(child: Text("Receptlar yo‘q")),
            );
          }

          return SliverPadding(
            padding: EdgeInsets.only(
              left: 37.w,
              right: 37.w,
              bottom: 100.h,
              top: 20.h,
            ),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return SizedBox(
                    width: 168.w,
                    height: 226.h,
                    child: GestureDetector(
                      onTap: () {},
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 158.w,
                              height: 88.h,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.r),
                                color: Appcolors().white,
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 10.w,
                                  left: 10.w,
                                  top: 17.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      vm.recipes[index].title,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Appcolors().brownLetters,
                                      ),
                                    ),
                                    Text(
                                      vm.recipes[index].description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 13.w,
                                        fontWeight: FontWeight.w300,
                                        color: Appcolors().brownLetters,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              vm.recipes[index].rating.toString(),
                                              style: TextStyle(
                                                color: Appcolors().pinkSub,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(width: 4.w),
                                            SvgPicture.asset(
                                              'assets/Icons/star.svg',
                                              width: 10.w,
                                              height: 10.h,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/Icons/clock.svg',
                                              width: 10.w,
                                              height: 10.h,
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              vm.recipes[index].timeRequired.toString(),
                                              style: TextStyle(
                                                color: Appcolors().pinkSub,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const Text(" min"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14.r),
                            child: Image.network(
                              vm.recipes[index].photo,
                              width: 169.w,
                              height: 153.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: vm.recipes.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 31,
                crossAxisSpacing: 18,
                mainAxisExtent: 226.h,
              ),
            ),
          );
        },
      ),
    );
  }
}
