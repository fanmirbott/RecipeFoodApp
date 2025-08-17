import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/cleint.dart';
import '../../../../core/utils/Appcolors.dart';
import '../../../../data/repositories/homePageRepostory.dart';
import '../../../managers/HomePageViewModel.dart';

class CategoryBottomBar extends StatefulWidget implements PreferredSizeWidget {
  const CategoryBottomBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(46.h);

  @override
  State<CategoryBottomBar> createState() => _CategoryBottomBarState();
}

class _CategoryBottomBarState extends State<CategoryBottomBar> {
  int activeCategory = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageViewModel(
        HomePageRepository(ApiClient()), // API client beramiz
      ),
      builder: (context, child) => Consumer<HomePageViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.categories.isEmpty) {
            return const Center(child: Text("Kategoriya topilmadi"));
          }
          return Padding(
            padding: EdgeInsets.only(left: 12.w, right: 30.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(vm.categories.length, (index) {
                  final title = vm.categories[index].title ?? "No title";
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        activeCategory = index;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Tanlangan kategoriya: $title",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 25,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.r),
                        color: activeCategory == index
                            ? Appcolors().redpinkmain
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          title,
                          style: TextStyle(
                            color: activeCategory == index
                                ? Appcolors().white
                                : Appcolors().redpinkmain,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
