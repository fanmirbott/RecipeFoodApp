import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/appDetails/bottom_nav_bar.dart';
import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/data/repositories/ReviewsRepostory.dart';
import 'package:recipefoodapp/features/home/recipes/pages/LeaveReviewPage.dart';
import 'package:recipefoodapp/features/managers/ReviewsViewModel.dart';
import '../../../../core/utils/Appcolors.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ReviewsViewModel(repository: ReviewsRepostory(ApiClient()), id: id),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Appcolors().backgroundBegie,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: SvgPicture.asset("assets/Icons/back-arrow.svg"),
          ),
          centerTitle: true,
          title: Text(
            'Reviews',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Appcolors().redpinkmain,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
        body: Consumer<ReviewsViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (vm.errorMessage != null) {
              return Center(child: Text("Error: ${vm.errorMessage}"));
            }
            if (vm.recipeData == null) {
              return const Center(child: Text("No data"));
            }
            final detail = vm.recipeData!;
            final int rating = (detail['rating'] as num).toInt();
            final int reviewsCount = (detail['reviewsCount'] as num).toInt();
            final user = detail['user'];

            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 224.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Appcolors().redpinkmain,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.r),
                        child: Image.network(
                          detail['photo'],
                          width: 162.26.w,
                          height: 162.26.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        width: 210.w,
                        height: 132.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              detail['title'],
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Appcolors().white,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                RatingStars(rating: rating),
                                SizedBox(width: 5.w),
                                Text(
                                  "($reviewsCount Reviews)",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    17.r,
                                  ),
                                  child: Image.network(
                                    detail['user']['profilePhoto'],
                                    width: 33.w,
                                    height: 33.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '@${detail['user']['username']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: Appcolors().white,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          maxLines: 1,
                                          detail['user']['firstName'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13,
                                            color: Appcolors().white,
                                          ),
                                        ),
                                        Text(
                                          maxLines: 1,
                                          ' ${detail['user']['lastName']} - Chef',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13,
                                            color: Appcolors().white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LeaveReviewPage(
                                      id: vm.id,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 126.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20.r,
                                  ),
                                  color: Appcolors().white,
                                ),
                                child: Text(
                                  'Add Review',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Appcolors().redpinkmain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class RatingStars extends StatelessWidget {
  final int rating;
  final int maxRating;

  const RatingStars({
    super.key,
    required this.rating,
    this.maxRating = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(maxRating.toInt(), (index) {
        if (index < rating.toInt()) {
          return SvgPicture.asset('assets/Icons/star-filled.svg',);
        } else {
          return SvgPicture.asset('assets/Icons/star-empty.svg',);
        }
      }),
    );
  }
}
