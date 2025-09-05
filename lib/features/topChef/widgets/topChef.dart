import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/cleint.dart';
import '../../../../../core/utils/Appcolors.dart';
import '../../../data/repositories/chef/topChefRepostory.dart';
import '../managers/TopChefViewModel.dart';

class TopChef extends StatelessWidget {
  const TopChef({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TopChefViewModel(
        TopChefRepository(client: ApiClient()),
      ),
      child: Consumer<TopChefViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.topChef.isEmpty) {
            return const Center(child: Text("Ma'lumot topilmadi"));
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Chef',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.redPinkMain,
                  ),
                ),
                SizedBox(height: 10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(vm.topChef.length, (index) {
                      final chef = vm.topChef[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 9.w),
                        child: Column(
                          children: [
                              GestureDetector(
                                onTap: (){
                                context.push('/topChef');
                              },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6.r),
                                  child: Image.network(
                                    chef.profilePhoto,
                                    width: 82.69.w,
                                    height: 74.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            SizedBox(height: 2.h),
                            Text(
                              chef.firstName,
                              style: Theme.of(context).textTheme.bodyMedium
                            ),
                          ],
                        ),
                      );
                    }),
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
