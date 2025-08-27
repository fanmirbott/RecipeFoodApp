import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/features/topChef/managers/chefDetailViewModel.dart';


class FollowingContainer extends StatefulWidget {
  final String recipes;
  final String following;
  final String followers;

  const FollowingContainer({
    super.key,
    required this.recipes,
    required this.following,
    required this.followers,
  });

  @override
  State<FollowingContainer> createState() => _FollowingContainerState();
}

class _FollowingContainerState extends State<FollowingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _borderColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _borderColorAnimation = _controller.drive(
      ColorTween(
        begin: Colors.pink,
        end: Colors.blue,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChefDetailViewModel>(
      builder: (context, vm, child) => AnimatedBuilder(
        animation: _borderColorAnimation,
        builder: (context, child) {
          return Container(
            width: 356.w,
            height: 50.h,
            decoration: BoxDecoration(
              border: Border.all(color: _borderColorAnimation.value!, width: 2),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      vm.chef?.recipesCount.toString() ?? '0',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      'Recipes',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Container(height: 30.h, width: 1.w, color: _borderColorAnimation.value),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      vm.chef?.followingCount.toString() ?? '0',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Container(height: 30.h, width: 1.w, color: _borderColorAnimation.value),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      vm.chef?.followerCount.toString() ?? '0',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
