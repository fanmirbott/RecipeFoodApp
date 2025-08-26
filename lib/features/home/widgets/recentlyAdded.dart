import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';
import '../../../../../data/repositories/recentlyAddedRepostory.dart';
import '../managers/RecentlyAddedModel.dart';

class RecentlyAdded extends StatefulWidget {
  const RecentlyAdded({super.key});

  @override
  State<RecentlyAdded> createState() => _RecentlyAddedState();
}

class _RecentlyAddedState extends State<RecentlyAdded> {
  List<bool> likedStates = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecentlyAddedViewModel(
        RecentlyAddedRepository(client: ApiClient()),
      ),
      child: Consumer<RecentlyAddedViewModel>(
        builder: (context, vm, child) {
          if (likedStates.length != vm.recentlyAdded.length) {
            likedStates = List.filled(vm.recentlyAdded.length, false);
          }

          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.recentlyAdded.isEmpty) {
            return const Center(child: Text("Ma'lumot topilmadi"));
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recently Added',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Appcolors().redpinkmain,
                  ),
                ),
                Row(
                  spacing: 18.w,
                  children: List.generate(vm.recentlyAdded.length, (index) {
                    final recipe = vm.recentlyAdded[index];
                    return SizedBox(
                      width: 168.52.w,
                      height: 195.h,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14.r),
                            child: Stack(
                              children: [
                                Image.network(
                                  recipe.photo,
                                  width: 168.52.w,
                                  height: 162.h,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 7.h,
                                  left: 132.w,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        likedStates[index] = !likedStates[index];
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
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              width: 168.52.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.r),
                                color: Appcolors().white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(recipe.title),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            recipe.rating.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Appcolors().pinkSub,
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            'assets/Icons/star.svg',
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 26.w),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/Icons/clock.svg',
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            recipe.timeRequired.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Appcolors().pinkSub,
                                            ),
                                          ),
                                          Text(" min", style: TextStyle(
                                            fontSize: 12, fontWeight: FontWeight.w400, color: Appcolors().pinkSub
                                          ),),
                                        ],
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
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
