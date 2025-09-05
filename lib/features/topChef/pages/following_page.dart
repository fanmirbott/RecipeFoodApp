import 'package:dio/src/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/data/repositories/chef/following_repository.dart';
import 'package:recipefoodapp/features/topChef/managers/following_view_model.dart';

class FollowingPage extends StatelessWidget {
  const FollowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FollowingViewModel(
        repository: FollowingRepository( client: ApiClient(),
        ),
      ),
      builder: (context, child) => Consumer<FollowingViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.errorMessage != null) {
            return Center(child: Text(vm.errorMessage!));
          }
          final following = vm.followings;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: (){
                context.pop();
              }, icon: Icon(Icons.arrow_back_ios)),
            ),
            body: Column(
              children: [
                ...List.generate(following.length, (index){
                  return Text(following[index].profilePhoto);
                })
              ],
            ),
          );
        },
      )
      ,
    );
  }
}
