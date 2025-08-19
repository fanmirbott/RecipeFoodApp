import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/data/repositories/preferencesRepostory.dart';
import '../../../../../../core/utils/Appcolors.dart';
import '../../../../managers/PreferencesViewModel.dart';
import '../widgets/PrefferencesBottom.dart';

class Allergicpage extends StatelessWidget {
  final PageController controller;

  const Allergicpage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.only(bottom: 35, right: 130, left: 130),
        child: PreferencesBottom(
          iconButtonText: "Continue",
          onPressed: () {
            context.push('/loginPage');
          },
          buttonColor: Appcolors().pinkSub,
          textColor: Appcolors().white,
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => PreferencesViewModel(PreferencesRepository(ApiClient())),
        builder: (context, child) => Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30),
          child: Consumer<PreferencesViewModel>(
            builder: (context, vm, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 55),
                Text(
                  "Do you have any allergies?",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Appcolors().white,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Leo ornare ullamcorper viverra ultrices in.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Appcolors().white,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    itemCount: vm.allergicProducts.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(11.74),
                          child: Image.network(
                            vm.allergicProducts[index]["image"],
                            width: 98,
                            height: 98,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          vm.allergicProducts[index]["title"],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Appcolors().white,
                          ),
                        ),
                      ],
                    ),
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 21,
                        ),
                  ),
                ),
                 SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
