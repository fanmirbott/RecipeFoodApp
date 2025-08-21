import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/appDetails/bottom_nav_bar.dart';
import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/data/repositories/topChefRepostory.dart';
import 'package:recipefoodapp/features/managers/TopChefViewModel.dart';
import 'package:recipefoodapp/features/managers/chefDetailViewModel.dart';
import '../../../../../../core/utils/Appcolors.dart';
import '../widgets/mostviewedchefs_widgets.dart';

class TopChefPage extends StatefulWidget {
  const TopChefPage({super.key});

  @override
  State<TopChefPage> createState() => _TopChefPageState();
}

class _TopChefPageState extends State<TopChefPage> {
  late List<bool> isFollowing;


  @override
  void initState() {
    super.initState();
    isFollowing = List.generate(8, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          TopChefViewModel(TopChefRepository(client: ApiClient())),
      builder: (context, child) => Consumer<TopChefViewModel>(
        builder: (context, vm, child) => Scaffold(
          extendBody: true,
          appBar: AppBar(
            backgroundColor: Appcolors().backgroundBegie,
            leading: IconButton(
              onPressed: () => context.pop('/homePage'),
              icon: SvgPicture.asset("assets/Icons/back-arrow.svg"),
            ),
            centerTitle: true,
            title: Text(
              "Top Chef",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Appcolors().redpinkmain,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(backgroundColor: Appcolors().pink),
                icon: SvgPicture.asset("assets/Icons/notification.svg"),
              ),
              IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(backgroundColor: Appcolors().pink),
                icon: SvgPicture.asset("assets/Icons/search.svg"),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ChefsWidgetsMost(),
                Padding(
                  padding: EdgeInsetsGeometry.only(right:  36, left: 36, bottom: 100),
                  child: Column(
                    children: [
                      Column(
                        spacing: 9,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(),
                          Text(
                            'Most Liked chefs',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Appcolors().redpinkmain,
                            ),
                          ),
                          Row(
                            spacing: 15,
                            children: [
                              ...List.generate(
                                vm.topChefView.length > 2
                                    ? 2
                                    : vm.topChefView.length,
                                (index) {
                                  final chef = vm.topChefView[index];
                                  return GestureDetector(
                                    onTap: (){
                                      context.read<ChefDetailViewModel>().getChefDetails(vm.topChefView[index].id);
                                      context.push('/chefDetail',);
                                    },
                                    child: SizedBox(
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
                                                borderRadius:
                                                    BorderRadius.circular(14.r),
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
                                                      '${chef.firstName} ${chef.lastName}-Chef',
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 11,
                                                        color: Appcolors()
                                                            .backgroundBegie,
                                                      ),
                                                    ),
                                                    Text(
                                                      '@${chef.username}',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: Appcolors()
                                                            .redpinkmain,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              '30237',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Appcolors()
                                                                    .pinkSub,
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
                                                            alignment:
                                                                Alignment.center,
                                                            width: 55.w,
                                                            height: 18.h,
                                                            decoration: BoxDecoration(
                                                              color:
                                                                  isFollowing[index]
                                                                  ? Appcolors()
                                                                        .pink
                                                                  : Appcolors()
                                                                        .redpinkmain,
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Appcolors()
                                                                    .white,
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
                                              borderRadius: BorderRadius.circular(
                                                14.r,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(
                                                    0.3,
                                                  ),
                                                  spreadRadius: 2,
                                                  blurRadius: 8,
                                                  offset: Offset(0, 4),
                                                ),
                                              ],
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                14.r,
                                              ),
                                              child: Image.network(
                                                chef.profilePhoto,
                                                width: 170.w,
                                                height: 153.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 9,
                        children: [
                          SizedBox(),
                          Text(
                            'New chefs',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Appcolors().redpinkmain,
                            ),
                          ),
                          Row(
                            spacing: 15,
                            children: [
                              ...List.generate(
                                vm.topChefData.length > 2
                                    ? 2
                                    : vm.topChefData.length,
                                (index) {
                                  final chef = vm.topChefData[index];
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
                                              borderRadius:
                                                  BorderRadius.circular(14.r),
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 11,
                                                      color: Appcolors()
                                                          .backgroundBegie,
                                                    ),
                                                  ),
                                                  Text(
                                                    '@${chef.username}',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Appcolors()
                                                          .redpinkmain,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '30237',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Appcolors()
                                                                  .pinkSub,
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
                                                          alignment:
                                                              Alignment.center,
                                                          width: 55.w,
                                                          height: 18.h,
                                                          decoration: BoxDecoration(
                                                            color:
                                                                isFollowing[index]
                                                                ? Appcolors()
                                                                      .pink
                                                                : Appcolors()
                                                                      .redpinkmain,
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Appcolors()
                                                                  .white,
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
                                            borderRadius: BorderRadius.circular(
                                              14.r,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.3,
                                                ),
                                                spreadRadius: 2,
                                                blurRadius: 8,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              14.r,
                                            ),
                                            child: Image.network(
                                              chef.profilePhoto,
                                              width: 170.w,
                                              height: 153.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
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
        ),
      ),
    );
  }
}

// final chef = index < vm.topChef.length ? vm.topChef[index] : null;
// if (chef == null) {
// return Container(
// width: 170.w,
// height: 217.h,
// decoration: BoxDecoration(
// color: Colors.grey[300],
// borderRadius: BorderRadius.circular(14.r),
// ),
// child: Center(
// child: Column(
// spacing: 5,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [CircularProgressIndicator(),
// Text('Loading')
// ])
// ),
// );
// }
