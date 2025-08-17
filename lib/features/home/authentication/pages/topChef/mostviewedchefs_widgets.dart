import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/data/repositories/topChefRepostory.dart';
import 'package:recipefoodapp/features/managers/TopChefViewModel.dart';

import '../../../../../core/utils/Appcolors.dart';

class ChefsWidgetsMost extends StatefulWidget {
  const ChefsWidgetsMost({super.key});

  @override
  State<ChefsWidgetsMost> createState() => _ChefsWidgetsMostState();
}

class _ChefsWidgetsMostState extends State<ChefsWidgetsMost> {
  late List<bool> isFollowing;

  @override
  void initState() {
    super.initState();

    isFollowing = List.generate(2, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TopChefViewModel(
        TopChefRepository(client: ApiClient()),
      ),
      builder: (context, child) => Consumer<TopChefViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.topChef.isEmpty) {
            return const Center(child: Text("Malumotlar yo'q"));
          }

          return Container(
            width: 430.w,
            height: 285.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Appcolors().redpinkmain,
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 36),
              child: Column(
                spacing: 9,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(),
                  Text(
                    'Most viewed chefs',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Appcolors().white,
                    ),
                  ),
                  Row(
                    spacing: 15,
                    children: List.generate(
                      vm.topChef.length > 2 ? 2 : vm.topChef.length,
                      (index) {
                        final chef = vm.topChef[index];
                        return SizedBox(
                          width: 170.w,
                          height: 217.h,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: 160.w,
                                  height: 80.h,
                                  decoration: BoxDecoration(
                                    color: Appcolors().white,
                                    borderRadius: BorderRadius.circular(14.r),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      right: 10,
                                      left: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${chef.firstName} ${chef.lastName} - Chef',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                            color: Appcolors().backgroundBegie,
                                          ),
                                        ),
                                        Text(
                                          '@${chef.username}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color: Appcolors().redpinkmain,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '30237',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Appcolors().pinkSub,
                                                  ),
                                                ),
                                                SizedBox(width: 3.w),
                                                SvgPicture.asset(
                                                  'assets/Icons/star.svg',
                                                  width: 12,
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isFollowing[index] =
                                                      !isFollowing[index];
                                                });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 55.w,
                                                height: 18.h,
                                                decoration: BoxDecoration(
                                                  color: isFollowing[index]
                                                      ? Appcolors().pink
                                                      : Appcolors().redpinkmain,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        30.r,
                                                      ),
                                                ),
                                                child: Text(
                                                  isFollowing[index]
                                                      ? 'Following'
                                                      : 'Follow',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Appcolors().white,
                                                    fontSize: 9,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Image.asset(
                                              'assets/IconsApp/share.png',
                                              width: 14.w,
                                              height: 14.h,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14.r),
                              child: Image.network(
                                chef.profilePhoto,
                                width: 170.w,
                                height: 153.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )

                          ],
                          ),
                        );
                      },
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
}
